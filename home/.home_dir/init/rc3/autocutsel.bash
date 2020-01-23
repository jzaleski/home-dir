if which autocutsel > /dev/null 2>&1 && [ $(ps -ef | \grep -c "[a]utocutsel") -eq 0 ]; then
  (autocutsel &) > /dev/null 2>&1;
  (autocutsel -s PRIMARY &) > /dev/null 2>&1;
fi
