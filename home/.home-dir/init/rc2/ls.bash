unset \
  LSCOLORS \
  LS_COLORS;

if [ $(uname) = "Darwin" ]; then
  export LSCOLORS="ExFxBxDxCxegedabagacad";
else
  export LS_COLORS="di=1;36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43";
fi
