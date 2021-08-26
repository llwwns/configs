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
  use('lukas-reineke/indent-blankline.nvim')
  use('tpope/vim-fugitive')
  use{'mg979/vim-visual-multi', opt = true, keys = {{'v', '<c-n>'}}}
  -- use('easymotion/vim-easymotion')
  -- use('haya14busa/vim-easyoperator-line')
  -- use{'edkolev/tmuxline.vim', opt = false, cmd = 'Tmuxline'}
  -- use('tpope/vim-unimpaired')
  use{'godlygeek/tabular', opt = true, cmd = { 'Tabularize' }}
  use{'maksimr/vim-jsbeautify', opt = true, cmd = { 'JsBeautify', 'JsonBeautify', 'JsxBeautify', 'HtmlBeautify', 'CSSBeautify' }}
  use('tpope/vim-abolish')
  use('tpope/vim-surround')
  use('wellle/targets.vim')
  use{'mattn/emmet-vim', opt = true, keys = {{'i', '<c-y>,'}}}
  use{'FooSoft/vim-argwrap', opt = true, cmd = {'ArgWrap'}}
  use('junegunn/vim-easy-align')
  use('w0rp/ale')
  -- use('sheerun/vim-polyglot')
  -- use('vim-airline/vim-airline')
  use{'windwp/windline.nvim', config=function() require('bubble_custom') end}
  use{'AndrewRadev/deleft.vim', opt = true, keys = {{'n', '<leader>dh'}}}
  use{'neovim/nvim-lspconfig',
    requires = {'glepnir/lspsaga.nvim',
    'ray-x/lsp_signature.nvim',},
    config = function() require'lsp_init' end,
  }
  use{'hrsh7th/nvim-cmp', requires = {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-nvim-lsp'}, config=function() require('cmp_init') end
  }
  use('nvim-lua/lsp_extensions.nvim')
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    opt = true,
    module = {'nvim-tree'},
    config = function() require'tree_init' end
  }
  use{'vim-scripts/BufOnly.vim', opt = true, cmd = {'BOnly'}}
  use('dbeniamine/todo.txt-vim')
  use('houtsnip/vim-emacscommandline')
  use('RRethy/vim-illuminate')
  use{'junegunn/gv.vim', opt = true, opt = { 'GV' }}
  use('lambdalisue/suda.vim')
  use{'skywind3000/asyncrun.vim', opt = true, cmd = {'AsyncRun'} }
  use{'tyru/eskk.vim', opt = true, keys = {{'i', '<c-j>'},{'c', '<c-j>'},{'l', '<c-j>'},}}
  use{'powerman/vim-plugin-AnsiEsc', opt = true, cmd = {'AnsiEsc'} }
  -- use('rhysd/reply.vim')
  use('tpope/vim-endwise')
  use{'tomtom/tcomment_vim', opt = true, keys = {{'v', 'gc'}}}
  use('bronson/vim-trailing-whitespace')
  use{'machakann/vim-swap', opt = true, keys = {{'n', 'g<'},{'n', 'g>'},{'n', 'gs'},{'x', 'gs'}}}
  use('mechatroner/rainbow_csv')
  use('google/vim-searchindex')
  -- use('junegunn/fzf', { dir = '~/fzf', ['do'] = './install --all' })
  use{'junegunn/fzf.vim', opt = true, cmd = {"Files", "Buffers"}}
  use{'tpope/vim-dadbod', opt = true, cmd = { 'DBUI' }}
  use{'kristijanhusak/vim-dadbod-ui', opt = true, cmd = {'DBUI'}}
  use('norcalli/nvim-colorizer.lua')
  use{'AndrewRadev/bufferize.vim', opt = true, cmd = {'Bufferize'}}
  use('liuchengxu/vim-which-key', { on = {'WhichKey', 'WhichKey!'} })
  use('L3MON4D3/LuaSnip')
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
          delete       = {hl = 'GitGutterDelete', text = '_', numhl='GitGutterDelete'},
          topdelete    = {hl = 'GitGutterDelete', text = '‾', numhl='GitGutterDelete'},
          changedelete = {hl = 'GitGutterChange', text = '~', numhl='GitGutterChange'},
        },
      })
  end}
  use('bluz71/vim-nightfly-guicolors')
  use('kevinhwang91/nvim-bqf')
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
  use('folke/tokyonight.nvim')
  -- use{'TimUntersberger/neogit', opt = true, cmd = { 'Neogit' }}
  use{'samoshkin/vim-mergetool', opt = true, cmd = { 'MergetoolStart' }}
  use{'phaazon/hop.nvim', opt = true, module = 'hop'}
  use {
    opt = true,
    "numtostr/FTerm.nvim",
    module = 'FTerm',
    config = function()
        require("FTerm").setup({
            dimensions  = {
            height = 0.95,
            width = 0.8,
        },
      })
    end
  }
  use('windwp/nvim-ts-autotag')
  end)
