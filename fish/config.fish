bind -M insert \cv edit_command_buffer
bind -M normal \cv edit_command_buffer
#function __zoxide_hook --on-variable PWD
#    test -z "$fish_private_mode"
#    and command zoxide add -- (__zoxide_pwd)
#end
set -g fish_function_path $HOME/configs/fish/functions $fish_function_path
set -x EDITOR nvim
set -x GOPATH $XDG_DATA_HOME/go
set fish_greeting
zoxide init fish | source
#set __zoxide_z_prefix 'z!'
#complete --command z --no-files --arguments '(__zoxide_z_complete)'
