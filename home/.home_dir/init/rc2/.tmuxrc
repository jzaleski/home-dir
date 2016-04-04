# If it exists, and we're running under "tmux" use ".inputrc-tmux"
inputrc_tmux_file=$HOME/.inputrc-tmux;
if [ -n "$TMUX_PANE" ] && [ -f $inputrc_tmux_file ]; then
  export INPUTRC=$inputrc_tmux_file;
fi
