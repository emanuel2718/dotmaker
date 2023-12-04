abbr -a .. 'cd ..'
abbr -a ... 'cd ../..'
abbr -a .... 'cd ../../..'
abbr -a cal 'cal -y'
abbr -a i3config 'nvim $HOME/.config/i3/config'
abbr -a nrc 'nvim $HOME/.config/nvim'
abbr -a rc 'nvim $HOME/.config/fish/config.fish'
abbr -a src 'source $HOME/.config/fish/config.fish'
abbr -a gsync 'git stash; and git pull --rebase; and git stash pop'
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


if status is-interactive
    # Commands to run in interactive sessions can go here
end


set -g fish_greeting
fish_vi_key_bindings

source $HOME/.xprofile


function fish_prompt
	set_color brblack
	echo -n "["(date "+%H:%M")"] "
	set_color blue
	echo -n (hostnamectl hostname)
	if [ $PWD != $HOME ]
		set_color brblack
		echo -n ':'
		set_color yellow
		echo -n (basename $PWD)
	end
	set_color green
	printf '%s ' (__fish_git_prompt)
	set_color red
	echo -n '| '
	set_color normal
end

set --universal EDITOR /usr/local/bin/vim

setenv FZF_DEFAULT_COMMAND 'fd --type file --follow'
setenv FZF_CTRL_T_COMMAND 'fd --type file --follow'
setenv FZF_DEFAULT_OPTS '--height 20%'

set -Ua fish_user_paths $HOME/.cargo/bin

zoxide init fish | source
starship init fish | source
