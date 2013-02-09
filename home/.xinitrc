# If it exists, process ".Xresources"
XRESOURCES_FILE="$HOME/.Xresources";
[[ -f $XRESOURCES_FILE ]] && xrdb -load $XRESOURCES_FILE;

# If it exists, load "xmonad"
XMONAD_BINARY="/usr/bin/xmonad";
[[ -f $XMONAD_BINARY ]] && cd ~ && $XMONAD_BINARY;
