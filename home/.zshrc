# "Homebrew" specific inclusions
HOMEBREW_PREFIX=`brew --prefix 2> /dev/null`;
if [ -n "$HOMEBREW_PREFIX" ]; then
  # If it exists, process [Homebrew] "zsh-completions"
  ZSH_COMPLETIONS_DIRECTORY=$HOMEBREW_PREFIX/share/zsh-completions;
  if [ -d $ZSH_COMPLETIONS_DIRECTORY ]; then
    fpath=($ZSH_COMPLETIONS_DIRECTORY $fpath);
  fi
fi

# If it exists, process ".commonrc"
COMMONRC_FILE=$HOME/.commonrc;
if [ -f $COMMONRC_FILE ]; then
  source $COMMONRC_FILE;
fi

# If it exists, process ".zsh_aliases"
ZSH_ALIASES_FILE=$HOME/.zsh_aliases;
if [ -f $ZSH_ALIASES_FILE ]; then
  source $ZSH_ALIASES_FILE;
fi

# If it exists, process ".common_keys"
COMMON_KEYS_FILE=$HOME/.common_keys;
if [ -f $COMMON_KEYS_FILE ]; then
  source $COMMON_KEYS_FILE;
fi

# If it exists, process ".zsh_keys"
ZSH_KEYS_FILE=$HOME/.zsh_keys;
if [ -f $ZSH_KEYS_FILE ]; then
  source $ZSH_KEYS_FILE;
fi
