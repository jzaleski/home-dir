#!/usr/bin/env bash

# validate args
if [ $# -lt 1 ]; then
  echo "Usage: uber_kill <pid> ...";
  exit 2;
fi

# process args
pids=$@;
term_attempts=${TERM_ATTEMPTS:-1};
term_sleep=${TERM_SLEEP:-5};

# retry then sleep (the loop will exit when "kill" sets an error exit-code or
# when the maximum number of attempts is reached)
for n in $(seq $term_attempts); do
  kill -15 $pids > /dev/null 2>&1 || break;
  sleep $term_sleep;
done

# regardless, send SIGKILL
kill -9 $pids > /dev/null 2>&1;

# determine exit-code
if $(kill -0 $pids > /dev/null 2>&1); then
  # one or more processes still exist, set error exit-code
  exit 1;
else
  # no matching processes exist, set success exit-code
  exit 0;
fi
