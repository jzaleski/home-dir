# "Homebrew" specific inclusions
HOMEBREW_PREFIX=`brew --prefix 2> /dev/null`;
if [ -n "$HOMEBREW_PREFIX" ]; then
  # If it exists, process [Homebrew] "bash_completion" file
  BASH_COMPLETION_FILE=$HOMEBREW_PREFIX/etc/bash_completion;
  if [ -f $BASH_COMPLETION_FILE ]; then
    source $BASH_COMPLETION_FILE;
  fi
fi

# Set up "history"
export HISTTIMEFORMAT='%Y-%m-%d %H:%M:%S - ';
export HISTSIZE=100000;
export HISTFILESIZE=100000;

# Append to the history file, don't overwrite it
shopt -s histappend > /dev/null 2>&1;

# Don't require "cd" when changing directories
shopt -s autocd > /dev/null 2>&1;

# Handle minor errors in the spelling of a directory component
shopt -s cdspell > /dev/null 2>&1;

# If it exists, process ".bash_prompt"
BASH_PROMPT_FILE=$HOME/.bash_prompt;
if [ -f $BASH_PROMPT_FILE ]; then
  source $BASH_PROMPT_FILE;
fi

# If it exists, process ".commonrc"
COMMONRC_FILE=$HOME/.commonrc;
if [ -f $COMMONRC_FILE ]; then
  source $COMMONRC_FILE;
fi

# If it exists, process ".bash_aliases"
BASH_ALIASES_FILE=$HOME/.bash_aliases;
if [ -f $BASH_ALIASES_FILE ]; then
  source $BASH_ALIASES_FILE;
fi

# If it exists, process ".common_keys"
COMMON_KEYS_FILE=$HOME/.common_keys;
if [ -f $COMMON_KEYS_FILE ]; then
  source $COMMON_KEYS_FILE;
fi

# If it exists, process ".bash_keys"
BASH_KEYS_FILE=$HOME/.bash_keys;
if [ -f $BASH_KEYS_FILE ]; then
  source $BASH_KEYS_FILE;
fi
