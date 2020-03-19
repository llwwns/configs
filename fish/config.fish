bind -M insert \cv edit_command_buffer
function _zoxide_hook --on-event fish_prompt
    zoxide add
end
set -g fish_function_path $fish_function_path[1] $HOME/configs/fish/functions $fish_function_path[2..10000]

