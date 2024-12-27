# Load seperated config files
for conf in "$HOME/.config/zsh/"*.zsh; do
  source "${conf}"
done
autoload -U colors && colors
# PS1="%F{001}[%F{003}%n%F{002}@%F{004}%M %F{005}~%F{001} %{$reset_color%}$%b]"
PS1="%F{001}[%F{003}%n%F{002}@%F{004}%M %F{005}%~%F{001}]%{$reset_color%}$b "
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
