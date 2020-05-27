# global
alias skroty="cat ~/.bash_aliases"
alias ce="nvim ~/.bash_aliases"
alias so="source ~/.bashrc"
alias clear_swap="rm -rf ~/.local/share/nvim/swap/"

# git aliases
alias g="git"
alias gskroty="cat ~/.bash_aliases | grep git"

alias gg="git grep"
alias gb="git branch"
alias gs="git status -s"
alias gl="git log --oneline --decorate --pretty=format:'%C(yellow)%h%C(reset)%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"

alias gco="git checkout"
alias gca="git commit --amend"
alias gcm="git commit -m"

alias gap="git add -p"
alias gps="git push origin"
alias gpl="git pull origin"
alias grbs="git checkout develop && git pull origin develop && git checkout $1 && git rebase develop"
alias gamig="git add *apps/*/migrations/*.py"

alias g_nw_tsk="git checkout develop && git pull origin develop && git checkout -b $1"

# docker aliases
alias d="docker"
alias dskroty="cat ~/.bash_aliases | grep docker"

alias dps="docker-compose ps"
alias dlog="docker logs "
alias drest="docker restart "

alias dcre="docker-compose down && sudo docker-compose build && docker-compose up -d"
alias dcpdb="docker-compose run --service-ports"
