# Defined via `source`
function gc --wraps='git checkout (git for-each-ref --sort=-committerdate --format="%(refname:short)" | fzf)' --wraps='git checkout (git for-each-ref "refs/heads/" --sort=-committerdate --format="%(refname:short)" | fzf)' --wraps='exec_if_exist_2 git checkout (git for-each-ref "refs/heads/" --sort=-committerdate --format="%(refname:short)" | fzf)' --description 'alias gc=exec_if_exist_2 git checkout (git for-each-ref "refs/heads/" --sort=-committerdate --format="%(refname:short)" | fzf)'
  exec_if_exist_2 git checkout (git for-each-ref "refs/heads/" --sort=-committerdate --format="%(refname:short)" | fzf) $argv; 
end
