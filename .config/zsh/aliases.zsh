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

# better ls
alias ls="ls --color=auto --group-directories-first --time-style=iso --quoting-style=literal"
alias la="ls -a"

# source zsh config file
alias szh="source ~/.zshrc"

# nvim alias 
alias nv="nvim"

# cd into neovim config folder
alias ns="cd $HOME/dotfiles/.config/nvim"

# launch cht.sh script
alias cht="~/dotfiles/scripts/tmux-cht/tmux-cht.sh "

# fd() into repos directory
alias fdr="fd ~/repos"

#alias for pnpm
alias pn="pnpm"

#start godoc server
alias gdServe="godoc -http=localhost:8000"

## search manuals 
alias zman="compgen -c | fzf | xargs man"

## Find biggest files in current dir
alias ffBig="du -ah . | sort -hr | head -n 10"

## Update System
alias syu="sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y && flatpak update -y"

## Open Lazygit
alias lg="lazygit"

## Open Lazydocker
alias lzd="lazydocker"

# Pomodoro aliases
alias pWork="pomodoro 'work'"
alias pLongWork="pomodoro 'long-work'"
alias pBreak="pomodoro 'break'"
alias pLongBreak="pomodoro 'long-break'"
alias p10="pomodoro 'ten'"
alias p20="pomodoro 'twenty'"
alias p30="pomodoro 'thirty'"
alias p40="pomodoro 'fourty'"
alias p50="pomodoro 'fifty'"
alias p60="pomodoro 'hour'"
alias p90="pomodoro 'ninety'"
