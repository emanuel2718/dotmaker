#!/usr/bin/env fish

# increase frecency
function increase
    set selected "$argv[1]"
    if test "$selected" = default
        return 0
    end
    zoxide add $PROJECTS/$selected
end

function search
    find "$PROJECTS" -maxdepth 1 -type d |
        while read p
            zoxide query -l -s "$p/"
        end |
        sed "s;$PROJECTS/;;" | # removes the ~/dev/ prefix
        grep -v "$PROJECTS" | # removes the ~/dev folder itself
        sort -rnk1 | # sort by score
        uniq | # dedup
        awk '{print $2}' | # do not actually print the score
        fzf-tmux -p --no-sort --prompt "  "
end

if test (count $argv) -eq 1
    set selected "$argv[1]"
else
    set selected $(search)
end

if test -z $selected
    exit 0
end

set selected_name (basename "$selected" | tr . _)
set tmux_running (pgrep tmux)

if test -z "$TMUX" && test -z "$tmux_running"
    tmux new-session -s "$selected_name" -c "$PROJECTS/$selected"
    increase "$selected"
    exit 0
end

if ! tmux has-session -t="$selected_name" 2>/dev/null
    tmux new-session -ds "$selected_name" -c "$PROJECTS/$selected"
end

tmux switch-client -t "$selected_name"
increase "$selected"
