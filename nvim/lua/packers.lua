local startup
if not pcall(function()
  vim.cmd [[packadd packer.nvim]]
  startup = require('packer').startup
end) then
  local install_path = vim.fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.cmd('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  end
  vim.cmd [[packadd packer.nvim]]
  startup = require('packer').startup
end

startup(function(use)
  use{'wbthomason/packer.nvim', opt = true}
  use('ryanoasis/vim-devicons')
  -- use('Yggdroot/indentLine')
  use{'lukas-reineke/indent-blankline.nvim', branch = 'lua'}
  use('tpope/vim-fugitive')
  use('mg979/vim-visual-multi')
  use('easymotion/vim-easymotion')
  use('haya14busa/vim-easyoperator-line')
  if os.getenv("TMUXLINE") == '1' then
    use('edkolev/tmuxline.vim')
  end
  use('tpope/vim-unimpaired')
  use{'godlygeek/tabular', opt = true, cmd = { 'Tabularize' }}
  use('maksimr/vim-jsbeautify')
  use('tpope/vim-abolish')
  use('tpope/vim-surround')
  use('wellle/targets.vim')
  use{'mattn/emmet-vim', opt = true, keys = {{'i', '<c-y>,'}}}
  use{'FooSoft/vim-argwrap', opt = true, cmd = {'ArgWrap'}}
  use('junegunn/vim-easy-align')
  use('w0rp/ale')
  use('sheerun/vim-polyglot')
  use('vim-airline/vim-airline')
  use('AndrewRadev/deleft.vim')
  use{'neovim/nvim-lspconfig',
    -- requires = {'nvim-lua/completion-nvim',opt = true, 'glepnir/lspsaga.nvim', opt = true},
    requires = {'hrsh7th/nvim-compe',opt = true, 'glepnir/lspsaga.nvim', opt = true},
    config = function() require'lsp_init' end,
  }
  use('nvim-lua/lsp_extensions.nvim')
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
  use{'junegunn/fzf.vim', opt = true, cmd = {"Files", "Buffers"}}
  -- use {
  --   'nvim-telescope/telescope.nvim',
  --   requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
  --   -- opt = true,
  --   -- cmd = { "Telescope" },
  --   config = function() require'telescope_init' end
  -- }
  -- use('whatyouhide/vim-gotham')
  use{'tpope/vim-dadbod', opt = true, cmd = { 'DBUI' }}
  use{'kristijanhusak/vim-dadbod-ui', opt = true, cmd = {'DBUI'}}
  use('norcalli/nvim-colorizer.lua')
  -- use('sainnhe/sonokai')
  -- use{'kassio/neoterm', opt = true, cmd = {'Ttoggle', 'T'}}
  use{'AndrewRadev/bufferize.vim', opt = true, cmd = {'Bufferize'}}
  use('liuchengxu/vim-which-key', { on = {'WhichKey', 'WhichKey!'} })
  use('hrsh7th/vim-vsnip')
  use('hrsh7th/vim-vsnip-integ')
  use('luochen1990/rainbow')
  use{'nvim-treesitter/nvim-treesitter',
    config = function() require'treesitter_init' end
  }
  use('bluz71/vim-moonfly-colors')
  use('dstein64/nvim-scrollview')
  use('ChristianChiarulli/nvcode-color-schemes.vim')
  use('simnalamburt/vim-mundo', { on = { 'MundoShow', 'MundoToggle' } })
  use{'lewis6991/gitsigns.nvim',  requires = { 'nvim-lua/plenary.nvim' }, config = function()
      require('gitsigns').setup({
        numhl = true,
        signs = {
          add          = {hl = 'GitGutterAdd', text = '+', numhl='GitGutterAdd'},
          change       = {hl = 'GitGutterChange', text = '~', numhl='GitGutterChange'},
          delete       = {hl = 'GitGutterDelete', text = '-', numhl='GitGutterDelete'},
          topdelete    = {hl = 'GitGutterDelete', text = '-', numhl='GitGutterDelete'},
          changedelete = {hl = 'GitGutterChange', text = '~', numhl='GitGutterChange'},
        },
      })
  end}
  use('bluz71/vim-nightfly-guicolors')
  use('kevinhwang91/nvim-bqf')
  use{'akinsho/nvim-toggleterm.lua', opt = true, cmd = {'ToggleTerm', 'TermExec'}}
  use{'onsails/lspkind-nvim', config = function()
    require'lspkind'.init({
      with_text = true,
      symbol_map = {
        Text = '  ',
        Method = '  ',
        Function = '  ',
        Constructor = '  ',
        Variable = '[]',
        Class = ' פּ ',
        Interface = ' 蘒',
        Module = '  ',
        Property = '  ',
        Unit = ' 塞 ',
        Value = '  ',
        Enum = ' 練',
        Keyword = '  ',
        Snippet = '  ',
        Color = '  ',
        File = '  ',
        Folder = ' ﱮ ',
        EnumMember = '  ',
        Constant = '  ',
        Struct = '  ',
        Field = '  ',
        TypeParameter = '<>',
          Event = ' 練',
          Operator = '  ',
          Reference = '  ',
        },
    })
    end}
  use{'romgrk/nvim-treesitter-context', opt = true, cmd = { 'TSContextEnable' }}
  use('folke/tokyonight.nvim')
  use{'TimUntersberger/neogit', opt = true, cmd = { 'Neogit' }}
  use{'samoshkin/vim-mergetool', opt = true, cmd = { 'MergetoolStart' }}
  end)