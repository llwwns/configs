bind -M insert \cv edit_command_buffer
bind -M normal \cv edit_command_buffer
function _zoxide_hook --on-variable PWD
    zoxide add
end
set -g fish_function_path $HOME/configs/fish/functions $fish_function_path
set -x EDITOR nvim
