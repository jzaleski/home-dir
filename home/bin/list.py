#!/usr/bin/env python


import os, getpass, re, sys, time, uuid


class Processor(object):
    ADDED_BUCKET = 'a'
    ADD_OPERATIONS = {'a', 'add'}
    BUCKET_PATTERN = r'^(a|added|d|done|r|removed)$'
    DEFAULT_PARENT_ID = uuid.UUID('00000000-0000-0000-0000-000000000000')
    DONE_BUCKET = 'd'
    DONE_OPERATIONS = {'d', 'done'}
    EDIT_OPERATIONS = {'e', 'edit'}
    INDEX_PATTERN = r'^[0-9]+$'
    OPERATION_PATTERN = r'^(a|add|d|done|e|edit|r|remove)$'
    REMOVED_BUCKET = 'r'
    REMOVE_OPERATIONS = {'r', 'remove'}
    VALID_BUCKETS = {
        ADDED_BUCKET,
        DONE_BUCKET,
        REMOVED_BUCKET,
    }

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
    def timestamp(self):
        if not hasattr(self, '_timestamp'):
            self._timestamp = self._get_timestamp()
        return self._timestamp

    @property
    def user(self):
        if not hasattr(self, '_user'):
            self._user = self._get_user()
        return self._user

    def process(self, *args):
        self._ensure_database_exists()
        if not args:
            return self._render(self.ADDED_BUCKET)
        if re.match(self.BUCKET_PATTERN, args[0]):
            return self._render(args[0][0])
        if not re.match(self.INDEX_PATTERN, args[0]):
            return self._add(message=' '.join(args))
        index = int(args[0]) - 1
        if index < 0:
            return False
        if not args[1:]:
            return False
        if not re.match(self.OPERATION_PATTERN, args[1]):
            return False
        operation = args[1]
        if operation in self.ADD_OPERATIONS:
            return self._add(message=' '.join(args[1:]))
        elif operation in self.DONE_OPERATIONS:
            return self._done(index)
        elif operation in self.EDIT_OPERATIONS:
            return self._edit(index, ' '.join(args[2:]))
        elif operation in self.REMOVE_OPERATIONS:
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
            'created_by_user': self.user,
            'updated_by_user': self.user,
            'created_timestamp': self.timestamp,
            'updated_timestamp': self.timestamp,
            'bucket': self.ADDED_BUCKET,
            'message': message,
        }
        self.database.append(datum)
        return self._write_database()

    def _done(self, index=None):
        bucket = self._get_bucket(self.ADDED_BUCKET)
        if not bucket:
            return False
        for datum_index, datum in enumerate(bucket):
            if datum_index != index:
                continue
            datum['updated_by_user'] = self.user
            datum['updated_timestamp'] = self.timestamp
            datum['bucket'] = self.DONE_BUCKET
            return self._write_database()
        return False

    def _edit(
        self,
        index=None,
        message=None
    ):
        if not message:
            return False
        bucket = self._get_bucket(self.ADDED_BUCKET)
        if not bucket:
            return False
        for datum_index, datum in enumerate(bucket):
            if datum_index != index:
                continue
            datum['updated_by_user'] = self.user
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

    def _get_bucket(self, bucket):
        return [
            datum
            for datum in self.database
            if datum['bucket'] == bucket
        ]

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
                created_by_user = line_parts[2]
                if not created_by_user:
                    continue
                updated_by_user = line_parts[3]
                if not updated_by_user:
                    continue
                created_timestamp = line_parts[4]
                if not created_timestamp:
                    continue
                updated_timestamp = line_parts[5]
                if not updated_timestamp:
                    continue
                bucket = line_parts[6]
                if bucket not in self.VALID_BUCKETS:
                    continue
                message = line_parts[7]
                if not message:
                    continue
                datum = {
                    'id': uuid.UUID(id_),
                    'parent_id': uuid.UUID(parent_id),
                    'created_by_user': created_by_user,
                    'updated_by_user': updated_by_user,
                    'created_timestamp': int(created_timestamp),
                    'updated_timestamp': int(updated_timestamp),
                    'bucket': bucket,
                    'message': message,
                }
                database.append(datum)
        return database

    def _get_database_file_path(self):
        list_name = os.getenv('LIST_NAME')
        assert(list_name)
        env_var = '%s_DATABASE' % list_name
        if os.getenv(env_var):
            return os.getenv(env_var)
        if os.path.isfile(list_name):
            return list_name
        return os.path.join(
            os.getenv('HOME'),
            '.list',
            list_name
        )

    def _get_timestamp(self):
        return int(time.time())

    def _get_user(self):
        return getpass.getuser()

    def _remove(self, index=None):
        bucket = self._get_bucket(self.ADDED_BUCKET)
        if not bucket:
            return False
        for datum_index, datum in enumerate(bucket):
            if datum_index != index:
                continue
            datum['updated_by_user'] = self.user
            datum['updated_timestamp'] = self.timestamp
            datum['bucket'] = self.REMOVED_BUCKET
            return self._write_database()
        return False

    def _render(self, bucket):
        bucket = self._get_bucket(bucket)
        if not bucket:
            return False
        for datum_index, datum in enumerate(bucket):
            print('%3d. %s' % (datum_index + 1, datum['message']))
        return True

    def _write_database(self):
        with open(self.database_file_path, 'w') as database_file:
            for datum in self.database:
                database_file.write(
                    "%s\t%s\t%s\t%s\t%d\t%d\t%s\t%s%s" % (
                        datum['id'],
                        datum['parent_id'],
                        datum['created_by_user'],
                        datum['updated_by_user'],
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
