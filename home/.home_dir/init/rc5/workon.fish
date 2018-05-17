if begin test -n "$SOURCE_DIRECTORY"; and test -d $SOURCE_DIRECTORY; end
  for project_directory in (cd $SOURCE_DIRECTORY; and find . -type d -maxdepth 1 -mindepth 1 | tr -d './')
    # workon a specific project (variant)
    alias cd-$project_directory="cd $SOURCE_DIRECTORY/$project_directory";
    # workon a specific project and open emacs at the project root
    alias emacs-$project_directory="cd-$project_directory; and emacs .";
    # workon a specific project and open vim at the project root
    alias vim-$project_directory="cd-$project_directory; and vim .";
    # workon a specific project
    alias workon-$project_directory="cd-$project_directory";
    # workon a specific project (short-hand)
    alias wo-$project_directory="cd-$project_directory";
  end
end
