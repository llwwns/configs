local install_path = (vim.fn.stdpath("data") .. "/lazy/lazy.nvim")
if not vim.loop.fs_stat(install_path) then
  vim.cmd("!git clone https://github.com/folke/lazy.nvim --filter=blob:none --single-branch " ..
    install_path)
end

(vim.opt.runtimepath):prepend(install_path)

return (require("lazy")).setup({
  -- {
  --   "lukas-reineke/indent-blankline.nvim",
  --   lazy = false,
  --   init = function()
  --     -- vim.g.indent_blankline_char = "│"
  --     vim.g.indent_blankline_char = "▏"
  --     vim.g.indent_blankline_show_current_context = true
  --   end
  -- },
  {
    "shellRaining/hlchunk.nvim",
    event = { "UIEnter" },
    opts = {
      chunk = {
        enable = true,
        style = "#7fb4ca",
      },
      line_num = {
        enable = false,
        style = "#957fb8",
      },
      blank = {
        enable = false,
      },
    },
  },
  {
    "tpope/vim-fugitive",
    lazy = true,
    cmd = {
      "Git",
      "Gdiffsplit",
    }
  },
  {
    "mg979/vim-visual-multi",
    lazy = true,
    keys = {
      { mode = "v", "<c-n>" },
      "<c-n>", "<c-Up>", "<c-Down>",
    },
    init = function() vim.g.VM_theme = "codedark" end
  },
  {
    "godlygeek/tabular",
    lazy = true,
    cmd = { "Tabularize", },
  },
  {
    "tpope/vim-abolish",
    lazy = true,
    cmd = { "Abolish", "Subvert" },
    keys = { "crs", "crm", "crc", "cru", "cr-", "cr.", "cr ", "crt" },
  },
  "wellle/targets.vim",
  {
    "mattn/emmet-vim",
    lazy = true,
    keys = { mode = "i", "<c-y>" },
  },
  -- {
  --   "FooSoft/vim-argwrap",
  --   lazy = true,
  --   cmd = { "ArgWrap" },
  --   init = function()
  --     vim.g.argwrap_padded_braces = "{"
  --     vim.g.argwrap_tail_comma = true
  --   end,
  -- },
  { "Wansmer/treesj", lazy = true, use_default_keymaps = false, max_join_length = 512 },
  -- {
  --   "windwp/windline.nvim",
  --   config = function() require('wlsample.vscode').change_color("#1d1d2d") end,
  -- },
  {
    "rebelot/heirline.nvim",
    config = function() require("heirline_init") end,
    dependencies = {
      "rebelot/kanagawa.nvim",
    }
  },
  {
    "utilyre/barbecue.nvim",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    name = "barbecue",
    opts = {
      show_navic = true,
      create_autocmd = false,
    },
  },
  {
    "AndrewRadev/deleft.vim",
    lazy = true,
    init = function() vim.g.deleft_mapping = "<leader>dh" end,
    keys = { "<leader>dh" }
  },
  {
    "neovim/nvim-lspconfig",
    config = function() require("lsp_init") end,
    dependencies = {
      -- "nvimtools/none-ls.nvim",
      "nvim-lua/plenary.nvim",
      "SmiteshP/nvim-navic",
    }
  },
  {
    "stevearc/conform.nvim",
    config = function() require "conform_init" end,
  },
  {
    "mfussenegger/nvim-lint",
    config = function() require "lint_init" end,
  },
  {
    "hrsh7th/nvim-cmp",
    lazy = true,
    event = { "InsertEnter" },
    config = function() require("cmp_init") end,
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp-signature-help",
    },
  },
  "hrsh7th/cmp-nvim-lsp",
  { "nvim-lua/lsp_extensions.nvim", lazy = true },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    lazy = true,
    ft = { "netrw" },
    cmd = { "Neotree" },
    config = function() require("neotree_init") end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
  },
  { "vim-scripts/BufOnly.vim", lazy = true, cmd = { "BOnly" } },
  { "dbeniamine/todo.txt-vim", ft = { "todo" }, lazy = true },
  {
    "houtsnip/vim-emacscommandline",
    init = function() vim.g.EmacsCommandLineSearchCommandLineDisable = 1 end,
  },
  {
    "RRethy/vim-illuminate",
    config = function()
      require("illuminate").configure({ providers = { "regex" }, delay = 0 })
    end,
  },
  { "junegunn/gv.vim", lazy = true, cmd = { "GV" } },
  { "lambdalisue/suda.vim", lazy = true, cmd = { "SudaWrite" } },
  -- {
  --   "tyru/eskk.vim",
  --   init = function() vim.g["eskk#enable_completion"] = 1 end,
  --   lazy = true,
  --   keys = {
  --     { mode = "i", "<c-j>" },
  --     { mode = "c", "<c-j>" },
  --     { mode = "l", "<c-j>" },
  --   },
  -- },
  {
    "vim-skk/skkeleton",
    dependencies = { "vim-denops/denops.vim" },
    lazy = true,
    keys = {
      { mode = "i", "<Plug>(skkeleton-enable)" },
      { mode = "c", "<Plug>(skkeleton-enable)" },
    },
    config = function()
      vim.fn["skkeleton#config"]({ showCandidatesCount = 1 })
    end
  },
  { "powerman/vim-plugin-AnsiEsc", lazy = true, cmd = { "AnsiEsc" } },
  {
    "numToStr/Comment.nvim",
    lazy = true,
    keys = { { mode = "v", "gc" }, { mode = "v", "gb" } },
    opts = { extra = {}, extended = false },
  },
  {
    "mechatroner/rainbow_csv",
    lazy = true,
    ft = { "csv", "tsv" },
    init = function()
      vim.g.disable_rainbow_hover = 1
    end
  },
  { "AndrewRadev/bufferize.vim", lazy = true, cmd = { "Bufferize" } },
  {
    "L3MON4D3/LuaSnip",
    lazy = true,
    config = function() require("luasnip_init") end,
    dependencies = { "rafamadriz/friendly-snippets" },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    config = function() require("treesitter_init") end,
    -- dependencies = { "https://gitlab.com/HiPhish/nvim-ts-rainbow2" },
  },
  "RRethy/nvim-treesitter-endwise",
  { "petertriho/nvim-scrollbar", config = true },
  { "mbbill/undotree", lazy = true, cmd = "UndotreeToggle" },
  {
    "lewis6991/gitsigns.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitsigns").setup({
        numhl = true,
        signs = {
          add = {
            hl = "GitSignsAdd", text = "+", numhl = "GitSignsAdd",
          },
          change = {
            hl = "GitSignsChange", text = "~", numhl = "GitSignsChange",
          },
          delete = {
            hl = "GitSignsDelete", text = "_", numhl = "GitSignsDelete",
          },
          topdelete = {
            hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDelete",
          },
          changedelete = {
            hl = "GitSignsChange", text = "~", numhl = "GitSignsChange",
          }
        }
      })
      require("scrollbar.handlers.gitsigns").setup()
    end
  },
  {
    "kevinhwang91/nvim-bqf",
    opts = {
      preview = {
        delay_syntax = -1,
      },
    },
  },
  {
    "onsails/lspkind-nvim",
    config = function()
      return (require("lspkind")).init({
        mode = "text_symbol",
        symbol_map = {
          Text = "  ",
          Method = "  ",
          Function = "  ",
          Constructor = "  ",
          Variable = "  ",
          Class = "  ",
          Interface = "  ",
          Module = "  ",
          Property = "  ",
          Unit = "  ",
          Value = "  ",
          Enum = "  ",
          Keyword = "  ",
          Snippet = "  ",
          Color = "  ",
          File = "  ",
          Folder = "  ",
          EnumMember = "  ",
          Constant = "  ",
          Struct = "  ",
          Field = "  ",
          TypeParameter = "  ",
          Event = "  ",
          Operator = "  ",
          Reference = "  ",
        }
      })
    end
  },
  -- { "folke/tokyonight.nvim", opts = {
  --   sidebars = { "qf", "neo-tree", "FTerm", "packer" },
  --   transparent = true,
  -- }, priority = 1000 },
  -- "EdenEast/nightfox.nvim",
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    -- opts = {
    --   transparent = true,
    -- }
  },
  {
    "TimUntersberger/neogit",
    lazy = true,
    cmd = { "Neogit" },
    opts = {
      use_magit_keybindings = true,
      disable_commit_confirmation = true,
      integrations = { diffview = true },
      signs = { section = { "", "" }, item = { "", "" }, hunk = { "", "" } },
      sections = {
        staged = { folded = false },
        unstaged = { folded = false },
        untracked = { folded = false },
        stashes = { folded = true },
        unpulled = { folded = true, hidden = true },
        unmerged = { folded = true, hidden = true },
        recent = { folded = true },
      },
    },
  },
  {
    "samoshkin/vim-mergetool",
    lazy = true,
    cmd = { "MergetoolStart" },
    init = function()
      vim.g.mergetool_layout = "LmR"
      vim.g.mergetool_prefer_revision = "unmodified"
    end,
  },
  { "smoka7/hop.nvim", lazy = true, config = true },
  {
    "rebelot/terminal.nvim",
    lazy = true,
    opts = {
      cmd = { vim.o.shell },
      autoclose = true,
      layout = { open_cmd = "botright new" },
    }
  },
  "windwp/nvim-ts-autotag",
  { "ii14/lsp-command", lazy = true, cmd = { "Lsp" } },
  { "stevearc/dressing.nvim", opts = { select = { backend = { "telescope", "builtin" } } } },
  { cmd = { "NeoZoomToggle" }, config = true, lazy = true, "nyngwang/NeoZoom.lua" },
  {
    "ruifm/gitlinker.nvim",
    lazy = true,
    keys = {
      "<leader>gy",
      { mode = "v", "<leader>gy" },
    },
    config = true,
  },
  { "j-hui/fidget.nvim", config = true, tag = "legacy" },
  {
    "nvim-telescope/telescope.nvim",
    config = function() require("telescope_init") end,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "natecraddock/telescope-zf-native.nvim" },
    },
    lazy = true,
  },
  { "natecraddock/telescope-zf-native.nvim", lazy = true },
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewFileHistory", "DiffviewOpen" },
    config = function() require("diffview_init") end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    lazy = true,
  },
  "MunifTanjim/nui.nvim",
  {
    "bfredl/nvim-luadev",
    lazy = true,
    cmd = { "Luadev" },
    config = function()
      vim.keymap.set("n", "<leader>ll", "<Plug>(Luadev-RunLine)", { noremap = true, silent = true })
      vim.keymap.set({ "n", "v" }, "<leader>lr", "<Plug>(Luadev-Run)",
        { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>lw", "<Plug>(Luadev-RunWord)", { noremap = true, silent = true })
      vim.keymap.set("i", "<c-k><c-l>", "<Plug>(Luadev-Complete)", { noremap = true, silent = true })
    end,
  },
  {
    "anuvyklack/hydra.nvim",
    config = function() require("hydra_init") end,
    dependencies = "anuvyklack/keymap-layer.nvim",
  },
  {
    "ziontee113/icon-picker.nvim",
    lazy = true,
    cmd = {
      "PickEverything", "PickIcons", "PickEmoji", "PickNerd",
      "PickSymbols", "PickAltFont", "PickAltFontAndSymbols",
      "PickEverythingInsert", "PickIconsInsert", "PickEmojiInsert",
      "PickNerdInsert", "PickSymbolsInsert", "PickAltFontInsert", "PickAltFontAndSymbolsInsert",
    },
    config = function() require("icon-picker") end,
  },
  { "tiagovla/scope.nvim", config = true },
  {
    "rcarriga/nvim-notify",
    config = function()
      local notify = require("notify")
      notify.setup({ background_colour = "#1F1F28" })
      vim.notify = notify
    end
  },
  { "norcalli/nvim-colorizer.lua", config = true },
  { "monaqa/dial.nvim", config = function() require("dial_init") end, lazy = true },
  { "mizlan/iswap.nvim", lazy = true, opts = { flash_style = false, move_cursor = true } },
  { "rcarriga/nvim-dap-ui", lazy = true },
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    config = function() require("dap_init") end,
  },
  {
    "leoluz/nvim-dap-go",
    config = true,
    dependencies = { "mfussenegger/nvim-dap" },
    lazy = true,
  },
  { "dstein64/vim-startuptime", lazy = true, cmd = { "StartupTime" } },
  {
    "toppair/peek.nvim",
    build = "deno task --quiet build:fast",
    opts = {
      auto_load = true,
      close_on_bdelete = true,
      syntax = true,
      theme = "dark",
      update_on_change = true,
    },
    ft = "markdown",
    lazy = true,
  },
  -- {
  --   "nvim-zh/colorful-winsep.nvim",
  --   opts = {
  --     symbols = { "─", "│", "┌", "┐", "└", "┘" },
  --   },
  -- },
  -- {
  --   "hrsh7th/nvim-insx",
  --   config = function() require("insx_init") end,
  --   event = { "InsertEnter" },
  --   lazy = true,
  -- },
  {
    'vimwiki/vimwiki',
    lazy = true,
    keys = { "<leader>vww" },
    init = function()
      vim.g.vimwiki_conceallevel = 0
      vim.g.vimwiki_list = { { path = '~/Documents/vimwiki/wiki' } }
      vim.g.vimwiki_global_ext = 0
      -- vim.g.vimwiki_key_mappings = { global = 0 }
      vim.g.vimwiki_map_prefix = "<leader>vw"
      vim.g.wiki = {
        nested_syntaxes = { "bash", "json", "fish", "sql", "go", "javascript", "typescript" }
      }
      vim.g.vimwiki_folding = "custom"
    end
  },
  {
    "folke/neodev.nvim",
    config = true,
  },
  {
    "dmmulroy/tsc.nvim",
    lazy = true,
    config = true,
    cmd = { "TSC" }
  },
  {
    "folke/zen-mode.nvim",
    lazy = true,
    opts = {
      window = {
        width = 160,
      },
    },
  },
  {
    "backdround/improved-search.nvim",
    lazy = true,
  },
})
