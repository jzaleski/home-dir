#!/usr/bin/env python


import os, re, sys, time


class TodoProcessor(object):
    DEFAULT_LIST_NAME = 'TODO'

    def __init__(self, list_name=None):
        self._list_name = list_name or self.DEFAULT_LIST_NAME

    @property
    def database(self):
        if not hasattr(self, '_database'):
            self._database = self._get_database()
        return self._database

    @property
    def database_file_path(self):
        if not hasattr(self, '_database_file_path'):
            self._database_file_path = self._get_database_file_path()
        return self._database_file_path

    @property
    def list_name(self):
        return self._list_name

    @property
    def timestamp(self):
        if not hasattr(self, '_timestamp'):
            self._timestamp = int(time.time())
        return self._timestamp

    @property
    def valid_buckets(self):
        if not hasattr(self, '_valid_buckets'):
            self._valid_buckets = self._get_valid_buckets()
        return self._valid_buckets

    def process(self, *args):
        self._ensure_database_exists()
        if not args:
            return self._render()
        if not re.match(r'^[1-9][0-9]*(:[1-9][0-9]*)*$', args[0]):
            return self._add(message=' '.join(args))
        index = int(args[0]) - 1
        if not args[1:]:
            return self._render(index)
        operation = args[1]
        if operation in ['d', 'done']:
            return self._done(index)
        elif operation in ['e', 'edit']:
            return self._edit(index, ' '.join(args[2:]))
        elif operation in ['r', 'remove']:
            return self._remove(index)
        else:
            return False

    def _add(self, message=None):
        if not message:
            return False
        datum = {
            'created_timestamp': self.timestamp,
            'updated_timestamp': self.timestamp,
            'message': message,
        }
        self.database.setdefault('a', []).append(datum)
        return self._write_database()

    def _done(self, index=0):
        if index < 0:
            return False
        datum = self.database['a'].pop(index)
        datum['updated_timestamp'] = self.timestamp
        self.database.setdefault('d', []).append(datum)
        return self._write_database()

    def _edit(self, index=0, message=None):
        if index < 0 or not message:
            return False
        datum = self.database['a'][index]
        datum['updated_timestamp'] = self.timestamp
        datum['message'] = message
        return self._write_database()

    def _ensure_database_exists(self):
        database_file_path = self.database_file_path
        database_dirname = os.path.dirname(database_file_path)
        if database_dirname and not os.path.isdir(database_dirname):
            os.makedirs(database_dirname)
        if not os.path.isfile(database_file_path):
            open(self.database_file_path, 'w').close()

    def _get_bucket(self, bucket):
        return self.database.get(bucket, [])

    def _get_database(self):
        return self._read_database()

    def _get_database_file_path(self):
        list_name = self.list_name
        env_var = '%s_DATABASE' % list_name
        if os.getenv(env_var):
            return os.getenv(env_var)
        if os.path.isfile(list_name):
            return list_name
        return os.path.join(
            os.getenv('HOME'),
            'var',
            'db',
            list_name
        )

    def _get_valid_buckets(self):
        return {
            'a',
            'd',
            'r',
        }

    def _read_database(self):
        database = {}
        with open(self.database_file_path) as database_file:
            for line in database_file:
                line_parts = line.rstrip("\r\n").split("\t")
                if not line_parts:
                    continue
                bucket = line_parts[0]
                if bucket not in self.valid_buckets:
                    continue
                created_timestamp = line_parts[1]
                if not created_timestamp:
                    continue
                updated_timestamp = line_parts[2]
                if not updated_timestamp:
                    continue
                message = line_parts[3]
                if not message:
                    continue
                datum = {
                    'created_timestamp': int(created_timestamp),
                    'updated_timestamp': int(updated_timestamp),
                    'message': message,
                }
                database.setdefault(bucket, []).append(datum)
        return database

    def _remove(self, index=0):
        if index < 0:
            return False
        datum = self.database['a'].pop(index)
        datum['updated_timestamp'] = self.timestamp
        self.database.setdefault('r', []).append(datum)
        return self._write_database()

    def _render(self, index=None):
        data = self._get_bucket('a')
        if not data:
            print('No results')
            return True
        for datum_index, datum in enumerate(data):
            if not index or datum_index == index:
                print('%3d. %s' % (datum_index + 1, datum['message']))
        return True

    def _write_database(self):
        with open(self.database_file_path, 'w') as database_file:
            for bucket, data in self.database.items():
                for datum in data:
                    database_file.write("%s\t%d\t%d\t%s%s" % (
                        bucket,
                        datum['created_timestamp'],
                        datum['updated_timestamp'],
                        datum['message'],
                        os.linesep
                    ))
        return True


if __name__ == '__main__':
    processor = TodoProcessor(os.getenv('LIST_NAME'))
    result = processor.process(*sys.argv[1:])
    sys.exit(0 if result else 1)
