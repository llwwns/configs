function fish_prompt --description 'Write out the prompt'
  echo -n (set_color red)(hostname | cut -d . -f 1):(set_color green)(prompt_pwd)
  if set -l branch (git rev-parse --abbrev-ref HEAD 2>/dev/null)
    echo -n (set_color blue) "($branch)"
  end
  set_color normal
  echo -n ' $ '
end
