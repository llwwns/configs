set -U EDITOR nvim
abbr --add sl ls
abbr --add vi nvim
set -U fish_user_paths $fish_user_paths $HOME/fzf/bin
set -xU FZF_DEFAULT_COMMAND fd
set -xU FZF_FIND_FILE_COMMAND fd
set -xU FZF_CTRL_T_COMMAND fd
