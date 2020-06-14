export LC_CTYPE=en_US.UTF-8
export CLICOLOR=true

export EDITOR="code --wait"
export HISTSIZE=100000
export HISTFILESIZE=250000
shopt -s histappend
PROMPT_COMMAND="history -a; history -c; history -r"

export JAVA_HOME=/usr
export SCRIPTS_HOME=~/proj/scripts

export PATH=/usr/local/bin:~/bin:$SCRIPTS_HOME:$PATH
