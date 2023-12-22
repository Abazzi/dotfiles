### Aliases for running DOOM from terminal ###
alias wads="cd $HOME/WADS"
alias doom="gzdoom -file DOOM.WAD GAMEPLAY/SmoothDoom.pk3"
alias doom2="gzdoom -file DOOM2.WAD GAMEPLAY/SmoothDoom.pk3"

### Aliases for git (when not using fugitive) ###
alias gclone="git clone"
alias gamend="git commit --amend"
alias gcm="git commit -m"
alias gbd="git branch -d"
alias gm="git merge"
alias ga="git add ."
alias gpo="git push origin"
alias gc="git checkout"
alias gp="git pull"
alias glo="git log --oneline"

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
alias rg="~/dotfiles/scripts/repoGen/repoGen.sh "

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
