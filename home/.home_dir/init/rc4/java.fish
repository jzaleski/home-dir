set library_java_home_dir /Library/Java/Home;
if begin; test -e $library_java_home_dir; and test -z "$JAVA_HOME"; end
  set JAVA_HOME $library_java_home_dir;
end

set java_bin_dir $JAVA_HOME/bin;
if begin; test -e $java_bin_dir; and not contains $java_bin_dir $PATH; end
  set PATH $java_bin_dir $PATH;
end
