set pwd_bin_dir "./bin"
if not contains $pwd_bin_dir $PATH
  set PATH $pwd_bin_dir $PATH;
end
