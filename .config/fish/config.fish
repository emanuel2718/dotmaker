if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting

abbr -a yr 'cal -y'
abbr -a rc 'vim $HOME/.config/fish/config.fish'
abbr -a src 'source $HOME/.config/fish/config.fish'
abbr -a tk 'tmux kill-session -t'
abbr -a ta 'tmux a -t'
abbr -a tn 'tmux new -s'
abbr -a vim 'nvim'


fish_vi_key_bindings insert

