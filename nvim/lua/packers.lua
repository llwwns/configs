require('packer').startup(function(use)
  use{'wbthomason/packer.nvim', opt = true}
  use('ryanoasis/vim-devicons' )
  use('Yggdroot/indentLine')
  use('tpope/vim-fugitive')
  use('mg979/vim-visual-multi')
  use('easymotion/vim-easymotion')
  use('haya14busa/vim-easyoperator-line')
  if os.getenv("TMUXLINE") == '1' then
    use('edkolev/tmuxline.vim')
  end
  use('tpope/vim-unimpaired')
  use{'godlygeek/tabular', opt = true, cmd = { 'Tabularize' }}
  -- use{'mbbill/undotree', opt = true, cmd = { 'UndotreeShow' }}
  use('maksimr/vim-jsbeautify')
  -- use('einars/js-beautify')
  use('tpope/vim-abolish')
  use('tpope/vim-surround')
  use('wellle/targets.vim')
  use('mattn/emmet-vim')
  use{'FooSoft/vim-argwrap', opt = true, cmd = {'ArgWrap'}}
  use('leafgarland/typescript-vim')
  use('ianks/vim-tsx')
  use('junegunn/vim-easy-align')
  use('w0rp/ale')
  use('sheerun/vim-polyglot')
  use('vim-airline/vim-airline')
  use('AndrewRadev/deleft.vim')
  use('neovim/nvim-lspconfig')
  use('haorenW1025/completion-nvim')
  use{'scrooloose/nerdtree', opt = true, cmd = { 'NERDTreeToggle', 'NERDTreeFind' }}
  use{'vim-scripts/BufOnly.vim', opt = true, cmd = {'BOnly'}}
  use('dbeniamine/todo.txt-vim')
  use('houtsnip/vim-emacscommandline')
  use('RRethy/vim-illuminate')
  use{'junegunn/gv.vim', opt = true, opt = { 'GV' }}
  use('lambdalisue/suda.vim')
  use{'skywind3000/asyncrun.vim', opt = true, cmd = {'AsyncRun'} }
  use('tyru/eskk.vim')
  use{'powerman/vim-plugin-AnsiEsc', opt = true, cmd = {'AnsiEsc'} }
  -- use('rhysd/reply.vim')
  use('tpope/vim-endwise')
  use('tomtom/tcomment_vim')
  use('bronson/vim-trailing-whitespace')
  use('machakann/vim-swap')
  use('mechatroner/rainbow_csv')
  -- use('tyrannicaltoucan/vim-quantum')
  use('google/vim-searchindex')
  -- use('junegunn/fzf', { dir = '~/fzf', ['do'] = './install --all' })
  use('junegunn/fzf.vim')
  -- use('whatyouhide/vim-gotham')
  use{'rhysd/try-colorscheme.vim', opt = true, cmd = {'TryColorscheme'}}
  use('airblade/vim-gitgutter')
  use{'tpope/vim-dadbod', opt = true, cmd = { 'DBUI' }}
  use{'kristijanhusak/vim-dadbod-ui', opt = true, cmd = {'DBUI'}}
  use('norcalli/nvim-colorizer.lua')
  use('sainnhe/sonokai')
  use{'kassio/neoterm', opt = true, cmd = {'Ttoggle'}}
  use('AndrewRadev/bufferize.vim')
  use('liuchengxu/vim-which-key', { on = {'WhichKey', 'WhichKey!'} })
  use('hrsh7th/vim-vsnip')
  use('hrsh7th/vim-vsnip-integ')
  use('luochen1990/rainbow')
  use('nvim-treesitter/nvim-treesitter')
  use('lukas-reineke/indent-blankline.nvim')
  use('bluz71/vim-moonfly-colors')
  use('Xuyuanp/scrollbar.nvim')
  use('ChristianChiarulli/nvcode-color-schemes.vim')
  use('simnalamburt/vim-mundo', { on = { 'MundoShow', 'MundoToggle' } })
end)
