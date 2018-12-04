function da
  docker attach (docker ps --format "{{.Names}}" | fzf) $argv
end
