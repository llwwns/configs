set PATH $PATH \
  $HOME/platform-tools \
  $HOME/go/bin \
  $HOME/.gem/ruby/2.5.0/bin \
  $HOME/.yarn/bin \
  $HOME/fzf/bin
set -x FFF_OPENER /usr/sbin/wslview
set -x DOCKER_HOST tcp://localhost:2375
set -x NNN_USE_EDITOR 1
set -x FZF_FIND_FILE_COMMAND 'fd'
set -x FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
#fish_vi_key_bindings
