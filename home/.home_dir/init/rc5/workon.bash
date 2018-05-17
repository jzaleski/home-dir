if [ -n "$SOURCE_DIRECTORY" ] && [ -d $SOURCE_DIRECTORY ]; then
  for project_directory in `cd $SOURCE_DIRECTORY && find . -type d -maxdepth 1 -mindepth 1 | tr -d './'`; do
    # workon a specific project (variant)
    alias cd-$project_directory="cd $SOURCE_DIRECTORY/$project_directory";
    # workon a specific project and open emacs at the project root
    alias emacs-$project_directory="cd-$project_directory && emacs .";
    # workon a specific project and open vim at the project root
    alias vim-$project_directory="cd-$project_directory && vim .";
    # workon a specific project
    alias workon-$project_directory="cd-$project_directory";
    # workon a specific project (short-hand)
    alias wo-$project_directory="cd-$project_directory";
  done
fi
