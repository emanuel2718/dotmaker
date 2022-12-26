if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting

set -Ux EDITOR nvim
set -Ux VISUAL $EDITOR

set -Ux DOTFILES ~/.config
set -Ux PROJECTS ~/developer

abbr -a yr 'cal -y'
abbr -a rc 'nvim $DOTFILES/fish/config.fish'
abbr -a src 'source $DOTFILES/fish/config.fish'
abbr -a ns 'cp -r $DOTFILES/nvim/ $PROJECTS/personal/dotmaker/.config'


# ----- TMUX -----
abbr -a tk 'tmux kill-session -t'
abbr -a tkk 'tmux-kill-sessions'
abbr -a ta 'tmux a -t'
abbr -a tn 'tmux new -s'
abbr -a tl 'tmux ls'

# ---- COQUI-ONE ----
abbr -a cos 'AWS_PROFILE=coqui-one pnpm nx run coqui-one:start'
abbr -a cor 'AWS_PROFILE=coqui-one pnpm nx run coqui-one:remove'
abbr -a cout 'AWS_PROFILE=coqui-one nx run coqui-one:test'
abbr -a cot 'AWS_PROFILE=coqui-one nx run coqui-one:component-test'
abbr -a cotw 'AWS_PROFILE=coqui-one nx run coqui-one:component-test --watch'
abbr -a cet 'AWS_PROFILE=coqui-one nx run coqui-one:e2e'
abbr -a cetw 'AWS_PROFILE=coqui-one nx run coqui-one:e2e --watch'

abbr -a pns "pnpm nx start"
abbr -a yns "yarn nx start"
abbr -a ynsa "REACT_APP_ENABLE_CUSTOM_AUTH=true yarn nx run schools:start"
abbr -a yts "yarn nx test schools"
abbr -a cts "yarn nx e2e schools-e2e"
abbr -a ctsw "yarn nx e2e schools-e2e --watch"
abbr -a cotsw "pnpm nx e2e coqui-one-e2e --watch"
abbr -a yb "yarn nx affected --base=HEAD~1 --target=build --parallel=3"
abbr -a yt 'yarn nx affected --base=HEAD~1 --target=test --parallel=3'
abbr -a yl 'yarn nx affected --target=lint'
abbr -a gp "git pull --rebase"
abbr -a python 'python3'
abbr -a pip 'pip3'
abbr -a vim nvim
abbr -a ncc 'nvim $HOME/.config/nvim'
abbr -a gg 'lazygit'

# ----- RUST -----
abbr -a cb 'cargo build'
abbr -a ct 'cargo test'
abbr -a cr 'cargo run'
abbr -a cex 'cargo --explain'
# ----------------


fish_vi_key_bindings insert
#fzf_configure_bindings
fzf_configure_bindings --git_log=\cg
fzf_configure_bindings --git_status=\cs
fzf_configure_bindings --directory=\f
fzf_configure_bindings --processes=\cp


zoxide init fish | source


fish_add_path -a $HOME/bin $HOME/.local/bin $HOME/.cargo/bin




