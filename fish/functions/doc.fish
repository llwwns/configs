function doc
	set -g current_docker (docker ps --format "{{.Names}}" | fzf)
end
