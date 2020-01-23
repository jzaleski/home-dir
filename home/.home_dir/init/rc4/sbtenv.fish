set sbtenv_bin_dir $HOME/.sbtenv/bin;
if begin; test -d $sbtenv_bin_dir; and not contains $sbtenv_bin_dir $PATH; end
  set PATH $sbtenv_bin_dir $PATH;
end

set sbtenv_shims_dir $HOME/.sbtenv/shims;
if begin; test -d $sbtenv_shims_dir; and not contains $sbtenv_shims_dir $PATH; end
  set PATH $sbtenv_shims_dir $PATH;
end

set norehash_file $HOME/.norehash;
if begin; not test -e $norehash_file; and which sbtenv 2>&1 > /dev/null; end
  sbtenv rehash;
end
