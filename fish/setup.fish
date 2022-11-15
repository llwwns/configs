set -U EDITOR nvim
abbr --add sl ls
abbr --add vi nvim
abbr --add view nvim -R

set -Ux XDG_CONFIG_HOME $HOME/.config
set -Ux XDG_CACHE_HOME $HOME/.cache
set -Ux XDG_DATA_HOME $HOME/.local/share
set -Ux XDG_STATE_HOME $HOME/.local/state
set -Ux CARGO_HOME $XDG_DATA_HOME/cargo
set -Ux GOPATH $XDG_DATA_HOME/go
set -Ux RUSTUP_HOME $XDG_DATA_HOME/rustup

set -U fish_user_paths $fish_user_paths $HOME/.local/bin
set -U fish_user_paths $fish_user_paths $HOME/.yarn/bin
set -U fish_user_paths $fish_user_paths $CARGO_HOME/bin
set -U fish_user_paths $fish_user_paths $HOME/.deno/bin
set -U fish_user_paths $fish_user_paths $GOPATH/bin
set -U fish_function_path $fish_function_path $HOME/configs/fish/functions
set -xU FZF_DEFAULT_COMMAND fd
set -xU FZF_FIND_FILE_COMMAND fd
set -xU FZF_CTRL_T_COMMAND fd
zoxide init fish | source
funcsave __zoxide_pwd
funcsave __zoxide_cd_internal
funcsave __zoxide_cd
funcsave __zoxide_z_complete
funcsave __zoxide_zi
funcsave z
funcsave zi
