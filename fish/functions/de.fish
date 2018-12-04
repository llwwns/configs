function de
  docker exec -it (docker ps --format "{{.Names}}" | fzf) $argv
end
