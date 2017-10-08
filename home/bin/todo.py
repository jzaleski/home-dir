#!/usr/bin/env python


import os, re, sys, time, uuid


class Processor(object):
    ADDED_BUCKET = 'a'
    DEFAULT_LIST_NAME = 'TODO'
    DEFAULT_PARENT_ID = uuid.UUID('00000000-0000-0000-0000-000000000000')
    DONE_BUCKET = 'd'
    REMOVED_BUCKET = 'r'

    @property
    def added(self):
        return (datum for datum in self.database \
            if datum.get('bucket') == self.ADDED_BUCKET)

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
    def done(self):
        return (datum for datum in self.database \
            if datum.get('bucket') == self.DONE_BUCKET)

    @property
    def list_name(self):
        if not hasattr(self, '_list_name'):
            self._list_name = self._get_list_name()
        return self._list_name

    @property
    def removed(self):
        return (datum for datum in self.database \
            if datum.get('bucket') == self.REMOVED_BUCKET)

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
        index = self._parse_index(args[0])
        if index is None:
            return self._add(message=' '.join(args))
        if not args[1:]:
            return self._render(index)
        operation = args[1]
        if operation in ['a', 'add']:
            return self._add(message=' '.join(args[1:]))
        elif operation in ['d', 'done']:
            return self._done(index)
        elif operation in ['e', 'edit']:
            return self._edit(index, ' '.join(args[2:]))
        elif operation in ['r', 'remove']:
            return self._remove(index)
        return False

    def _add(
        self,
        parent_id=None,
        message=None
    ):
        if not message:
            return False
        datum = {
            'id': uuid.uuid1(),
            'parent_id': parent_id or self.DEFAULT_PARENT_ID,
            'created_timestamp': self.timestamp,
            'updated_timestamp': self.timestamp,
            'bucket': self.ADDED_BUCKET,
            'message': message,
        }
        self.database.append(datum)
        return self._write_database()

    def _done(self, index=None):
        if not self.database:
            return False
        if index is None or index < 0:
            return False
        for datum_index, datum in enumerate(self.added):
            if datum_index == index:
                datum['updated_timestamp'] = self.timestamp
                datum['bucket'] = self.DONE_BUCKET
                return self._write_database()
        return False

    def _edit(
        self,
        index=None,
        message=None
    ):
        if not self.database:
            return False
        if \
            index is None or \
            index < 0 or \
            not message:
            return False
        for datum_index, datum in enumerate(self.added):
            if datum_index == index:
                datum['updated_timestamp'] = self.timestamp
                datum['message'] = message
                return self._write_database()
        return False

    def _ensure_database_exists(self):
        database_file_path = self.database_file_path
        database_dirname = os.path.dirname(database_file_path)
        if database_dirname and not os.path.isdir(database_dirname):
            os.makedirs(database_dirname)
        if not os.path.isfile(database_file_path):
            open(self.database_file_path, 'w').close()

    def _get_database(self):
        database = []
        with open(self.database_file_path) as database_file:
            for line in database_file:
                line_parts = line.rstrip("\r\n").split("\t")
                if not line_parts:
                    continue
                id_ = line_parts[0]
                if not id_:
                    continue
                parent_id = line_parts[1]
                if not parent_id:
                    continue
                created_timestamp = line_parts[2]
                if not created_timestamp:
                    continue
                updated_timestamp = line_parts[3]
                if not updated_timestamp:
                    continue
                bucket = line_parts[4]
                if bucket not in self.valid_buckets:
                    continue
                message = line_parts[5]
                if not message:
                    continue
                datum = {
                    'id': uuid.UUID(id_),
                    'parent_id': uuid.UUID(parent_id),
                    'created_timestamp': int(created_timestamp),
                    'updated_timestamp': int(updated_timestamp),
                    'bucket': bucket,
                    'message': message,
                }
                database.append(datum)
        return database

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

    def _get_list_name(self):
        return os.getenv('LIST_NAME', self.DEFAULT_LIST_NAME)

    def _get_valid_buckets(self):
        return {
            self.ADDED_BUCKET,
            self.DONE_BUCKET,
            self.REMOVED_BUCKET,
        }

    def _parse_index(self, index):
        if not re.match(r'^[0-9]+(:[0-9]+)*$', index):
            return None
        # TODO: Add support complex indices. For now the code-block below
        # short-circuits with the first part of what is parsed -- changing
        # `next` to `list` or to a list-comprehension will work/parse properly,
        # but will cause breakage upstream
        return next(int(index_part) - 1 for index_part in index.split(':'))

    def _remove(self, index=None):
        if not self.database:
            return False
        if index is None or index < 0:
            return False
        for datum_index, datum in enumerate(self.added):
            if datum_index == index:
                datum['updated_timestamp'] = self.timestamp
                datum['bucket'] = self.REMOVED_BUCKET
                return self._write_database()
        return False

    def _render(self, index=None):
        if not self.database:
            return False
        if index is not None and index < 0:
            return False
        for datum_index, datum in enumerate(self.added):
            if index is None or datum_index == index:
                print('%3d. %s' % (datum_index + 1, datum['message']))
            if datum_index == index:
                return True
        return index is None

    def _write_database(self):
        with open(self.database_file_path, 'w') as database_file:
            for datum in self.database:
                database_file.write(
                    "%s\t%s\t%d\t%d\t%s\t%s%s" % (
                        datum['id'],
                        datum['parent_id'],
                        datum['created_timestamp'],
                        datum['updated_timestamp'],
                        datum['bucket'],
                        datum['message'],
                        os.linesep,
                    )
                )
        return True


if __name__ == '__main__':
    processor = Processor()
    result = processor.process(*sys.argv[1:])
    sys.exit(0 if result else 1)
