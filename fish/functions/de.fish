function de
  #docker exec -it (docker ps --format "{{.Names}}" | fzf) $argv
  docker exec -it $current_docker $argv
end
