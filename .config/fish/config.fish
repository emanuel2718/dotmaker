abbr -a .. 'cd ..'
abbr -a ... 'cd ../..'
abbr -a .... 'cd ../../..'
abbr -a cal 'cal -y'
abbr -a i3config 'nvim $HOME/.config/i3/config'
abbr -a rc 'nvim $HOME/.config/fish/config.fish'
abbr -a src 'source $HOME/.config/fish/config.fish'
abbr -a tk 'tmux kill-session -t'
abbr -a ta 'tmux a -t'
abbr -a tn 'tmux new -s'
abbr -a tl 'tmux ls'
abbr -a tt '$HOME/dev/bin/tmux-sessionizer.sh | sh'
abbr -a vpn 'mullvad'
abbr -a vpns 'mullvad status'
abbr -a vpnc 'mullvad connect'
abbr -a vpnd 'mullvad disconnect'
abbr -a vpnl 'mullvad relay set location'
abbr -a ct 'cargo test'
abbr -a cr 'cargo run'
abbr -a pbcopy 'xsel --clipboard --input'
abbr -a pbpaste 'xsel --clipboard --output'

abbr -a gsync 'git stash; and git pull --rebase; and git stash pop'
abbr -a ga 'git add'
abbr -a gs 'git status'
abbr -a gc 'git commit'
abbr -a gco 'git checkout'
abbr -a gl 'git prettylog'
abbr -a gp 'git push'
abbr -a gt 'git tag'

abbr -a ng 'nvim +Neogit'

if status is-interactive
    # Commands to run in interactive sessions can go here
end


set -U fish_color_normal normal
set -U fish_color_command F8F8F2
set -U fish_color_quote F1FA8C
set -U fish_color_redirection 8BE9FD
set -U fish_color_end 50FA7B
set -U fish_color_error FF5555
set -U fish_color_param 5FFFFF
set -U fish_color_comment 6272A4
set -U fish_color_match --background=brblue
set -U fish_color_selection white --bold --background=brblack
set -U fish_color_search_match bryellow --background=brblack
set -U fish_color_history_current --bold
set -U fish_color_operator 00a6b2
set -U fish_color_escape 00a6b2
set -U fish_color_cwd green
set -U fish_color_cwd_root red
set -U fish_color_valid_path --underline
set -U fish_color_autosuggestion BD93F9
set -U fish_color_user brgreen
set -U fish_color_host normal
set -U fish_color_cancel -r
set -U fish_pager_color_completion normal
set -U fish_pager_color_description B3A06D yellow
set -U fish_pager_color_prefix white --bold --underline
set -U fish_pager_color_progress brwhite --background=cyan


set -g fish_greeting
fish_vi_key_bindings

set -Ux PYENV_ROOT $HOME/.pyenv
fish_add_path $PYENV_ROOT/bin

source $HOME/.xprofile

set -Ux PROJECTS $HOME/dev
set --universal EDITOR nvim

setenv FZF_DEFAULT_COMMAND 'fd --type file --follow'
setenv FZF_CTRL_T_COMMAND 'fd --type file --follow'
setenv FZF_DEFAULT_OPTS '--height 20%'

set -Ua fish_user_paths $HOME/.cargo/bin

zoxide init fish | source
starship init fish | source
pyenv init - | source

# Created by `pipx` on 2023-12-17 16:49:28
set PATH $PATH /home/rami/.local/bin
