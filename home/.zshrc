# If it exists, load "oh-my-zsh"
OH_MY_ZSH_DIR="$HOME/.oh-my-zsh";
if [ -d $OH_MY_ZSH_DIR ];
then
	ZSH=$OH_MY_ZSH_DIR;
	ZSH_THEME="jzaleski";
	DISABLE_AUTO_UPDATE="true";
  plugins=(cp extract rsync);
  [[ `uname` == 'Darwin' ]] && plugins+=(osx);
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
	source "$ZSH/oh-my-zsh.sh";
fi

# If it exists, process ".commonrc"
COMMONRC_FILE="$HOME/.commonrc"
if [ -f $COMMONRC_FILE ];
then
	source $COMMONRC_FILE;
fi

# If it exists, process ".zsh_aliases"
ZSH_ALIASES_FILE="$HOME/.zsh_aliases"
if [ -f $ZSH_ALIASES_FILE ];
then
	source $ZSH_ALIASES_FILE;
fi
