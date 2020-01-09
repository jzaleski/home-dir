set exenv_bin_dir $HOME/.exenv/bin;
if begin; test -d $exenv_bin_dir; and not contains $exenv_bin_dir $PATH; end
  set PATH $exenv_bin_dir $PATH;
end

set exenv_shims_dir $HOME/.exenv/shims;
if begin; test -d $exenv_shims_dir; and not contains $exenv_shims_dir $PATH; end
  set PATH $exenv_shims_dir $PATH;
end

set norehash_file $HOME/.norehash;
if begin; not test -e $norehash_file; and \which exenv 2>&1 > /dev/null; end
  exenv rehash;
end
