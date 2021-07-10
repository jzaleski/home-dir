# Disable the greeting
set fish_greeting;

# Set the PATH
set PATH ./node_modules/.bin $HOME/bin /opt/homebrew/bin /usr/local/bin /usr/local/sbin /opt/local/bin /opt/local/sbin /usr/bin /usr/sbin /bin /sbin;

# Set the default editor
set EDITOR $HOME/lib/vim.sh;

# Set the git-editor to the default editor
set GIT_EDITOR $EDITOR;

# Ensure that "LANG" is set
if test -z "$LANG"
  set LANG en_US.UTF-8;
end

# Ensure that the `SHELL` variable is properly set
set SHELL fish;

# Used by helper scripts (e.g. workon)
set SOURCE_DIRECTORY $HOME/src;

# Ensure that we are running in a 256 color-mode
if test -z "$TERM" -o "$TERM" = "xterm"
  set TERM xterm-256color;
end

# If we are running under screen or tmux, update the "TERM" value
if test -n "$STY" -o -n "$TMUX_PANE"
  set TERM screen-256color;
end

# If it exists, process ".fish_aliases"
set fish_aliases_file $HOME/.config/fish/aliases.fish;
if test -e $fish_aliases_file
  source $fish_aliases_file;
end

# If it exists, process ".fish_functions"
set fish_functions_file $HOME/.config/fish/functions.fish;
if test -e $fish_functions_file
  source $fish_functions_file;
end

# Load any custom init-scripts (the filename *must* end-with ".fish")
set custom_init_scripts_directory $HOME/.home_dir/init;
if test -d $custom_init_scripts_directory
  for f in (find "$custom_init_scripts_directory" -type f -o -type l | grep "\.fish\$" | sort)
    source $f;
  end
end
