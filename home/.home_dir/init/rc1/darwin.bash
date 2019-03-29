if [ `uname` = "Darwin" ]; then
  export MANPATH=/usr/local/opt/gnu-sed/libexec/gnuman:$MANPATH;
  export PATH=/usr/local/opt/gnu-sed/libexec/gnubin:/usr/local/opt/coreutils/libexec/gnubin:$PATH;
fi
