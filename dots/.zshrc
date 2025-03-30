export ZSH="$HOME/.oh-my-zsh"

# Theme list: https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="eastwood"
#ZSH_THEME="lambda"


plugins=(git vi-mode zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
export EDITOR=vim

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

function f() { find . -iname "*$1*" ${@:2} }
function r() { grep "$1" ${@:2} -R . }

# cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# search in your command history and execute selected command
fh() {
  eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

bindkey '^F' autosuggest-accept

alias rc="vim $HOME/.zshrc"
alias src="source $HOME/.zshrc"

source <(fzf --zsh)
eval "$(zoxide init zsh)"
