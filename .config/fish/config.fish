set fish_greeting
set -g fish_key_bindings fish_vi_key_bindings
set -x EDITOR vim
set -x DIRENV_LOG_FORMAT ""
set -x FZF_DEFAULT_OPTS --exact

function fish_mode_prompt; end


abbr -a rc '$EDITOR $HOME/.config/fish/config.fish'
abbr -a src 'source $HOME/.config/fish/config.fish'
abbr -a gs 'git status'
abbr -a gl 'git log'

abbr -a tk 'tmux kill-session -t'
abbr -a ta 'tmux a -t'
abbr -a tn 'tmux new -s'
abbr -a tl 'tmux ls'
abbr -a tt 'tms'

abbr -a cr 'cargo run'
abbr -a ct 'cargo test'
abbr -a cc 'cargo check'
abbr -a cb 'cargo build'

zoxide init fish | source
