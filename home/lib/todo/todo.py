import os, sys

database = os.getenv('TODO_DATABASE', os.path.join(
    os.getenv('HOME'),
    'var',
    'db',
    'todo'
))

if not os.path.isfile(database):
    print 'Database: "%s" does not exist' % database
    sys.exit(1)

default_bucket = 'current'

buckets = [
    'current',
    'done',
    'hold',
    'nevermind',
    'recurring',
]

bucket_map = { bucket: bucket[0] for bucket in buckets }

requested_bucket = sys.argv[1] if len(sys.argv) > 1 else default_bucket
if not requested_bucket in buckets:
    print 'Bucket "%s" does not exist (the valid buckets are: %s)' % (
        requested_bucket,
        ', '.join(buckets),
    )
    sys.exit(1)

results = {}
with open(database) as lines:
    for line in lines:
        line_parts = line.rstrip("\r\n").split(' ')
        bucket = line_parts[0]
        message_parts = line_parts[1:]
        if message_parts and bucket in bucket_map.itervalues():
            results.setdefault(bucket, []).append(' '.join(message_parts))

requested_results = results.get(bucket_map[requested_bucket])
if requested_results:
    print "\n".join('%3d. %s' %
        (index + 1, result)
        for index, result in enumerate(requested_results)
    )
else:
    print 'No results'
