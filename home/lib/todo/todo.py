import os, sys

class TodoProcessor(object):
    @property
    def __database(self):
        if not hasattr(self, '__database__'):
            self.__database__ = self.__get_database()
        return self.__database__

    @property
    def __database_file_path(self):
        if not hasattr(self, '__database_file_path__'):
            self.__database_file_path__ = self.__get_database_file_path()
        return self.__database_file_path__

    @property
    def __valid_buckets(self):
        if not hasattr(self, '__valid_buckets__'):
            self.__valid_buckets__ = self.__get_valid_buckets()
        return self.__valid_buckets__

    def process(self, option, *args):
        self.__ensure_database_exists()

        if not option and not args:
            return self.__render()
        elif option in ['a', 'add']:
            return self.__add(' '.join(args))
        elif option in ['d', 'done']:
            return self.__done(int(args[0]) - 1)
        elif option in ['r', 'remove']:
            return self.__remove(int(args[0]) - 1)
        elif option in ['u', 'update']:
            return self.__update(int(args[0]) - 1, ' '.join(args[1:]))
        else:
            return False

    def __add(self, line):
        if not line:
            return False
        self.__database.setdefault('a', []).append(line)
        return self.__write_database()

    def __done(self, index):
        if index < 0:
            return False
        self.__database.setdefault('d', []).append(self.__database['a'].pop(index))
        return self.__write_database()

    def __ensure_database_exists(self):
        database_file_path = self.__database_file_path
        database_dirname = os.path.dirname(database_file_path)
        if database_dirname and not os.path.isdir(database_dirname):
            os.makedirs(database_dirname)
        if not os.path.isfile(database_file_path):
            open(self.__database_file_path, 'w').close()

    def __get_bucket(self, bucket):
        return self.__database.get(bucket, None)

    def __get_database(self):
        return self.__read_database()

    def __get_database_file_path(self):
        if os.getenv('TODO_DATABASE'):
            return os.getenv('TODO_DATABASE')
        elif os.path.isfile('TODO'):
            return 'TODO'
        else:
            return os.path.join(
                os.getenv('HOME'),
                'var',
                'db',
                'TODO'
            )

    def __get_valid_buckets(self):
        return [
            'a',
            'd',
            'r',
        ]

    def __read_database(self):
        database = {}
        with open(self.__database_file_path) as database_file:
            for line in database_file:
                line_parts = line.rstrip("\r\n").split(' ')
                if not line_parts:
                    continue
                bucket = line_parts[0]
                if bucket not in self.__valid_buckets:
                    continue
                message_parts = line_parts[1:]
                if not message_parts:
                    continue
                database.setdefault(bucket, []).append(' '.join(message_parts))
        return database

    def __remove(self, index):
        if index < 0:
            return False
        self.__database.setdefault('r', []).append(self.__database['a'].pop(index))
        return self.__write_database()

    def __render(self, bucket='a'):
        lines = self.__get_bucket(bucket)
        if lines:
            print os.linesep.join('%3d. %s' %
                (index + 1, line)
                for index, line in enumerate(lines)
            )
        else:
            print 'No results'

    def __write_database(self):
        with open(self.__database_file_path, 'w') as database_file:
            for bucket, lines in self.__database.iteritems():
                for line in lines:
                    database_file.write("%s %s%s" % (
                        bucket,
                        line,
                        os.linesep
                    ))
        return True

    def __update(self, index, line):
        if not line or index < 0:
            return False
        self.__database['a'][index] = line
        return self.__write_database()


if __name__ == '__main__':
    argv = sys.argv
    option = argv[1] if len(argv) >= 2 else None
    args = sys.argv[2:]
    processor = TodoProcessor()
    result = processor.process(option, *args)
    sys.exit(0 if result else 1)
