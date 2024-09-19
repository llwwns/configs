function ulz --wraps="nvim --headless '+Lazy! update' +qa" --description "alias ulz=nvim --headless '+Lazy! update' +qa"
  nvim --headless '+Lazy! update' +qa $argv
        
end
