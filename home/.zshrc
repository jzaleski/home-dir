# If it exists, load "oh-my-zsh"
OH_MY_ZSH_DIR=$HOME/.oh-my-zsh;
if [ -d $OH_MY_ZSH_DIR ]; then
  ZSH=$OH_MY_ZSH_DIR;
  ZSH_THEME=jzaleski;
  DISABLE_AUTO_UPDATE=true;
  plugins=(cp extract rsync zsh-syntax-highlighting);
  [[ `uname` == "Darwin" ]] && plugins+=(osx);
  `hash brew 2> /dev/null` && plugins+=(brew);
  `hash git 2> /dev/null` && plugins+=(git git-extras);
  `hash heroku 2> /dev/null` && plugins+=(heroku);
  `hash pip 2> /dev/null` && plugins+=(pip);
  `hash python 2> /dev/null` && plugins+=(python);
  `hash rbenv 2> /dev/null` && plugins+=(rbenv);
  `hash redis-cli 2> /dev/null` && plugins+=(redis-cli);
  `hash ruby 2> /dev/null` && plugins+=(bundler gem rake ruby);
  `hash rvm 2> /dev/null` && plugins+=(rvm);
  `hash svn 2> /dev/null` && plugins+=(svn);
  source $ZSH/oh-my-zsh.sh;
fi

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
