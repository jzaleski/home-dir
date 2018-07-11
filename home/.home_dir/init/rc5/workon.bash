if [ -n "$SOURCE_DIRECTORY" ] && [ -d $SOURCE_DIRECTORY ]; then
  # change directories to the `$SOURCE_DIRECTORY`
  pushd $SOURCE_DIRECTORY > /dev/null;
  # process all of the `$project(s)`
  for project in `find . -maxdepth 1 -mindepth 1 -type d | sed 's/^.\///'`; do
    # workon a specific project (variant)
    alias cd-$project="cd $SOURCE_DIRECTORY/$project";
    # workon a specific project and open emacs at the project root
    alias emacs-$project="cd-$project && emacs .";
    # workon a specific project and open vim at the project root
    alias vim-$project="cd-$project && vim .";
    # workon a specific project
    alias workon-$project="cd-$project";
    # workon a specific project (short-hand)
    alias wo-$project="cd-$project";
  done
  # return the previous directory
  popd > /dev/null;
fi
