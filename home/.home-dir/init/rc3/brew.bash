if [ $(uname) = "Darwin" ]; then
  export HOMEBREW_NO_REQUIRE_TAP_TRUST=${HOMEBREW_NO_REQUIRE_TAP_TRUST:-1};
fi
