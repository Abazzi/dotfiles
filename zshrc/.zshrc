# If you come from bash you might have to change your $PATH.
export PATH="$PATH:$HOME/bin:/usr/local/bin:$HOME/.local/bin"
export PATH="$PATH:/usr/local/go/bin"
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Exercism
export EXERCISM="$HOME/.bin"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
# ~/.tmux/plugins
export PATH=$HOME/.tmux/plugins/t-smart-tmux-session-manager/bin:$PATH
# ~/.config/tmux/plugins
export PATH=$HOME/.config/tmux/plugins/t-smart-tmux-session-manager/bin:$PATH
export T_SESSION_USE_GIT_ROOT="true"


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="steeef"

## Git Theme Prompts
ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_DIRTY=" ✗"
ZSH_THEME_GIT_PROMPT_CLEAN=" ✔"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=14

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"


# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
#VI Mode
# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Use lf to switch directories and bind it to ctrl-o
lfcd () { tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nano'
 fi

#Edit line with vim ctrl-e
export VISUAL=nvim
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.


## fuzzy finder into directory
fd() {
 local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# fcd- fuzzy cd from anywhere
# ex: fcd word1 word2 ... (even part of a file name)
# zsh autoload function
fcd() {
  local file

  file="$(locate -Ai -0 $@ | grep -z -vE '~$' | fzf --read0 -0 -1)"

  if [[ -n $file ]]
  then
     if [[ -d $file ]]
     then
        cd -- $file
     else
        cd -- ${file:h}
     fi
  fi
}

## Pomodoro Timer ###
# Requires https://github.com/caarlos0/timer and lolcat
declare -A pomo_options
pomo_options["break"]="15"
pomo_options["long-break"]="20"
pomo_options["work"]="45"
pomo_options["long-work"]="90"
pomo_options["ten"]="10"
pomo_options["twenty"]="20"
pomo_options["thirty"]="30"
pomo_options["fourty"]="40"
pomo_options["fifty"]="50"
pomo_options["hour"]="60"

pomodoro () {
  if [ -n "$1" -a -n "${pomo_options["$1"]}" ]; then
  val=$1
  echo $val | lolcat
  timer ${pomo_options["$val"]}m
  echo "'$val' session done" | lolcat
  timer-notify-send
  echo -n -e "\a"
  fi
}

timer-notify-send(){
  notify-send "Timer is Done" "Nice dawg ;)" --icon="wizard-hat"
}

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
alias rg="~/dotfiles/scripts/repoGen.sh "

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
alias p60="pomodoro 'hour'"

autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT='${vcs_info_msg_0_}'
# PROMPT='${vcs_info_msg_0_}%# '
zstyle ':vcs_info:git:*' formats '%b'

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

eval "$(zoxide init zsh)"
