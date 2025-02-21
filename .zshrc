# Load seperated config files
for conf in "$HOME/.config/zsh/"*.zsh; do
  source "${conf}"
done
autoload -U colors && colors
PS1="%F{001}[%F{003}%n%F{002}@%F{004}%M %F{005}%~%F{001}]%{$reset_color%}$b "
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
 # Ensure that we have an ssh config with AddKeysToAgent set to true
 if [ ! -f ~/.ssh/config ] || ! cat ~/.ssh/config | grep AddKeysToAgent | grep yes > /dev/null; then
     echo "AddKeysToAgent  yes" >> ~/.ssh/config
 fi
 # Ensure a ssh-agent is running so you only have to enter keys once
 if [ ! -S ~/.ssh/ssh_auth_sock ]; then
   eval `ssh-agent`
   ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
 fi
 export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
