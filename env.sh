export LC_CTYPE=en_US.UTF-8
export CLICOLOR=true

export EDITOR="code --wait"
export HISTSIZE=25000
export HISTFILESIZE=2500000
shopt -s histappend
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

export JAVA_HOME=/usr
export SCRIPTS_HOME=~/proj/scripts

export PATH=/usr/local/bin:~/bin:/home/linuxbrew/.linuxbrew/bin/:$SCRIPTS_HOME:$PATH
