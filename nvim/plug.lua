local plug = vim.fn["plug#"]
vim.fn["plug#begin"](vim.fn.stdpath('data') .. '/plugged')
plug('ryanoasis/vim-devicons')
plug('Yggdroot/indentLine')
plug('tpope/vim-fugitive')
plug('mg979/vim-visual-multi')
plug('easymotion/vim-easymotion')
plug('haya14busa/vim-easyoperator-line')
if os.getenv("TMUXLINE") == '1' then
  plug('edkolev/tmuxline.vim')
end

plug('othree/eregex.vim')
plug('tpope/vim-unimpaired')
plug('godlygeek/tabular')
plug('mbbill/undotree')
plug('maksimr/vim-jsbeautify')
plug('einars/js-beautify')
plug('digitaltoad/vim-pug')
plug('tpope/vim-abolish')
plug('rust-lang/rust.vim')
plug('tpope/vim-surround')
plug('wellle/targets.vim')
plug('mattn/emmet-vim')
plug('FooSoft/vim-argwrap')
plug('udalov/kotlin-vim')
plug('leafgarland/typescript-vim')
plug('ianks/vim-tsx')
plug('junegunn/vim-easy-align')
plug('w0rp/ale')
-- plug('sheerun/vim-polyglot')
plug('vim-airline/vim-airline')
plug('joshdick/onedark.vim')
plug('ElmCast/elm-vim')
plug('AndrewRadev/deleft.vim')
plug('lambdalisue/gina.vim')
if vim.fn.has('nvim-0.5.0') then
  plug('neovim/nvim-lsp')
  plug('haorenW1025/completion-nvim')
end


plug('vimlab/split-term.vim')
plug('equalsraf/neovim-gui-shim')
plug('sodapopcan/vim-twiggy')
plug('scrooloose/nerdtree')
plug('vim-scripts/BufOnly.vim')
plug('dbeniamine/todo.txt-vim')
plug('pangloss/vim-javascript')
plug('mxw/vim-jsx')
plug('houtsnip/vim-emacscommandline')
plug('b4b4r07/vim-hcl')
plug('reasonml-editor/vim-reason-plus')
plug('RRethy/vim-illuminate')
plug('junegunn/gv.vim')
plug('rhysd/git-messenger.vim')
plug('lambdalisue/suda.vim')
plug('skywind3000/asyncrun.vim')

plug('elixir-lang/vim-elixir')
plug('moll/vim-node')
plug('tyru/eskk.vim')
plug('AndrewRadev/splitjoin.vim')
plug('powerman/vim-plugin-AnsiEsc')
plug('rhysd/reply.vim')
plug('tpope/vim-endwise')
plug('tomtom/tcomment_vim')
plug('bronson/vim-trailing-whitespace')
plug('machakann/vim-swap')
plug('tpope/vim-rails')
plug('mechatroner/rainbow_csv')
plug('Shougo/deol.nvim')
plug('tyrannicaltoucan/vim-quantum')
plug('google/vim-searchindex')
plug('junegunn/fzf', { dir = '~/fzf', ['do'] = './install --all' })
plug('junegunn/fzf.vim')
plug('whatyouhide/vim-gotham')
plug('rhysd/try-colorscheme.vim')
plug('airblade/vim-gitgutter')
plug('tpope/vim-dadbod')
plug('kristijanhusak/vim-dadbod-ui')
plug('glacambre/firenvim') -- , { ['do'] = function() vim.fn['firenvim#install'](0) end })
plug('norcalli/nvim-colorizer.lua')
plug('haorenW1025/diagnostic-nvim')
plug('nvim-treesitter/nvim-treesitter')
plug('sainnhe/sonokai')
plug('elzr/vim-json')
plug('rhysd/git-messenger.vim')
vim.fn["plug#end"]()
