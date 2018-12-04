if test -e $HOME/.fishenv
  source $HOME/.fishenv
end
set PATH $PATH $HOME/fzf/bin
set -x FZF_FIND_FILE_COMMAND 'fd'
set -x FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
#fish_vi_key_bindings
