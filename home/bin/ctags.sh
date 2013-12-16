#!/bin/bash

# attempt to install the homebrew ctags library (if necessary)
if hash brew 2> /dev/null && ! brew --prefix ctags > /dev/null 2>&1;
then
  brew install ctags;
fi

# attempt to install "gem-ctags" (if necessary)
if hash rvm 2> /dev/null && ! gem list | \grep 'gem-ctags' > /dev/null 2>&1;
then
  bash -l -c "rvm gemset use global && gem install gem-ctags";
fi

# generate ctags for gems
gem ctags > /dev/null 2>&1 &

# verify that the ctags library is present
if hash ctags 2> /dev/null;
then
  # append a timestamp to the end of the "tags" file so that it can be built out
  # of band and then moved into the expected location (this means that  the last
  # process to finish will win)
  tag_file="tags.`date +%s`";
  ctags --tag-relative -Rf $tag_file --exclude=.git > /dev/null 2>&1 && mv $tag_file tags &
fi
