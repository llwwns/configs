function uts --wraps="nvim --headless '+TSUpdateSync' +qa" --description "alias uts=nvim --headless '+TSUpdateSync' +qa"
  nvim --headless '+TSUpdateSync' +qa $argv
        
end
