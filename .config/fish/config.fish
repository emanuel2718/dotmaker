set fish_greeting
set fish_vi_key_bindings
set -x EDITOR vim
set -x DIRENV_LOG_FORMAT ""
set -x FZF_DEFAULT_OPTS --exact

function fish_mode_prompt; end


function gf
  git fetch --all --prune --tags
end

function gs
  git status
end

function gc
  git commit $argv
end

function gca
  git add -A; and git commit $argv
end

function gd
  git diff $argv
end

function gl
  git log $argv
end

function gp
  git pull $argv
end

function gb
  git push origin (git commit-tree -m "" (git mktree </dev/null) </dev/null):refs/heads/$argv[1]
  git checkout -b $argv[1]
  git push --set-upstream --force-with-lease origin $argv[1]
end


zoxide init fish | source
