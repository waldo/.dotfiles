eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi
