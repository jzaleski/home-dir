library_java_home_dir=/Library/Java/Home;
if [ -e $library_java_home_dir ] && [ -z "$JAVA_HOME" ]; then
  export JAVA_HOME=$library_java_home_dir;
fi

java_bin_dir=$JAVA_HOME/bin;
if [ -e $java_bin_dir ] && [[ ! "$PATH" =~ "$java_bin_dir" ]]; then
  export PATH=$java_bin_dir:$PATH;
fi
