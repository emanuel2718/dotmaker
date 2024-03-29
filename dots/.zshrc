# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export DEV="$HOME/dev"
export PROJECTS="$HOME/dev/code"
export PACKAGES="$HOME/dev/pkgs"
export WALLPAPERS="$HOME/Pictures/Wallpapers"
export BINS="$HOME/dev/bin"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

plugins=(git vi-mode)

source $ZSH/oh-my-zsh.sh

# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

export PATH=$HOME/.local/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/.local/share/nvim/mason/bin
# export PATH=$PATH:/var/lib/flatpak/exports/bin

source $HOME/.xprofile
source $HOME/.profile


# Aliases
alias tc='$EDITOR ~/.tmux.conf'
alias rc='$EDITOR ~/.zshrc'
alias src='source ~/.zshrc'
alias tsrc='tmux source ~/.tmux.conf'
alias his='$EDITOR ~/.zsh_history'
alias tk='tmux kill-session -t'
alias ta='tmux a -t'
alias tn='tmux new -s'
alias tl='tmux ls'
alias i3config='$EDITOR $HOME/.config/i3/config'
alias code="code"
alias ng="nvim +Neogit"
alias tt='$HOME/dev/bin/tmux-sessionizer.sh | sh'
alias vpn='mullvad'
alias vpns='mullvad status'
alias vpnc='mullvad connect'
alias vpnd='mullvad disconnect'
alias vpnl='mullvad relay set location'
alias python='python3'
alias penv='python3 -m venv venv && source venv/bin/activate'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(zoxide init zsh)"

source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh


# bun completions
[ -s "/home/rami/.bun/_bun" ] && source "/home/rami/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
