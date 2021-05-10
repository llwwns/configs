bind -M insert \cv edit_command_buffer
bind -M normal \cv edit_command_buffer
function __zoxide_hook --on-variable PWD
		command zoxide add -- (__zoxide_pwd)
end
set -g fish_function_path $HOME/configs/fish/functions $fish_function_path
set -x EDITOR nvim
