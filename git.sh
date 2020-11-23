# Aliases
alias ga="git add "
alias push="git push "
alias gl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr %an)%Creset' --abbrev-commit --date=relative -n10 "
alias gs="git status "
alias gd="git diff "
alias gc="git commit "
alias gb="git branch "
alias co="git checkout "
alias fetch="git fetch "
alias pull="git pull "
alias clone="git clone "
alias rebase="git rebase "
alias stash="git stash "
source ~/.dotfiles/delete_branch.sh
alias delete="delete_branch "

complete -F _complete_alias co
complete -F _complete_alias gb
complete -F _complete_alias push
complete -F _complete_alias pull
complete -F _complete_alias delete

export GIT_PS1_SHOWDIRTYSTATE=true # '*' for unstaged changes, '+' for staged
export GIT_PS1_SHOWSTASHSTATE=true # '$' if smth is stashed
export GIT_PS1_SHOWUNTRACKEDFILES=true # '%' if un-tracked files
