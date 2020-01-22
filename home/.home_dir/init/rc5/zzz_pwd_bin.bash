pwd_bin_dir="./bin";
if [[ ! "$PATH" =~ "$pwd_bin_dir" ]]; then
  export PATH=$pwd_bin_dir:$PATH;
fi
