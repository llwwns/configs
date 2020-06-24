local plug = vim.fn["plug#"]
vim.fn["plug#begin"](vim.fn.stdpath('data') .. '/plugged')
plug('ryanoasis/vim-devicons' )
plug('Yggdroot/indentLine')
plug('tpope/vim-fugitive')
plug('mg979/vim-visual-multi')
plug('easymotion/vim-easymotion')
plug('haya14busa/vim-easyoperator-line')
if os.getenv("TMUXLINE") == '1' then
  plug('edkolev/tmuxline.vim')
end

plug('tpope/vim-unimpaired')
plug('godlygeek/tabular', { on = { 'Tabularize' }})
plug('mbbill/undotree', { on = { 'UndotreeShow' }})
plug('maksimr/vim-jsbeautify')
-- plug('einars/js-beautify')
plug('tpope/vim-abolish')
plug('tpope/vim-surround')
plug('wellle/targets.vim')
plug('mattn/emmet-vim')
plug('FooSoft/vim-argwrap', { on = {'ArgWrap'}})
plug('leafgarland/typescript-vim')
plug('ianks/vim-tsx')
plug('junegunn/vim-easy-align')
plug('w0rp/ale')
plug('sheerun/vim-polyglot')
plug('vim-airline/vim-airline')
plug('AndrewRadev/deleft.vim')
plug('neovim/nvim-lsp')
plug('haorenW1025/completion-nvim')
plug('scrooloose/nerdtree', { on = { 'NERDTreeToggle', 'NERDTreeFind' }})
plug('vim-scripts/BufOnly.vim', {on = {'BOnly'}})
plug('dbeniamine/todo.txt-vim')
plug('houtsnip/vim-emacscommandline')
plug('RRethy/vim-illuminate')
plug('junegunn/gv.vim', { on = { 'GV' }})
plug('lambdalisue/suda.vim')
plug('skywind3000/asyncrun.vim', { on = {'AsyncRun'} })
plug('tyru/eskk.vim')
plug('powerman/vim-plugin-AnsiEsc', { on = {'AnsiEsc'} })
-- plug('rhysd/reply.vim')
plug('tpope/vim-endwise')
plug('tomtom/tcomment_vim')
plug('bronson/vim-trailing-whitespace')
plug('machakann/vim-swap')
plug('mechatroner/rainbow_csv')
-- plug('tyrannicaltoucan/vim-quantum')
plug('google/vim-searchindex')
plug('junegunn/fzf', { dir = '~/fzf', ['do'] = './install --all' })
plug('junegunn/fzf.vim')
-- plug('whatyouhide/vim-gotham')
plug('rhysd/try-colorscheme.vim', { on = {'TryColorscheme'}})
plug('airblade/vim-gitgutter')
plug('tpope/vim-dadbod', { on = { 'DB' }})
plug('kristijanhusak/vim-dadbod-ui', { on = {'DBUI'}})
plug('glacambre/firenvim') -- , { ['do'] = function() vim.fn['firenvim#install'](0) end })
plug('norcalli/nvim-colorizer.lua')
plug('haorenW1025/diagnostic-nvim')
-- plug('nvim-treesitter/nvim-treesitter')
plug('sainnhe/sonokai')
plug('rhysd/git-messenger.vim')
plug('kassio/neoterm', { on = {'Ttoggle'} })
plug('wbthomason/lsp-status.nvim')
plug('AndrewRadev/bufferize.vim')
plug('liuchengxu/vim-which-key', { on = {'WhichKey', 'WhichKey!'} })
vim.fn["plug#end"]()
