function fish_prompt --description 'Write out the prompt'
  echo -n (set_color red)(hostname | cut -d . -f 1):(set_color green)(prompt_pwd)
  if set -l branch (__fish_git_prompt)
    echo -n (set_color blue)$branch
  end
  
  echo -n (set_color normal) '$ '
end
