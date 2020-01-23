if test -z "$GOENV_GOPATH_PREFIX"
  set -Ux GOENV_GOPATH_PREFIX $HOME/.go;
end

set goenv_bin_dir $HOME/.goenv/bin;
if begin; test -d $goenv_bin_dir; and not contains $goenv_bin_dir $PATH; end
  set PATH $goenv_bin_dir $PATH;
end

set goenv_shims_dir $HOME/.goenv/shims;
if begin; test -d $goenv_shims_dir; and not contains $goenv_shims_dir $PATH; end
  set PATH $goenv_shims_dir $PATH;
end

set norehash_file $HOME/.norehash;
if begin; not test -e $norehash_file; and which goenv 2>&1 > /dev/null; end
  goenv rehash;
end
