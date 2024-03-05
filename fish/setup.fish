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
set -Ux PNPM_HOME $XDG_DATA_HOME/pnpm
set -Ux ASDF_DIR /opt/asdf-vm
set -Ux ASDF_DATA_DIR $XDG_DATA_HOME/asdf

fish_add_path -U $HOME/.local/bin
fish_add_path -U $CARGO_HOME/bin
fish_add_path -U $HOME/.deno/bin
fish_add_path -U $GOPATH/bin
fish_add_path -U $PNPM_HOME
fish_add_path -U $ASDF_DATA_DIR/shims

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
