# Update the "PATH"
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin;

# If it exists, process ".bash_aliases"
BASH_ALIASES_FILE="$HOME/.bash_aliases";
if [ -f $BASH_ALIASES_FILE ];
then
	source $BASH_ALIASES_FILE;
fi

# "Homebrew" specific inclusions
HOMEBREW_PREFIX=`brew --prefix 2> /dev/null`;
if [ -n "$HOMEBREW_PREFIX" ];
then
	# If it exists, process [Homebrew] "bash_completion"
	BASH_COMPLETION_FILE="$HOMEBREW_PREFIX/etc/bash_completion";
	if [ -f $BASH_COMPLETION_FILE ];
	then
		source $BASH_COMPLETION_FILE;
	fi
fi

# If it exists, load "RVM"
RVM_BASE_DIR="$HOME/.rvm";
if [ -d $RVM_BASE_DIR ];
then
	export PATH=$PATH:$RVM_BASE_DIR/bin;
	source $RVM_BASE_DIR/scripts/rvm;
fi

# Conditionally set up "ssh-askpass" (this must be done before processing ".sshagentrc")
if [ -z "$SSH_CONNECTION" ] && [ -z "$SSH_ASKPASS" ] && [ ! -f "/usr/libexec/ssh-askpass" ];
then
	export SSH_ASKPASS="$HOME/libexec/ssh-askpass";
fi

# If it exists, process ".sshagentrc"
SSH_AGENT_RC_FILE="$HOME/.sshagentrc";
if [ -f $SSH_AGENT_RC_FILE ];
then
	source $SSH_AGENT_RC_FILE;
fi

# Set up the "History"
export HISTTIMEFORMAT='%Y-%m-%d %H:%M:%S - ';
export HISTSIZE=100000;
export HISTFILESIZE=100000;

# Append to the history file, don't overwrite it
shopt -s histappend;

# Set the default "Editor" (git, amongst other things use this)
export EDITOR=vim;

# Set the "Prompt"
function parse_git_branch {
	git branch --no-color 2> /dev/null | grep '\* ' | tr -d '* '
}
export PS1='\[\033[1;34m\]\u\[\033[1;31m\]@\[\033[1;32m\]\h\[\033[0;34m\]:\[\033[1;35m\](\[\033[1;37m\]\w\[\033[1;35m\])$([[ -n "`parse_git_branch`" ]] && echo "\[\033[0;34m\]:\[\033[1;35m\][\[\033[1;30m\]`parse_git_branch`\[\033[1;35m\]]")\[\033[1;33m\]\$ \[\033[0m\]'
