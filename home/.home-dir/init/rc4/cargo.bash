cargo_bin_dir=$HOME/.cargo/bin;
if [ -d $cargo_bin_dir ] && [[ ! "$PATH" =~ "$cargo_bin_dir" ]]; then
  export PATH=$cargo_bin_dir:$PATH;
fi
