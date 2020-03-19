set -U EDITOR nvim
abbr --add sl ls
abbr --add vi nvim
abbr --add view nvim -R
set -U fish_user_paths $fish_user_paths $HOME/fzf/bin
set -U fish_user_paths $fish_user_paths $HOME/.local/bin/
set -U fish_user_paths $fish_user_paths $HOME/.yarn/bin
set -U fish_user_paths $fish_user_paths $HOME/.cargo/bin/
set -U fish_user_paths $fish_user_paths $HOME/.deno/bin
set -U fish_user_paths $fish_user_paths $HOME/go/bin/
set -U fish_function_path $fish_function_path $HOME/configs/fish/functions
set -xU FZF_DEFAULT_COMMAND fd
set -xU FZF_FIND_FILE_COMMAND fd
set -xU FZF_CTRL_T_COMMAND fd
zoxide init fish | source
funcsave _z_cd
funcsave z
