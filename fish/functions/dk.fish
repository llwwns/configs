function dk
  docker kill (docker ps --format "{{.Names}}" | fzf)
end
