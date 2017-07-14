#/usr/bin/env bash

set -e;

# NOTE: The following 2 command-set(s) are [functionally] equivalent
#
# Darwin (OSX) - Requires: `fswatch`
# ----------------------------------
#
# fswatch \
#   --event Created \
#   --event Removed \
#   --event Updated \
#   --exclude \.git \
#   --recursive \
#   <directory_pattern>;
#
# Linux - Requires: `inotify-tools` + `libnotify-dev{,el}`
# --------------------------------------------------------
#
# inotifywait \
#   --event attrib,create,delete,modify \
#   --exclude \.git \
#   --monitor \
#   --quiet \
#   --recursive \
#   <directory_pattern> | \
#   awk '{print $1$3}';

echo 'TODO: Implement me!';

exit 1;
