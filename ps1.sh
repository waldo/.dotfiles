function timer_start {
  timer=${timer:-$SECONDS}
}

function timer_stop {
  timer_show=$(($SECONDS - $timer))
  unset timer
}

trap 'timer_start' DEBUG
PROMPT_COMMAND="timer_stop;$PROMPT_COMMAND"

format_seconds() { # convert integer seconds to HH:MM:SS
  printf "%02d:%02d:%02d" \
  $(((($1/60)/60)%24)) $((($1/60)%60)) $(($1%60)) |
  sed 's/^\(00:\)*//;s/^0//' ; }

# set the PS1 variable
PS1="\[\033[G\]\[\e]0;\w\a\]\n\[\e[32m\]\u@\h:\[\e[33m\]\w\[\e[0m\] \$(__git_ps1)\[\e[0m\] \[\e[36m\](last: \$(format_seconds timer_show))\[\e[0m\]\n"
