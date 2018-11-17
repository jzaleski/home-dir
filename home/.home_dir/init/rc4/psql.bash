# change directories to the `$HOME`
pushd $HOME > /dev/null;
# process all of the `$project(s)`
for database_and_environment in `find . -maxdepth 1 -mindepth 1 -type f -name ".pgpass-*" | sed -E 's/(\.\/)?\.pgpass-//'`; do
  database=`echo $database_and_environment | cut -d- -f1`;
  environment=`echo $database_and_environment | cut -d- -f2`;
  alias psql-$database-$environment="PGPASSFILE=\"$HOME/.pgpass-$database_and_environment\" $HOME/bin/psql.sh";
done
# return the previous directory
popd > /dev/null;
