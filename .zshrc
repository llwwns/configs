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
zstyle ':prezto:module:git:info:added' format ' %%B%F{2}+%f%%b'
zstyle ':prezto:module:git:info:ahead' format ' %%B%F{13}->%f%%b'
zstyle ':prezto:module:git:info:behind' format ' %%B%F{13}<-%f%%b'
zstyle ':prezto:module:git:info:branch' format ' %%B%F{2}%b%f%%b'
zstyle ':prezto:module:git:info:commit' format ' %%B%F{3}%.7c%f%%b'
zstyle ':prezto:module:git:info:deleted' format ' %%B%F{1}x%f%%b'
zstyle ':prezto:module:git:info:modified' format ' %%B%F{4}m%f%%b'
zstyle ':prezto:module:git:info:position' format ' %%B%F{13}%p%f%%b'
zstyle ':prezto:module:git:info:renamed' format ' %%B%F{5}r%f%%b'
zstyle ':prezto:module:git:info:stashed' format ' %%B%F{6}s%f%%b'
zstyle ':prezto:module:git:info:unmerged' format ' %%B%F{3}u%f%%b'
zstyle ':prezto:module:git:info:untracked' format ' %%B%F{7}*%f%%b'

bindkey '^ ' autosuggest-accept
