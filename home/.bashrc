# Set up "history"
export HISTSIZE=100000;
export HISTFILESIZE=100000;
export HISTFILE=$HOME/.bash_history;

# Ensure that the HISTFILE exist(s)
if [ ! -e $HISTFILE ]; then
  touch $HISTFILE;
fi

# Ensure that the `SHELL` variable is properly set
export SHELL=bash;

# Don't require "cd" when changing directories
shopt -s autocd > /dev/null 2>&1;

# Disable the handling of minor errors in the spelling of a directory component
shopt -u cdspell > /dev/null 2>&1;

# Disable spelling correction on directory names during word completion
shopt -u dirspell > /dev/null 2>&1;

# Append to the history file, don't overwrite it
shopt -s histappend > /dev/null 2>&1;

# Allows the opportunity to re-edit a failed history substitution
shopt -s histreedit > /dev/null 2>&1;

# Allow bash to glob filenames in a case-insensitve manner
shopt -s nocaseglob > /dev/null 2>&1;

# "Homebrew" specific inclusions
HOMEBREW_PREFIX=`brew --prefix 2> /dev/null`;
if [ -n "$HOMEBREW_PREFIX" ]; then
  # If it exists, process [Homebrew] "bash_completion"
  BASH_COMPLETION_FILE=$HOMEBREW_PREFIX/etc/bash_completion;
  if [ -e $BASH_COMPLETION_FILE ]; then
    source $BASH_COMPLETION_FILE;
  fi
fi

# If it exists, process ".bash_aliases"
BASH_ALIASES_FILE=$HOME/.bash_aliases;
if [ -e $BASH_ALIASES_FILE ]; then
  source $BASH_ALIASES_FILE;
fi

# If it exists, process "bash_completion.sh"
BASH_COMPLETION_FILE=/etc/profile.d/bash_completion.sh;
if [ -e $BASH_COMPLETION_FILE ]; then
  source $BASH_COMPLETION_FILE;
fi

# If it exists, process ".bash_functions"
BASH_FUNCTIONS_FILE=$HOME/.bash_functions;
if [ -e $BASH_FUNCTIONS_FILE ]; then
  source $BASH_FUNCTIONS_FILE;
fi

# If it exists, process ".bash_prompt"
BASH_PROMPT_FILE=$HOME/.bash_prompt;
if [ -e $BASH_PROMPT_FILE ]; then
  source $BASH_PROMPT_FILE;
fi

# If it exists, process ".commonrc"
COMMONRC_FILE=$HOME/.commonrc;
if [ -e $COMMONRC_FILE ]; then
  source $COMMONRC_FILE;
fi

# Load any custom init-scripts (the filename *must* end-with ".bash")
CUSTOM_INIT_SCRIPTS_DIRECTORY=$HOME/.home_dir/init;
if [ -d $CUSTOM_INIT_SCRIPTS_DIRECTORY ]; then
  for f in `find "$CUSTOM_INIT_SCRIPTS_DIRECTORY" -type f -o -type l | \grep "\.bash\$" | sort`; do
    source $f;
  done
fi
