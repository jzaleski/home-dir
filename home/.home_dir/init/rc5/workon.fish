if begin test -n "$SOURCE_DIRECTORY"; and test -d $SOURCE_DIRECTORY; end
  # change directories to the `$SOURCE_DIRECTORY`
  pushd $SOURCE_DIRECTORY > /dev/null;
  # process all of the `$project(s)`
  for project in (find . -maxdepth 1 -mindepth 1 -type d | sed 's/^.\///')
    # workon a specific project (variant)
    alias cd-$project="cd $SOURCE_DIRECTORY/$project";
    # workon a specific project and open emacs at the project root
    alias emacs-$project="cd-$project; and emacs .";
    # workon a specific project and open vim at the project root
    alias vim-$project="cd-$project; and vim .";
    # workon a specific project
    alias workon-$project="cd-$project";
    # workon a specific project (short-hand)
    alias wo-$project="cd-$project";
  end
  # return the previous directory
  popd > /dev/null;
end
