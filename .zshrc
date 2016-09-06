#export ZSH=$HOME/.oh-my-zsh
#ZSH_THEME="mh_m"
#source $ZSH/oh-my-zsh.sh
source "$HOME/.zprezto/init.zsh"

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
function extract() {
  case $1 in
    *.tar.gz|*.tgz) tar xzvf $1;;
    *.tar.xz) tar Jxvf $1;;
    *.zip) unzip $1;;
    *.lzh) lha e $1;;
    *.tar.bz2|*.tbz) tar xjvf $1;;
    *.tar.Z) tar zxvf $1;;
    *.gz) gzip -d $1;;
    *.bz2) bzip2 -dc $1;;
    *.Z) uncompress $1;;
    *.tar) tar xvf $1;;
    *.arj) unarj $1;;
  esac
}
alias -s {gz,tgz,zip,lzh,bz2,tbz,Z,tar,arj,xz}=extract
alias -s rb=ruby
alias -s php=vim
alias -s tpl=vim
alias -s coffee=coffee
alias -g cb="\$(git rev-parse --abbrev-ref HEAD)"
alias -g ocb="origin/\$(git rev-parse --abbrev-ref HEAD)"
alias -g oocb="origin \$(git rev-parse --abbrev-ref HEAD)"
alias -g dcb="develop...\$(git rev-parse --abbrev-ref HEAD)"
alias -g fb='$(git branch | fzf)'
alias -g fba='$(git branch -a | fzf | perl -pe '"'"'s/remotes\/\w+\///g'"'"')'
if [ -f "$HOME/.zshrc_ex" ]; then
  source $HOME/.zshrc_ex
fi
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/.vim/bundle/gruvbox/gruvbox_256palette.sh
function weather() {
    curl "wttr.in/$1"
}

zstyle ':prezto:module:editor:info:keymap:primary' format '%B%F{1}$%f%b'
zstyle ':prezto:module:editor:info:keymap:primary:overwrite' format '%F{3}$%f'
zstyle ':prezto:module:editor:info:keymap:alternate' format '%B%F{2}$%f%b'
bindkey '^ ' autosuggest-accept

function prompt_sorin_precmd {
    setopt LOCAL_OPTIONS
    unsetopt XTRACE KSH_ARRAYS
    prompt_sorin_pwd
    RPROMPT='$(git rev-parse --abbrev-ref HEAD 2> /dev/null || echo "")'
}
setopt clobber
unsetopt CORRECT
alias tree=tree\ -N

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
function killp {
    args=
    for arg in "$@";
    do
      args="$args '$arg'"
    done
    echo $args
    eval exec 'ps' $args | fzf | perl -pe 's/^\s*(\d+)\s.*$/\1/g' | xargs kill -7
}
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
