#!/usr/bin/env fish

if test -n "$TYPE"
  set type $TYPE;
else if count $argv > /dev/null
  set type $argv[1];
end

if string match -q -r  "^node" "$type"
  printf $type > $PWD/.node-version;
else if string match -q -r  "^python" "$type"
  printf $type > $PWD/.python-version;
else if string match -q -r  "^[j]?ruby" "$type"
  printf $type > $PWD/.ruby-version;
else
  printf "Invalid environment-type: \"$type\"";
end

cd .;
