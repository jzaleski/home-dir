if which autocutsel > /dev/null 2>&1 && ! ps -ef | grep "[a]utocutsel" > /dev/null 2>&1; then
  (autocutsel &) > /dev/null 2>&1;
  (autocutsel -s PRIMARY &) > /dev/null 2>&1;
fi
