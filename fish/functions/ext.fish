function ext
  switch $argv[1]
  case '*.tar.gz' '*.tgz'
    tar xzvf $argv[1]
  case '*.tar.xz'
    tar Jxvf $argv[1]
  case '*.zip'
    unzip $argv[1]
  case '*.lzh' lha e $argv[1]
  case '*.tar.bz2' '*.tbz'
    tar xjvf $argv[1]
  case '*.tar.Z'
    tar zxvf $argv[1]
  case '*.gz'
    gzip -d $argv[1]
  case '*.bz2'
    bzip2 -dc $argv[1]
  case '*.Z'
    uncompress $argv[1]
  case '*.tar'
    tar xvf $argv[1]
  case '*.arj'
    unarj $argv[1]
  case '*.7z'
    7z e $argv[1]
  case '*.rar'
    unrar e $argv[1]
  end
end
