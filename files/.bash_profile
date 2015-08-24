export GOPATH=$HOME/go
export PATH=$HOME/bin:$GOPATH/bin:/usr/local/bin:$PATH

if [ -n "which emacs" ]; then
  export EDITOR="emacs"
fi

source ~/.aliases
[[ -s "source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash" ]] &&
  source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash
[[ -s "/Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh" ]] &&
  source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh

# Make the prompt look better for git
PS1='[$(date +%H:%M) \[\033[0;36m\]\u \[\033[0;33m\]\w \[\033[0;31m\]$(__git_ps1 "(%s)")\[\033[0m\]]\$ '

# turn on ssh agent
if [ -z "$SSH_AUTH_SOCK" ]; then
  echo "No ssh agent running, starting..."
  eval `ssh-agent -s`
  trap "kill $SSH_AGENT_PID" 0
fi
ssh-add

## Load a local profile if one exists
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile
