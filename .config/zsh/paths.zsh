# If you come from bash you might have to change your $PATH.
export PATH="$PATH:$HOME/bin:/usr/local/bin:$HOME/.local/bin:$GO_PATH:$BOB_PATH"
export GO_PATH="$PATH:/usr/local/go/bin:$PATH:$HOME/go/bin:$PATH:/usr/local/share/go/bin"
export BOB_PATH="$HOME/.local/share/bob/nvim-bin"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# Set default editor to neovim
export EDITOR="nvim"

#Paths for fzf 
export FZF_DEFAULT_COMMAND="fd . $HOME"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d . $HOME"xport FZF_DEFAULT_OPTS='--height 50% --border'
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"

# Exercism
export EXERCISM="$HOME/.bin"
# ~/.tmux/plugins
export PATH="$HOME/.tmux/plugins/t-smart-tmux-session-manager/bin:$PATH"
export T_SESSION_USE_GIT_ROOT="true"

## pnpm paths
export PNPM_HOME="/home/adam/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
