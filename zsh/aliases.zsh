### Aliases for tmux ###
alias td="tmux detach"
alias tl="tmux ls"
alias ta="tmux a"
alias tks="tmux kill-server"
alias tn="tmux new -s "
alias ta="tmux a -t "
alias tk="tmux kill-sess -t "

### Aliases for everything else ###

alias la="ls -A"

## Run Repo Gen Script
alias rg="$HOME/repoGen/repoGen.sh "

# better ls
alias ls="ls --color=auto --group-directories-first --time-style=iso --quoting-style=literal"
alias la="ls -a"

# cd into nvim config folder on Windows
alias nvimcw="cd $HOME/AppData/Local/nvim"

# source zsh config file
alias szh="source ~/.zshrc"

# nvim alias to just go into directory
alias nv="nvim ."

# cd into neovim config folder
alias ns="cd $HOME/dotfiles/nvim"

# launch cht.sh script
alias cht="~/dotfiles/scripts/tmux-cht/tmux-cht.sh "

# fd() into repos directory
alias fdr="fd ~/repos"

#alias for pnpm
alias pn="pnpm"

## search manuals 
alias zman="compgen -c | fzf | xargs man"

## Find biggest files in current dir
alias ffBig="du -ah . | sort -hr | head -n 10"

## Update System
alias syu="sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y && flatpak update -y"

## Open Lazygit
alias lg="lazygit"

## WSL ONLY: Open Current Directory in Windows Explorer 
alias explorer="explorer.exe ."

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
