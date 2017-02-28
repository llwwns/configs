zstyle ':completion:*' hosts off
source "${HOME}/.zgen/zgen.zsh"
if ! zgen saved; then
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zsh-autosuggestions
    zgen oh-my-zsh
    zgen oh-my-zsh themes/daveverwer
    zgen oh-my-zsh plugins/z
    zgen oh-my-zsh plugins/npm
    zgen oh-my-zsh plugins/adb
    zgen save
fi

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
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
    *.7z) 7z e $1;;
  esac
}
alias -s {gz,tgz,zip,lzh,bz2,tbz,Z,tar,arj,xz,7z}=extract
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
function weather() {
    curl "wttr.in/$1"
}

bindkey '^ ' autosuggest-accept
setopt clobber
unsetopt CORRECT
alias tree=tree\ -N

function killp {
    args=
    for arg in "$@";
    do
      args="$args '$arg'"
    done
    lst=(`eval exec 'ps' $args | fzf -m | perl -pe 's/^\s*(\d+)\s.*$/\1/g'`)
    for i in $lst[*]
    do
        echo $i  | xargs kill -7
    done
}
