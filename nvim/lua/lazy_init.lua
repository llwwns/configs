local install_path = (vim.fn.stdpath("data") .. "/lazy/lazy.nvim")
if not vim.loop.fs_stat(install_path) then
  vim.cmd("!git clone https://github.com/folke/lazy.nvim --filter=blob:none --single-branch " ..
    install_path)
end

(vim.opt.runtimepath):prepend(install_path)
return (require("lazy")).setup({
  {
    "lukas-reineke/indent-blankline.nvim",
    lazy = false,
    config = function()
      require("ibl").setup({
        indent = {
          char = "│"
        },
        scope = {
          enabled = true,
          show_start = false,
        },
      })
    end,
  },
  -- {
  --   "shellRaining/hlchunk.nvim",
  --   event = { "UIEnter" },
  --   opts = {
  --     chunk = {
  --       enable = true,
  --       style = "#7fb4ca",
  --       chars = {
  --         horizontal_line = "─",
  --         vertical_line = "│",
  --         left_top = "┌",
  --         left_bottom = "└",
  --         right_arrow = "─",
  --       },
  --     },
  --     line_num = {
  --       enable = false,
  --       style = "#957fb8",
  --     },
  --     blank = {
  --       enable = false,
  --     },
  --   },
  -- },
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
    config = function() require("heirline_init3") end,
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
      -- "nvim-lua/plenary.nvim",
      "SmiteshP/nvim-navic",
    }
  },
  {
    "stevearc/conform.nvim",
    tag = "stable",
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

  -- { 'saghen/blink.compat', config = true, lazy = true },
  -- {
  --   'saghen/blink.cmp',
  --   version = 'v0.*',
  --   dependencies = { 'L3MON4D3/LuaSnip', 'saghen/blink.compat' },
  --   config = function()
  --     require("words");
  --     require("blink.cmp").setup {
  --       keymap = { preset = 'default' },
  --       signature = { enabled = true },
  --       sources = {
  --         default = {
  --           'lsp', 'path', 'buffer', 'words', 'snippets', "cmdline"
  --         },
  --         providers = {
  --           words = {
  --             name = 'words',
  --             module = 'blink.compat.source',
  --           }
  --         }
  --       },
  --       snippets = { preset = 'luasnip' },
  --     }
  --   end,
  -- },

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
  --   init = function()
  --     vim.g["eskk#enable_completion"] = 1
  --     -- vim.g["eskk#server"] = {
  --     --   host = 'localhost',
  --     --   port = 1178,
  --     --   encoding = 'euc-jp',
  --     --   timeout = 1000,
  --     --   type = 'dictionary',
  --     -- }
  --     vim.g["eskk#show_candidates_count"] = 1
  --   end,
  --   config = function()
  --     g = vim.api.nvim_create_augroup("skk", { clear = true })
  --     vim.api.nvim_create_autocmd("User eskk-enable-pre", {
  --       callback = function()
  --         vim.opt_local.cmdheight = 1
  --       end,
  --       group = g,
  --     })
  --     -- vim.api.nvim_create_autocmd("User eskk-disable-post", {
  --     --   callback = function()
  --     --     vim.notify("disable")
  --     --     vim.opt_local.cmdheight = 0
  --     --   end,
  --     --   group = g,
  --     -- })
  --   end,
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
      vim.fn["skkeleton#config"]({
        showCandidatesCount = 1,
        globalDictionaries = { { "~/configs/SKK-JISYO.L", "euc-jp" } },
      })
    end,
  },
  { "powerman/vim-plugin-AnsiEsc", lazy = true, cmd = { "AnsiEsc" } },
  -- {
  --   "numToStr/Comment.nvim",
  --   lazy = true,
  --   keys = { { mode = "v", "gc" }, { mode = "v", "gb" } },
  --   opts = { extra = {}, extended = false },
  -- },
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
    -- dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitsigns").setup({
        numhl = true,
        signs = {
          add = {
            text = "+",
          },
          change = {
            text = "~",
          },
          delete = {
            text = "_",
          },
          topdelete = {
            text = "‾",
          },
          changedelete = {
            text = "~",
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
    "NeogitOrg/neogit",
    lazy = true,
    cmd = { "Neogit" },
    config = function() require("neogit_init") end,
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
  { "windwp/nvim-ts-autotag", config = true },
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
  -- { "j-hui/fidget.nvim", config = true, tag = "legacy" },
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
    "nvimtools/hydra.nvim",
    config = function() require("hydra_init") end,
    -- dependencies = "anuvyklack/keymap-layer.nvim",
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
  -- { "tiagovla/scope.nvim", config = true },
  {
    "rcarriga/nvim-notify",
    config = function()
      local notify = require("notify")
      notify.setup({ background_colour = "#1F1F28" })
      vim.notify = notify
    end
  },
  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    config = true,
  },
  { "monaqa/dial.nvim", config = function() require("dial_init") end, lazy = true },
  { "mizlan/iswap.nvim", lazy = true, opts = { flash_style = false, move_cursor = true } },
  { "rcarriga/nvim-dap-ui", lazy = true, dependencies = { "nvim-neotest/nvim-nio" } },
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
    opts = {
      flags = {
        noEmit = true,
        pretty = "false",
        -- watch = true,
      },
      bin_path = os.getenv("HOME") .. "/.local/share/pnpm/tsgo"
    },
    cmd = { "TSC" }
  },
  {
    "backdround/improved-search.nvim",
    lazy = true,
  },
  {
    "zeioth/heirline-components.nvim",
    lazy = true,
  },
  {
    "jdrupal-dev/parcel.nvim",
    lazy = true,
    dependencies = {
      "phelipetls/jsonpath.nvim",
    },
    opts = { default_enabled = false },
    cmd = { "ParcelToggle" },
    ft = { "json", "toml" },
  },
  {
    "folke/ts-comments.nvim",
    opts = {},
    event = "VeryLazy",
  },
  -- "vim-denops/denops.vim",
  -- "vim-denops/denops-helloworld.vim",
  {
    "github/copilot.vim",
    lazy = true,
    cmd = { "Copilot" },
  },
  {
    "dundalek/bloat.nvim",
    cmd = "Bloat",
  },
})
