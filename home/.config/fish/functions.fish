function cd
  set last_directory $PWD;

  set file_or_directory "";
  if count $argv > /dev/null
    set file_or_directory $argv[1];
  end

  if test -z $file_or_directory
    builtin cd;
  else if test -f $file_or_directory
    builtin cd (dirname $file_or_directory);
  else
    builtin cd $file_or_directory;
  end

  set node_version_file $PWD/.node-version;
  if test -e $node_version_file
    set refresh_environment true;
  end

  set notags_file $PWD/.notags;
  if test -e $notags_file
    set refresh_environment true;
  end

  set python_version_file $PWD/.python-version;
  if test -e $python_version_file
    set refresh_environment true;
  end

  set ruby_version_file $PWD/.ruby-version;
  if test -e $ruby_version_file
    set refresh_environment true;
  end

  set sbt_version_file $PWD/.sbt-version;
  if test -e $sbt_version_file
    set refresh_environment true;
  end

  if test -n "$PROJECT_DIRECTORY"
    if begin string match -q -r -v "^$PROJECT_DIRECTORY" "$PWD"; or test -n "$refresh_environment"; end
      set -e NODE_VERSION;
      set -e NOTAGS;
      set -e PROJECT_DIRECTORY;
      set -e PYTHON_VERSION;
      set -e RUBY_VERSION;
      set -e SBT_VERSION;
    end
  end

  if test -e $node_version_file
    set -g NODE_VERSION (cat $node_version_file);
  end

  if test -e $notags_file
    set -g NOTAGS true;
  end

  if test -e $python_version_file
    set -g PYTHON_VERSION (cat $python_version_file);
  end

  if test -e $ruby_version_file
    set -g RUBY_VERSION (cat $ruby_version_file);
  end

  if test -e $sbt_version_file
    set -g SBT_VERSION (cat $sbt_version_file);
  end

  if test -n "$refresh_environment"
    set -g PROJECT_DIRECTORY $PWD;
  end
end

function fish_prompt
  # Error info
  set -l last_status $status;
  if test "$last_status" -ne 0
    set_color red;
    printf "x ";
  end

  # Enviroment info
  set_color normal;
  set active_versions "";
  set node_version $NODE_VERSION;
  if test -n "$node_version"
    if string match -q -r '^[0-9]+\.[0-9]+\.[0-9]+$' $node_version
      set node_version "node-$node_version";
    end
    set active_versions "$active_versions $node_version";
  end
  set python_version $PYTHON_VERSION;
  if test -n "$python_version"
    if string match -q -r '^[0-9]+\.[0-9]+\.[0-9]+$' $python_version
      set python_version "python-$python_version";
    end
    set active_versions "$active_versions $python_version";
  end
  set ruby_version $RUBY_VERSION;
  if test -n "$ruby_version"
    if string match -q -r '^[0-9]+\.[0-9]+\.[0-9]+$' $ruby_version
      set ruby_version "ruby-$ruby_version";
    end
    set active_versions "$active_versions $ruby_version";
  end
  set sbt_version $SBT_VERSION;
  if test -n "$sbt_version"
    if string match -q -r '^[0-9]+\.[0-9]+\.[0-9]+$' $sbt_version
      set sbt_version "sbt-$sbt_version";
    end
    set active_versions "$active_versions $sbt_version";
  end
  if test -n "$active_versions"
    set_color white -o;
    printf "(";
    set_color normal;
    printf (echo $active_versions | awk '{$1=$1};1' | sed 's/ /, /g');
    set_color white -o;
    printf ") ";
  end

  # Execution time
  set_color white -o;
  printf "["
  set_color normal;
  printf (date +"%T")
  set_color white -o;
  printf "] ";

  # Hostname
  set_color green -o;
  printf "{"
  set_color normal;
  printf (hostname -s)
  set_color green -o;
  printf "} ";

  # Separator
  set_color yellow -o;
  printf "> ";

  # Working directory
  set_color white -o;
  printf (prompt_pwd);

  # Separator
  set_color normal;
  printf " ";

  # Git info
  set_color yellow -o;
  set branch (git rev-parse --abbrev-ref HEAD 2> /dev/null);
  if test -n "$branch"
    printf $branch;
  end
  set dirty (git status --porcelain 2> /dev/null);
  if test -n "$dirty"
    printf "*";
  end
  if test -n "$branch" -o -n "$dirty"
    printf " ";
  end

  # Reset
  set_color normal;
end
