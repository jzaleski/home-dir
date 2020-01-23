# Conditionally set up "ssh-askpass" (this must be done before processing ".sshagentrc")
if [ -z "$SSH_CONNECTION" ] && [ -z "$SSH_ASKPASS" ] && ! which ssh-askpass > /dev/null 2>&1; then
  export SSH_ASKPASS=$HOME/libexec/ssh-askpass;
fi
