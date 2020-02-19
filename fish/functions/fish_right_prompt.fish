function fish_right_prompt
  set -l status_copy $status
  set -l status_code $status_copy

  set -l color_normal (set_color normal)
  set -l color_error (set_color $fish_color_error)
  set -l color "$color_normal"
  #
	echo (set_color blue)$AWS_PROFILE$color_normal" "
	echo (set_color cyan)$current_docker$color_normal" "
  # if set -l job_id (last_job_id)
  #   echo -sn "$color%$job_id$color_normal "
  # end

if test "$status_copy" -ne 0
    echo -sn "$color_error$status_code$color_normal "
  end

  set -l duration "$CMD_DURATION$cmd_duration"
  if test "$duration" -gt 250
    echo -sn "$color"(echo "$duration" | humanize_duration)"$color_normal "
  else
    set -l venv_name (basename "$VIRTUAL_ENV")
    echo -sn "$color$venv_name$color_normal "
  end
end
