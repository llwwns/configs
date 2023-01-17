-- :fennel:generated
do
  local install_path = (vim.fn.stdpath("data") .. "/lazy/lazy.nvim")
  if not vim.loop.fs_stat(install_path) then
    vim.cmd(("!git clone https://github.com/folke/lazy.nvim --filter=blob:none --single-branch " .. install_path))
  else
  end
  do end (vim.opt.runtimepath):prepend(install_path)
end
local function _2_()
  vim.g["indent_blankline_char"] = "\226\148\130"
  vim.g["indent_blankline_show_current_context"] = true
  return nil
end
local function _3_()
  vim.g["VM_theme"] = "codedark"
  return nil
end
local function _4_()
  return require("bubble_custom")
end
local function _5_()
  vim.g["deleft_mapping"] = "<leader>dh"
  return nil
end
local function _6_()
  return require("lsp_init")
end
local function _7_()
  return require("cmp_init")
end
local function _8_()
  return require("neotree_init")
end
local function _9_()
  vim.g["EmacsCommandLineSearchCommandLineDisable"] = 1
  return nil
end
local function _10_()
  do end (require("illuminate")).configure({providers = {"regex"}, delay = 0})
  return vim.cmd("hi link IlluminatedWordText illuminatedWord")
end
local function _11_()
  vim.g["eskk#enable_completion"] = 1
  return nil
end
local function _12_()
  return require("luasnip_init")
end
local function _13_()
  return require("treesitter_init")
end
local function _14_()
  return (require("scrollbar")).setup()
end
local function _15_()
  do end (require("gitsigns")).setup({numhl = true, signs = {add = {hl = "GitGutterAdd", text = "+", numhl = "GitGutterAdd"}, change = {hl = "GitGutterChange", text = "~", numhl = "GitGutterChange"}, delete = {hl = "GitGutterDelete", text = "_", numhl = "GitGutterDelete"}, topdelete = {hl = "GitGutterDelete", text = "\226\128\190", numhl = "GitGutterDelete"}, changedelete = {hl = "GitGutterChange", text = "~", numhl = "GitGutterChange"}}})
  return (require("scrollbar.handlers.gitsigns")).setup()
end
local function _16_()
  return (require("lspkind")).init({mode = "text_symbol", symbol_map = {Text = " \238\170\147 ", Method = " \238\170\140 ", Function = " \238\170\140 ", Constructor = " \238\170\140 ", Variable = " \238\170\136 ", Class = " \238\173\155 ", Interface = " \238\173\161 ", Module = " \239\153\168 ", Property = " \238\173\165 ", Unit = " \238\170\150 ", Value = " \238\170\149 ", Enum = " \238\170\149 ", Keyword = " \238\173\162 ", Snippet = " \238\173\166 ", Color = " \238\173\156 ", File = " \238\169\187 ", Folder = " \238\170\131 ", EnumMember = " \238\170\149 ", Constant = " \238\173\157 ", Struct = " \238\170\145 ", Field = " \238\173\159 ", TypeParameter = " \238\156\150 ", Event = " \238\170\134 ", Operator = " \238\173\164 ", Reference = " \238\170\148 "}})
end
local function _17_()
  return (require("tokyonight")).setup({sidebars = {"qf", "neo-tree", "FTerm", "packer"}})
end
local function _18_()
  return (require("neogit")).setup({disable_commit_confirmation = true, integrations = {diffview = true}, signs = {section = {"\239\145\160", "\239\145\188"}, item = {"\239\145\160", "\239\145\188"}, hunk = {"", ""}}, sections = {staged = {folded = false}, unstaged = {folded = false}, untracked = {folded = false}, stashes = {folded = true}, unpulled = {folded = true}, unmerged = {folded = true}, recent = {folded = true}}})
end
local function _19_()
  vim.g["mergetool_layout"] = "LmR"
  vim.g["mergetool_prefer_revision"] = "unmodified"
  return nil
end
local function _20_()
  local function _21_()
    return (vim.fn.winheight("%") * 1.2)
  end
  local function _22_()
    vim.opt_local["spell"] = false
    vim.opt_local["number"] = false
    vim.opt_local["relativenumber"] = false
    vim.opt_local["winbar"] = ""
    return nil
  end
  return (require("toggleterm")).setup({hide_numbers = true, size = _21_, winbar = {enabled = false}, on_open = _22_})
end
local function _23_()
  return (require("dressing")).setup({select = {backend = {"telescope", "builtin"}}})
end
local function _24_()
  return (require("gitlinker")).setup()
end
local function _25_()
  return (require("fidget")).setup()
end
local function _26_()
  return require("telescope_init")
end
local function _27_()
  return require("diffview_init")
end
local function _28_()
  vim.keymap.set({"n"}, "<leader>ll", "<Plug>(Luadev-RunLine)", {noremap = true, silent = true})
  vim.keymap.set({"n", "v"}, "<leader>lr", "<Plug>(Luadev-Run)", {noremap = true, silent = true})
  vim.keymap.set({"n"}, "<leader>lw", "<Plug>(Luadev-RunWord)", {noremap = true, silent = true})
  return vim.keymap.set({"i"}, "<c-k><c-l>", "<Plug>(Luadev-Complete)", {noremap = true, silent = true})
end
local function _29_()
  return (require("tangerine")).setup({compiler = {verbose = false, hooks = {"onsave"}}})
end
local function _30_()
  return require("hydra_init")
end
local function _31_()
  return require("icon-picker")
end
local function _32_()
  return (require("scope")).setup()
end
local function _33_()
  local notify = require("notify")
  notify.setup()
  do end (vim)["notify"] = notify
  return nil
end
local function _34_()
  return (require("colorizer")).setup()
end
local function _35_()
  return require("dial_init")
end
local function _36_()
  return (require("iswap")).setup({flash_style = false, move_cursor = true})
end
local function _37_()
  return require("dap_init")
end
local function _38_()
  return (require("dap-go")).setup()
end
local function _39_()
  return (require("peek")).setup({auto_load = true, close_on_bdelete = true, syntax = true, theme = "dark", update_on_change = true})
end
local function _40_()
  return (require("colorful-winsep")).setup({symbols = {"\226\148\128", "\226\148\130", "\226\148\140", "\226\148\144", "\226\148\148", "\226\148\152"}})
end
local function _41_()
  return require("insx_init")
end
return (require("lazy")).setup({{init = _2_, lazy = false, "lukas-reineke/indent-blankline.nvim"}, "tpope/vim-fugitive", "tpope/vim-fugitive", {init = _3_, keys = {{mode = "v", "<c-n>"}, "<c-n>", "<c-Up>", "<c-Down>"}, lazy = true, "mg979/vim-visual-multi"}, {cmd = {"Tabularize"}, lazy = true, "godlygeek/tabular"}, {cmd = {"Abolish", "Subvert"}, keys = {"crs", "crm", "crc", "cru", "cr-", "cr.", "cr ", "crt"}, lazy = true, "tpope/vim-abolish"}, "wellle/targets.vim", {keys = {mode = "i", "<c-y>"}, lazy = true, "mattn/emmet-vim"}, {cmd = {"ArgWrap"}, lazy = true, "FooSoft/vim-argwrap"}, {config = _4_, dependencies = "llwwns/nvim-navic", "windwp/windline.nvim"}, {init = _5_, keys = {"<leader>dh"}, lazy = true, "AndrewRadev/deleft.vim"}, {config = _6_, dependencies = {"jose-elias-alvarez/null-ls.nvim", "nvim-lua/plenary.nvim", "llwwns/nvim-navic"}, "neovim/nvim-lspconfig"}, {config = true, "llwwns/nvim-navic"}, {config = _7_, dependencies = {"hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lua", "hrsh7th/cmp-nvim-lsp", "saadparwaiz1/cmp_luasnip", "hrsh7th/cmp-path", "hrsh7th/cmp-cmdline", "hrsh7th/cmp-nvim-lsp-signature-help"}, event = {"InsertEnter"}, lazy = true, "hrsh7th/nvim-cmp"}, "hrsh7th/cmp-nvim-lsp", {lazy = true, "nvim-lua/lsp_extensions.nvim"}, {branch = "v2.x", cmd = {"Neotree"}, config = _8_, dependencies = {"nvim-lua/plenary.nvim", "kyazdani42/nvim-web-devicons", "MunifTanjim/nui.nvim"}, ft = {"netrw"}, lazy = true, "nvim-neo-tree/neo-tree.nvim"}, {cmd = {"BOnly"}, lazy = true, "vim-scripts/BufOnly.vim"}, {ft = {"todo"}, lazy = true, "dbeniamine/todo.txt-vim"}, {init = _9_, "houtsnip/vim-emacscommandline"}, {config = _10_, "RRethy/vim-illuminate"}, {cmd = {"GV"}, lazy = true, "junegunn/gv.vim"}, {cmd = {"SudaWrite"}, lazy = true, "lambdalisue/suda.vim"}, {init = _11_, keys = {{mode = "i", "<c-j>"}, {mode = "c", "<c-j>"}, {mode = "l", "<c-j>"}}, lazy = true, "tyru/eskk.vim"}, {cmd = {"AnsiEsc"}, lazy = true, "powerman/vim-plugin-AnsiEsc"}, {config = {extra = {}, extended = false}, keys = {{mode = "v", "gc"}, {mode = "v", "gb"}}, lazy = true, "numToStr/Comment.nvim"}, {ft = {"csv"}, lazy = true, "mechatroner/rainbow_csv"}, {cmd = {"Bufferize"}, lazy = true, "AndrewRadev/bufferize.vim"}, {config = _12_, dependencies = {"rafamadriz/friendly-snippets"}, lazy = true, "L3MON4D3/LuaSnip"}, {config = _13_, dependencies = {"mrjones2014/nvim-ts-rainbow"}, "nvim-treesitter/nvim-treesitter"}, "RRethy/nvim-treesitter-endwise", "nvim-treesitter/playground", {config = _14_, "petertriho/nvim-scrollbar"}, {cmd = "UndotreeToggle", lazy = true, "mbbill/undotree"}, {config = _15_, dependencies = {"nvim-lua/plenary.nvim"}, "lewis6991/gitsigns.nvim"}, "kevinhwang91/nvim-bqf", {config = _16_, "onsails/lspkind-nvim"}, {config = _17_, priority = 1000, "folke/tokyonight.nvim"}, {lazy = true, "rebelot/kanagawa.nvim"}, "EdenEast/nightfox.nvim", {cmd = {"Neogit"}, config = _18_, lazy = true, "TimUntersberger/neogit"}, {cmd = {"MergetoolStart"}, init = _19_, lazy = true, "samoshkin/vim-mergetool"}, {config = true, lazy = true, "llwwns/hop.nvim"}, {cmd = {"ToggleTerm"}, config = _20_, lazy = true, "akinsho/toggleterm.nvim"}, "windwp/nvim-ts-autotag", "lewis6991/impatient.nvim", {cmd = {"Lsp"}, lazy = true, "ii14/lsp-command"}, {config = _23_, "stevearc/dressing.nvim"}, {cmd = {"NeoZoomToggle"}, lazy = true, "nyngwang/NeoZoom.lua"}, {config = _24_, keys = {"<leader>gy"}, lazy = true, "ruifm/gitlinker.nvim"}, {config = _25_, "j-hui/fidget.nvim"}, {config = _26_, dependencies = {{"nvim-lua/plenary.nvim"}, {"natecraddock/telescope-zf-native.nvim"}}, lazy = true, "nvim-telescope/telescope.nvim"}, {lazy = true, "natecraddock/telescope-zf-native.nvim"}, {cmd = {"DiffviewFileHistory", "DiffviewOpen"}, config = _27_, dependencies = "nvim-lua/plenary.nvim", lazy = true, "sindrets/diffview.nvim"}, "MunifTanjim/nui.nvim", {cmd = {"Luadev"}, config = _28_, lazy = true, "bfredl/nvim-luadev"}, {config = _29_, dependencies = {"udayvir-singh/hibiscus.nvim"}, ft = "fennel", lazy = true, "llwwns/tangerine.nvim"}, {config = _30_, dependencies = "anuvyklack/keymap-layer.nvim", "anuvyklack/hydra.nvim"}, {cmd = {"PickEverything", "PickIcons", "PickEmoji", "PickNerd", "PickSymbols", "PickAltFont", "PickAltFontAndSymbols", "PickEverythingInsert", "PickIconsInsert", "PickEmojiInsert", "PickNerdInsert", "PickSymbolsInsert", "PickAltFontInsert", "PickAltFontAndSymbolsInsert"}, config = _31_, lazy = true, "ziontee113/icon-picker.nvim"}, {config = _32_, "tiagovla/scope.nvim"}, {config = _33_, "rcarriga/nvim-notify"}, {config = _34_, "norcalli/nvim-colorizer.lua"}, {config = _35_, lazy = true, "monaqa/dial.nvim"}, {config = _36_, lazy = true, "mizlan/iswap.nvim"}, {lazy = true, "rcarriga/nvim-dap-ui"}, {config = _37_, lazy = true, "mfussenegger/nvim-dap"}, {config = _38_, dependencies = {"mfussenegger/nvim-dap"}, lazy = true, "leoluz/nvim-dap-go"}, "dstein64/vim-startuptime", {build = "deno task --quiet build:fast", config = _39_, ft = "markdown", lazy = true, "toppair/peek.nvim"}, {config = _40_, "nvim-zh/colorful-winsep.nvim"}, {config = _41_, event = {"InsertEnter"}, lazy = true, "hrsh7th/nvim-insx"}})