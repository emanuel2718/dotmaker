#!/bin/sh

test "$(tmux list-sessions | wc -l)" -gt 1 && \
	tmux list-sessions |
		grep -v attached |
		cut -f1 -d':' |
		xargs -n 1 tmux kill-session -t
