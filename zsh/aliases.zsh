### Aliases for entering WADS directory ###
alias wads="cd $HOME/Documents/WADS"

### Aliases for tmux ###
alias td="tmux detach"
alias tl="tmux ls"
alias ta="tmux a"
alias tks="tmux kill-server"
alias tkserver="tmux kill-server"
alias tn="tmux new -s "
alias ta="tmux a -t "
alias tk="tmux kill-sess -t "

### Aliases for everything else ###

## Run Repo Gen Script
alias rg="$HOME/repoGen/repoGen.sh "

# better ls
alias ls="ls --color=auto --group-directories-first --time-style=iso --quoting-style=literal"

# cd into nvim config folder on Windows
alias nvimcw="cd $HOME/AppData/Local/nvim"

# source zsh config file
alias szh="source ~/.zshrc"

# run npm run watch
alias watch="npm run watch"

# run npm run serve (webpack) 
alias wServe="npm run serve"

# run npm run dev (vite) 
alias vServe="npm run dev"

# run http-server port 8080 with no cache
alias srv="http-server -p 8080 -c1"

# nvim alias to just go into directory
alias nv="nvim ."

# cd into neovim config folder
alias ns="cd $HOME/dotfiles/nvim"

# launch macchina
alias sinfo="macchina"

# launch ripasso-cursive
alias rpc="ripasso-cursive"

# launch cht.sh script
alias cht="~/dotfiles/scripts/tmux-cht/tmux-cht.sh "

# launch passfzf.sh
alias pf="~/dotfiles/scripts/passfzf.sh "

# fd() into repos directory
alias fdr="fd ~/repos"

# alias to fd() into web_dev directory in ~/repos
alias webdr="fd ~/repos/web_dev"

## search manuals 
alias zman="compgen -c | fzf | xargs man"

## Find biggest files in current dir
alias ffBig="du -ah . | sort -hr | head -n 10"

## Update System
alias syu="sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y && flatpak update -y"

# Pomodoro aliases
alias wo="pomodoro 'work'"
alias wol="pomodoro 'long-work'"
alias br="pomodoro 'break'"
alias brl="pomodoro 'long-break'"
alias ptest="pomodoro 'test'"
alias p10="pomodoro 'ten'"
alias p20="pomodoro 'twenty'"
alias p30="pomodoro 'thirty'"
alias p40="pomodoro 'fourty'"
alias p50="pomodoro 'fifty'"
