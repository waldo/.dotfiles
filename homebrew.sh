eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/profile.d/bash_completion.sh
  . `brew --prefix`/opt/git/etc/bash_completion.d/git-prompt.sh
fi
