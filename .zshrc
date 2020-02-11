# If you come from bash you might have to change your $PATH.
export PATH="$PATH:$HOME/bin:/usr/local/bin:"
export PATH="$PATH:$HOME/.config/composer/vendor/bin"
export PATH="$PATH:$HOME/.composer/vendor/bin"
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="af-magic"

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
plugins=(git)

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
export VISUAL=vim
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.

#Aliases for Games like DOOM and DOOM 2
alias doom="gzdoom -file DOOM.WAD vsmooth.wad"
alias doomssg="gzdoom -file DOOM.WAD SSG.wad vsmooth.wad"
alias doom2="gzdoom -file DOOM2.WAD vsmooth.wad"
alias hexen="gzdoom -file HEXEN.WAD"
alias heretic="gzdoom -file HERETIC.WAD"
alias wads="cd $HOME/Documents/WADS"
alias quakedir="cd $HOME/Documents/WADS/quake"
alias fistfull="gzdoom -file DOOM2.WAD FISTFUL.WAD FISTFIX.WAD"
alias pb1="doom -file $HOME/Documents/WADS/projectBrutality/Project\ Brutality\ 2.03.pk3 -file $HOME/Documents/WADS/projectBrutality/External\ Files/HUDs/UDV/UDV_v1.62_A_BASE_GZDoomOnly.pk3"
alias pb2="doom2 -file $HOME/Documents/WADS/projectBrutality/Project\ Brutality\ 2.03.pk3 -file $HOME/Documents/WADS/projectBrutality/External\ Files/HUDs/UDV/UDV_v1.62_A_BASE_GZDoomOnly.pk3"
alias guncaster="gzdoom -file DOOM.WAD guncaster/Guncaster.pk3 guncaster/GC_Addon.pk3 guncaster/zscript.txt"

#Aliases for laravel related commands
alias serve="php artisan serve"

#Aliases for everything else
alias ls="ls --color=auto --group-directories-first --time-style=iso --quoting-style=literal"

alias sdv = "sudo vim"
# Syntax Highling Path.
source $HOME/Documents/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
