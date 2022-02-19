local startup
if not pcall(function()
  vim.cmd [[packadd packer.nvim]]
  startup = require("packer").startup
end) then
  local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/opt/packer.nvim"
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.cmd("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  end
  vim.cmd [[packadd packer.nvim]]
  startup = require("packer").startup
end

startup(function(use)
  use { "wbthomason/packer.nvim", opt = true }
  use "lukas-reineke/indent-blankline.nvim"
  use "tpope/vim-fugitive"
  use { "mg979/vim-visual-multi", opt = true, keys = { { "v", "<c-n>" } } }
  -- use{'edkolev/tmuxline.vim', opt = false, cmd = 'Tmuxline'}
  -- use('tpope/vim-unimpaired')
  use { "godlygeek/tabular", opt = true, cmd = { "Tabularize" } }
  use {
    "maksimr/vim-jsbeautify",
    opt = true,
    cmd = {
      "JsBeautify",
      "JsonBeautify",
      "JsxBeautify",
      "HtmlBeautify",
      "CSSBeautify",
    },
  }
  use "tpope/vim-abolish"
  use "tpope/vim-surround"
  use "wellle/targets.vim"
  use { "mattn/emmet-vim", opt = true, keys = { { "i", "<c-y>," } } }
  use { "FooSoft/vim-argwrap", opt = true, cmd = { "ArgWrap" } }
  -- use('sheerun/vim-polyglot')
  use {
    "windwp/windline.nvim",
    config = function()
      require "bubble_custom"
    end,
  }
  use {
    "AndrewRadev/deleft.vim",
    opt = true,
    keys = { { "n", "<leader>dh" } },
  }
  use {
    "neovim/nvim-lspconfig",
    requires = {
      "tami5/lspsaga.nvim",
      "jose-elias-alvarez/null-ls.nvim",
      "nvim-lua/plenary.nvim",
      "ray-x/lsp_signature.nvim",
    },
    config = function()
      require "lsp_init"
    end,
  }
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-path",
    },
    config = function()
      require "cmp_init"
    end,
  }
  use { "nvim-lua/lsp_extensions.nvim", opt = true, module = { "lsp_extensions" } }
  use {
    "kyazdani42/nvim-tree.lua",
    requires = "kyazdani42/nvim-web-devicons",
    opt = true,
    module = { "nvim-tree" },
    config = function()
      require "tree_init"
    end,
  }
  use { "vim-scripts/BufOnly.vim", opt = true, cmd = { "BOnly" } }
  use "dbeniamine/todo.txt-vim"
  use "houtsnip/vim-emacscommandline"
  use "RRethy/vim-illuminate"
  use { "junegunn/gv.vim", opt = true, opt = { "GV" } }
  use "lambdalisue/suda.vim"
  use {
    "tyru/eskk.vim",
    opt = true,
    keys = { { "i", "<c-j>" }, { "c", "<c-j>" }, { "l", "<c-j>" } },
  }
  use { "powerman/vim-plugin-AnsiEsc", opt = true, cmd = { "AnsiEsc" } }
  -- use('rhysd/reply.vim')
  use "tpope/vim-endwise"
  -- use { "tomtom/tcomment_vim", opt = true, keys = { { "v", "gc" } } }
  use {
    "numToStr/Comment.nvim",
    opt = true,
    keys = { { "v", "gc" }, { "v", "gb" } },
    config = function()
      require("Comment").setup { extra = {}, extended = false }
    end,
  }
  -- use "bronson/vim-trailing-whitespace"
  use {
    "machakann/vim-swap",
    opt = true,
    keys = { { "n", "g<" }, { "n", "g>" }, { "n", "gs" }, { "x", "gs" } },
  }
  use { "mechatroner/rainbow_csv", opt = true, ft = { "csv" } }
  use "google/vim-searchindex"
  -- use('junegunn/fzf', { dir = '~/fzf', ['do'] = './install --all' })
  use { "junegunn/fzf.vim", opt = true, cmd = { "Files", "Buffers" } }
  use {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  }
  use { "AndrewRadev/bufferize.vim", opt = true, cmd = { "Bufferize" } }
  use {
    "L3MON4D3/LuaSnip",
    opt = true,
    module = "luasnip",
    config = function()
      require "luasnip_init"
    end,
  }
  use "luochen1990/rainbow"
  use {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require "treesitter_init"
    end,
    requires = { "SmiteshP/nvim-gps" },
  }
  use "bluz71/vim-moonfly-colors"
  use "dstein64/nvim-scrollview"
  use { "mbbill/undotree", opt = true, cmd = { "UndotreeToggle" } }
  use {
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitsigns").setup {
        numhl = true,
        signs = {
          add = { hl = "GitGutterAdd", text = "+", numhl = "GitGutterAdd" },
          change = {
            hl = "GitGutterChange",
            text = "~",
            numhl = "GitGutterChange",
          },
          delete = {
            hl = "GitGutterDelete",
            text = "_",
            numhl = "GitGutterDelete",
          },
          topdelete = {
            hl = "GitGutterDelete",
            text = "‾",
            numhl = "GitGutterDelete",
          },
          changedelete = {
            hl = "GitGutterChange",
            text = "~",
            numhl = "GitGutterChange",
          },
        },
      }
    end,
  }
  use "bluz71/vim-nightfly-guicolors"
  use "kevinhwang91/nvim-bqf"
  use {
    "onsails/lspkind-nvim",
    config = function()
      require("lspkind").init {
        mode = "text_symbol",
        symbol_map = {
          Text = "  ",
          Method = "  ",
          Function = "  ",
          Constructor = "  ",
          Variable = "[]",
          Class = " פּ ",
          Interface = " 蘒",
          Module = "  ",
          Property = "  ",
          Unit = " 塞 ",
          Value = "  ",
          Enum = " 練",
          Keyword = "  ",
          Snippet = "  ",
          Color = "  ",
          File = "  ",
          Folder = " ﱮ ",
          EnumMember = "  ",
          Constant = "  ",
          Struct = "  ",
          Field = "  ",
          TypeParameter = "<>",
          Event = " 練",
          Operator = "  ",
          Reference = "  ",
        },
      }
    end,
  }
  use "folke/tokyonight.nvim"
  use {
    "TimUntersberger/neogit",
    opt = true,
    cmd = { "Neogit" },
    config = function()
      require("neogit").setup {
        disable_commit_confirmation = true,
        integrations = {
          diffview = true,
        },
        signs = {
          section = { "", "" },
          item = { "", "" },
          hunk = { "", "" },
        },
        sections = {
          staged = {
            folded = false,
          },
          unstaged = {
            folded = false,
          },
          untracked = {
            folded = false,
          },
          stashes = {
            folded = true,
          },
          unpulled = {
            folded = true,
          },
          unmerged = {
            folded = true,
          },
          recent = {
            folded = true,
          },
        },
      }
    end,
  }
  use { "samoshkin/vim-mergetool", opt = true, cmd = { "MergetoolStart" } }
  use {
    "phaazon/hop.nvim",
    opt = true,
    module = "hop",
    config = function()
      require("hop").setup()
    end,
  }
  use {
    opt = true,
    "numtostr/FTerm.nvim",
    module = "FTerm",
    config = function()
      require("FTerm").setup {
        dimensions = {
          height = 0.95,
          width = 0.8,
        },
      }
    end,
  }
  use "windwp/nvim-ts-autotag"
  use "lewis6991/impatient.nvim"
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    opt = true,
    cmd = { "Trouble" },
    config = function()
      require("trouble").setup {}
    end,
  }
  use {
    "ii14/lsp-command",
    opt = true,
    cmd = { "Lsp" },
  }
  use {
    "kyazdani42/nvim-web-devicons",
    opt = true,
    module = "nvim-web-devicons",
  }
  use {
    "stevearc/dressing.nvim",
    config = function()
      require("dressing").setup {
        select = {
          backend = { "builtin" },
        },
      }
    end,
  }
  use { "nyngwang/NeoZoom.lua", opt = true, cmd = { "NeoZoomToggle" } }
  use {
    "ruifm/gitlinker.nvim",
    opt = true,
    config = function()
      require("gitlinker").setup()
    end,
    keys = { { "v", "<leader>gy" }, { "n", "<leader>gy" } },
  }
  -- use {
  --   "j-hui/fidget.nvim",
  --   config = function()
  --     require("fidget").setup {}
  --   end,
  -- }
  use {
    opt = true,
    "nvim-telescope/telescope.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzy-native.nvim" },
    },
    module = { "telescope" },
    config = function()
      require "telescope_init"
    end,
  }
  use {
    opt = true,
    "nvim-telescope/telescope-fzy-native.nvim",
    module = { "telescope._extensions" },
  }
  use {
    "sindrets/diffview.nvim",
    requires = "nvim-lua/plenary.nvim",
    opt = true,
    module = "diffview",
    cmd = {
      "DiffviewFileHistory",
      "DiffviewOpen",
    },
    config = function()
      require "diffview_init"
    end,
  }
end)
