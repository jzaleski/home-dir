if begin; which autocutsel > /dev/null; and not ps -ef | grep "[a]utocutsel" > /dev/null 2>&1; end
  autocutsel > /dev/null 2>&1 &
  autocutsel -s PRIMARY > /dev/null 2>&1 &
end
