# Load seperated config files
for conf in "$HOME/dotfiles/zsh/"*.zsh; do
  source "${conf}"
done
source ~/.oh-my-zsh/oh-my-zsh.sh
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

