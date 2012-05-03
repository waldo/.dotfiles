function make-completion-wrapper () {
    local function_name="$2"
    local arg_count=$(($#-3))
    local comp_function_name="$1"
    shift 2
    local function="
function $function_name {
    ((COMP_CWORD+=$arg_count))
    COMP_WORDS=( "$@" \${COMP_WORDS[@]:1} )
    "$comp_function_name"
    return 0
}"
    eval "$function"
}

# Aliases

alias ga="git add "
alias push="git push "
alias gl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr %an)%Creset' --abbrev-commit --date=relative -n10 "
alias gs="git status "
alias gd="git diff "
alias gdc="git diff --cached "
alias gc="git commit "
alias gb="git branch "
alias co="git checkout "
alias gf="git fetch "
alias pull="git pull "
alias gcl="git clone "
alias rebase="git rebase "
alias stash="git stash "
source ~/.dotfiles/delete_branch.sh
alias delete="delete_branch "

make-completion-wrapper _git _git_checkout_mine git checkout; complete -o bashdefault -o default -o nospace -F _git_checkout_mine co
make-completion-wrapper _git _git_branch_mine git branch; complete -o bashdefault -o default -o nospace -F _git_branch_mine gb
make-completion-wrapper _git _git_push_mine git push; complete -o bashdefault -o default -o nospace -F _git_push_mine push
make-completion-wrapper _git _git_pull_mine git pull; complete -o bashdefault -o default -o nospace -F _git_pull_mine pull

export GIT_PS1_SHOWDIRTYSTATE=true # '*' for unstaged changes, '+' for staged
export GIT_PS1_SHOWSTASHSTATE=true # '$' if smth is stashed
export GIT_PS1_SHOWUNTRACKEDFILES=true # '%' if un-tracked files
