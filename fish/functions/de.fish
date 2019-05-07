function de
  if set -q current_docker
    docker exec -it $current_docker $argv
  else
    docker exec -it (docker ps --format "{{.Names}}" | fzf) $argv
  end
end
