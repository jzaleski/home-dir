# If it exists, process ".bash_prompt"
BASH_PROMPT_FILE="$HOME/.bash_prompt";
if [ -f $BASH_PROMPT_FILE ];
then
	source $BASH_PROMPT_FILE;
fi

# "Homebrew" specific inclusions
HOMEBREW_PREFIX=`brew --prefix 2> /dev/null`;
if [ -n "$HOMEBREW_PREFIX" ];
then
	# If it exists, process [Homebrew] "bash_completion" file
	BASH_COMPLETION_FILE="$HOMEBREW_PREFIX/etc/bash_completion";
	if [ -f $BASH_COMPLETION_FILE ];
	then
		source $BASH_COMPLETION_FILE;
	fi
fi

# Set up the "History"
export HISTTIMEFORMAT='%Y-%m-%d %H:%M:%S - ';
export HISTSIZE=100000;
export HISTFILESIZE=100000;

# Append to the history file, don't overwrite it
shopt -s histappend;

# If it exists, process ".commonrc"
COMMONRC_FILE="$HOME/.commonrc"
if [ -f $COMMONRC_FILE ];
then
	source $COMMONRC_FILE;
fi

# If it exists, process ".bash_aliases"
BASH_ALIASES_FILE="$HOME/.bash_aliases";
if [ -f $BASH_ALIASES_FILE ];
then
	source $BASH_ALIASES_FILE;
fi
