# If it exists, load "oh-my-zsh"
OH_MY_ZSH_DIR=$HOME/.oh-my-zsh;
if [ -d $OH_MY_ZSH_DIR ]; then
  ZSH=$OH_MY_ZSH_DIR;
  ZSH_THEME=jzaleski;
  DISABLE_AUTO_UPDATE=true;
  plugins=(cp extract github systemadmin urltools zsh-syntax-highlighting);
  `hash bundle 2> /dev/null` && plugins+=(bundler);
  `hash gem 2> /dev/null` && plugins+=(gem);
  `hash git 2> /dev/null` && plugins+=(git git-extras);
  `hash heroku 2> /dev/null` && plugins+=(heroku);
  `hash hg 2> /dev/null` && plugins+=(mercuial);
  `hash psql 2> /dev/null` && plugins+=(postgres);
  `hash rake 2> /dev/null` && plugins+=(rake);
  `hash ruby 2> /dev/null` && plugins+=(ruby);
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

# If it exists, process ".zsh_prompt"
ZSH_PROMPT_FILE=$HOME/.zsh_prompt;
if [ -f $ZSH_PROMPT_FILE ]; then
  source $ZSH_PROMPT_FILE;
fi

# If it exists, process ".commonrc"
COMMONRC_FILE=$HOME/.commonrc;
if [ -f $COMMONRC_FILE ]; then
  source $COMMONRC_FILE;
fi

# Ensure that "ZSH_TMUX_TERM" is set to the same value as "TERM"
export ZSH_TMUX_TERM=$TERM;

# If it exists, process ".zsh_aliases"
ZSH_ALIASES_FILE=$HOME/.zsh_aliases;
if [ -f $ZSH_ALIASES_FILE ]; then
  source $ZSH_ALIASES_FILE;
fi

# If it exists, process ".zsh_keys"
ZSH_KEYS_FILE=$HOME/.zsh_keys;
if [ -f $ZSH_KEYS_FILE ]; then
  source $ZSH_KEYS_FILE;
fi
