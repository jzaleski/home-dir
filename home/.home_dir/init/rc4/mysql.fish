# change directories to the `$HOME`
pushd $HOME > /dev/null;
# process all of the `$project(s)`
for database_and_environment in (find . -maxdepth 1 -mindepth 1 -type f -name ".my.cnf-*" | sed -E 's/(\.\/)?\.my\.cnf-//')
  set database (echo $database_and_environment | cut -d- -f1);
  set environment (echo $database_and_environment | cut -d- -f2);
  alias mysql-$database-$environment="env MYCNFFILE=\"$HOME/.my.cnf-$database_and_environment\" mysql";
end
# return the previous directory
popd > /dev/null;
