function da
  #docker attach (docker ps --format "{{.Names}}" | fzf) $argv
  docker attach $current_docker $argv
end
