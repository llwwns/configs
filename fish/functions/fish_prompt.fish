function fish_prompt --description 'Write out the prompt'
  set -lx STARSHIP_CONFIG ~/configs/starship.toml
  starship prompt
  # echo -n (set_color red)(prompt_hostname):(set_color green)(prompt_pwd)
  # if set -l branch (__fish_git_prompt)
  #   echo -n (set_color blue)$branch
  # end
  # set_color normal
  # echo -n (set_color yellow) 'λ '(set_color normal)
end
