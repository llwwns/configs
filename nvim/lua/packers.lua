-- :fennel:generated
local function _1_()
  vim.cmd("packadd impatient.nvim")
  return require("impatient")
end
pcall(_1_)
local function _2_()
  return vim.cmd("packadd packer.nvim")
end
if not pcall(_2_) then
  local install_path = (vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim")
  if (vim.fn.empty(vim.fn.glob(install_path)) > 0) then
    vim.cmd(("!git clone https://github.com/wbthomason/packer.nvim " .. install_path))
  else
  end
  vim.cmd("packadd packer.nvim")
else
end
local function _5_(use)
  use({opt = true, "wbthomason/packer.nvim"})
  local function _6_()
    vim.g["indent_blankline_char"] = "\226\148\130"
    vim.g["indent_blankline_show_current_context"] = true
    return nil
  end
  use({setup = _6_, "lukas-reineke/indent-blankline.nvim"})
  use("tpope/vim-fugitive")
  local function _7_()
    vim.g["VM_theme"] = "codedark"
    return nil
  end
  use({keys = {{"v", "<c-n>"}, {"n", "<c-n>"}, {"n", "<c-Up>"}, {"n", "<c-Down>"}}, opt = true, setup = _7_, "mg979/vim-visual-multi"})
  use({cmd = {"Tabularize"}, opt = true, "godlygeek/tabular"})
  use({fn = {"JsBeautify", "JsonBeautify", "JsxBeautify", "HtmlBeautify", "CSSBeautify"}, opt = true, "maksimr/vim-jsbeautify"})
  use("tpope/vim-abolish")
  use("tpope/vim-surround")
  use("wellle/targets.vim")
  use({keys = {{"i", "<c-y>"}}, opt = true, "mattn/emmet-vim"})
  use({cmd = {"ArgWrap"}, opt = true, "FooSoft/vim-argwrap"})
  local function _8_()
    return require("bubble_custom")
  end
  use({config = _8_, requires = "llwwns/nvim-navic", "windwp/windline.nvim"})
  local function _9_()
    vim.g["deleft_mapping"] = "<leader>dh"
    return nil
  end
  use({keys = {{"n", "<leader>dh"}}, opt = true, setup = _9_, "AndrewRadev/deleft.vim"})
  local function _10_()
    return require("lsp_init")
  end
  use({config = _10_, requires = {"jose-elias-alvarez/null-ls.nvim", "nvim-lua/plenary.nvim", "ray-x/lsp_signature.nvim", "llwwns/nvim-navic"}, "neovim/nvim-lspconfig"})
  local function _11_()
    return (require("nvim-navic")).setup()
  end
  use({config = _11_, "llwwns/nvim-navic"})
  local function _12_()
    return require("cmp_init")
  end
  use({config = _12_, requires = {"hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lua", "hrsh7th/cmp-nvim-lsp", "saadparwaiz1/cmp_luasnip", "hrsh7th/cmp-path", "hrsh7th/cmp-cmdline"}, "hrsh7th/nvim-cmp"})
  use({module = {"lsp_extensions"}, opt = true, "nvim-lua/lsp_extensions.nvim"})
  local function _13_()
    return require("neotree_init")
  end
  use({branch = "v2.x", cmd = {"Neotree"}, config = _13_, ft = {"netrw"}, opt = true, requires = {"nvim-lua/plenary.nvim", "kyazdani42/nvim-web-devicons", "MunifTanjim/nui.nvim"}, "nvim-neo-tree/neo-tree.nvim"})
  use({cmd = {"BOnly"}, opt = true, "vim-scripts/BufOnly.vim"})
  use("dbeniamine/todo.txt-vim")
  local function _14_()
    vim.g["EmacsCommandLineSearchCommandLineDisable"] = 1
    return nil
  end
  use({setup = _14_, "houtsnip/vim-emacscommandline"})
  local function _15_()
    do end (require("illuminate")).configure({providers = {"regex"}, delay = 0})
    return vim.cmd("hi link IlluminatedWordText illuminatedWord")
  end
  use({config = _15_, "RRethy/vim-illuminate"})
  use({cmd = {"GV"}, opt = true, "junegunn/gv.vim"})
  use("lambdalisue/suda.vim")
  local function _16_()
    vim.g["eskk#enable_completion"] = 1
    return nil
  end
  use({keys = {{"i", "<c-j>"}, {"c", "<c-j>"}, {"l", "<c-j>"}}, opt = true, setup = _16_, "tyru/eskk.vim"})
  use({cmd = {"AnsiEsc"}, opt = true, "powerman/vim-plugin-AnsiEsc"})
  use("tpope/vim-endwise")
  local function _17_()
    return (require("Comment")).setup({extra = {}, extended = false})
  end
  use({config = _17_, keys = {{"v", "gc"}, {"v", "gb"}}, opt = true, "numToStr/Comment.nvim"})
  use({ft = {"csv"}, opt = true, "mechatroner/rainbow_csv"})
  use({cmd = {"Bufferize"}, opt = true, "AndrewRadev/bufferize.vim"})
  local function _18_()
    return require("luasnip_init")
  end
  use({config = _18_, module = "luasnip", opt = true, "L3MON4D3/LuaSnip"})
  local function _19_()
    return require("treesitter_init")
  end
  use({config = _19_, requires = {"p00f/nvim-ts-rainbow"}, "nvim-treesitter/nvim-treesitter"})
  use("dstein64/nvim-scrollview")
  use({cmd = "UndotreeToggle", opt = true, "mbbill/undotree"})
  local function _20_()
    return (require("gitsigns")).setup({numhl = true, signs = {add = {hl = "GitGutterAdd", text = "+", numhl = "GitGutterAdd"}, change = {hl = "GitGutterChange", text = "~", numhl = "GitGutterChange"}, delete = {hl = "GitGutterDelete", text = "_", numhl = "GitGutterDelete"}, topdelete = {hl = "GitGutterDelete", text = "\226\128\190", numhl = "GitGutterDelete"}, changedelete = {hl = "GitGutterChange", text = "~", numhl = "GitGutterChange"}}})
  end
  use({config = _20_, requires = {"nvim-lua/plenary.nvim"}, "lewis6991/gitsigns.nvim"})
  use("kevinhwang91/nvim-bqf")
  local function _21_()
    return (require("lspkind")).init({mode = "text_symbol", symbol_map = {Text = " \239\148\171 ", Method = " \238\158\155 ", Function = " \238\158\155 ", Constructor = " \238\136\143 ", Variable = "[\238\156\150]", Class = " \239\173\132 ", Interface = " \239\168\160", Module = " \239\153\168 ", Property = " \239\130\173 ", Unit = " \239\165\172 ", Value = " \239\162\159 ", Enum = " \239\169\151", Keyword = " \239\157\167 ", Snippet = " \239\151\143 ", Color = " \238\136\171 ", File = " \239\133\155 ", Folder = " \239\177\174 ", EnumMember = " \239\133\157 ", Constant = " \239\155\188 ", Struct = " \239\134\179 ", Field = " \238\156\150 ", TypeParameter = "<\239\158\131>", Event = " \239\169\151", Operator = " \239\154\148 ", Reference = " \239\146\129 "}})
  end
  use({config = _21_, "onsails/lspkind-nvim"})
  use("folke/tokyonight.nvim")
  local function _22_()
    return (require("neogit")).setup({disable_commit_confirmation = true, integrations = {diffview = true}, signs = {section = {"\239\145\160", "\239\145\188"}, item = {"\239\145\160", "\239\145\188"}, hunk = {"", ""}}, sections = {staged = {folded = false}, unstaged = {folded = false}, untracked = {folded = false}, stashes = {folded = true}, unpulled = {folded = true}, unmerged = {folded = true}, recent = {folded = true}}})
  end
  use({cmd = {"Neogit"}, config = _22_, opt = true, "TimUntersberger/neogit"})
  local function _23_()
    vim.g["mergetool_layout"] = "LmR"
    vim.g["mergetool_prefer_revision"] = "unmodified"
    return nil
  end
  use({cmd = {"MergetoolStart"}, opt = true, setup = _23_, "samoshkin/vim-mergetool"})
  local function _24_()
    return (require("hop")).setup()
  end
  use({config = _24_, module = "hop", opt = true, "phaazon/hop.nvim"})
  local function _25_()
    return (require("FTerm")).setup({dimensions = {height = 0.95, width = 0.8}})
  end
  use({config = _25_, module = "FTerm", opt = true, "numtostr/FTerm.nvim"})
  use("windwp/nvim-ts-autotag")
  use("lewis6991/impatient.nvim")
  use({cmd = {"Lsp"}, opt = true, "ii14/lsp-command"})
  use({module = "nvim-web-devicons", opt = true, "kyazdani42/nvim-web-devicons"})
  local function _26_()
    return (require("dressing")).setup({select = {backend = {"telescope", "builtin"}}})
  end
  use({config = _26_, "stevearc/dressing.nvim"})
  use({cmd = {"NeoZoomToggle"}, opt = true, "nyngwang/NeoZoom.lua"})
  local function _27_()
    return (require("gitlinker")).setup()
  end
  use({config = _27_, keys = {{"v", "<leader>gy"}, {"n", "<leader>gy"}}, opt = true, "ruifm/gitlinker.nvim"})
  local function _28_()
    return (require("fidget")).setup()
  end
  use({config = _28_, "j-hui/fidget.nvim"})
  local function _29_()
    return require("telescope_init")
  end
  use({config = _29_, module = {"telescope"}, opt = true, requires = {{"nvim-lua/plenary.nvim"}, {"natecraddock/telescope-zf-native.nvim"}}, "nvim-telescope/telescope.nvim"})
  use({module = {"telescope._extensions.zf-native"}, opt = true, "natecraddock/telescope-zf-native.nvim"})
  local function _30_()
    return require("diffview_init")
  end
  use({cmd = {"DiffviewFileHistory", "DiffviewOpen"}, config = _30_, module = "diffview", opt = true, requires = "nvim-lua/plenary.nvim", "sindrets/diffview.nvim"})
  local function _31_()
    vim.g["vimspector_enable_mappings"] = "HUMAN"
    return nil
  end
  use({config = _31_, "puremourning/vimspector"})
  use("MunifTanjim/nui.nvim")
  use("bfredl/nvim-luadev")
  local function _32_()
    return (require("tangerine")).setup({compiler = {verbose = false, hooks = {"onsave"}}})
  end
  use({config = _32_, ft = "fennel", opt = true, requires = {"udayvir-singh/hibiscus.nvim"}, "llwwns/tangerine.nvim"})
  local function _33_()
    vim.g["tpipeline_cursormoved"] = 1
    return nil
  end
  use({setup = _33_, "vimpostor/vim-tpipeline"})
  local function _34_()
    return require("hydra_init")
  end
  use({config = _34_, requires = "anuvyklack/keymap-layer.nvim", "anuvyklack/hydra.nvim"})
  local function _35_()
    return require("icon-picker")
  end
  use({cmd = {"PickEverything", "PickIcons", "PickEmoji", "PickNerd", "PickSymbols", "PickAltFont", "PickAltFontAndSymbols", "PickEverythingInsert", "PickIconsInsert", "PickEmojiInsert", "PickNerdInsert", "PickSymbolsInsert", "PickAltFontInsert", "PickAltFontAndSymbolsInsert"}, config = _35_, opt = true, "ziontee113/icon-picker.nvim"})
  local function _36_()
    return (require("scope")).setup()
  end
  use({config = _36_, "tiagovla/scope.nvim"})
  local function _37_()
    local notify = require("notify")
    notify.setup()
    do end (vim)["notify"] = notify
    return nil
  end
  use({config = _37_, "rcarriga/nvim-notify"})
  local function _38_()
    return (require("colorizer")).setup()
  end
  use({config = _38_, "norcalli/nvim-colorizer.lua"})
  local function _39_()
    return require("dial_init")
  end
  use({config = _39_, keys = {{"n", "<Plug>(dial-increment)"}, {"n", "<Plug>(dial-decrement)"}, {"v", "<Plug>(dial-increment)"}, {"v", "<Plug>(dial-decrement)"}, {"v", "g<Plug>(dial-increment)"}, {"v", "g<Plug>(dial-decrement)"}}, opt = true, "monaqa/dial.nvim"})
  local function _40_()
    return (require("iswap")).setup({flash_style = false, move_cursor = true})
  end
  use({config = _40_, module = {"iswap"}, opt = true, "mizlan/iswap.nvim"})
  use({module = {"dapui"}, opt = true, "rcarriga/nvim-dap-ui"})
  local function _41_()
    return require("dap_init", "opt", true, "module", {"dap"})
  end
  use({config = _41_, "mfussenegger/nvim-dap"})
  local function _42_()
    do end (require("dap-go")).setup()
    local function _43_()
      return (require("dap-go")).debug_test()
    end
    return vim.keymap.set({"n"}, "<leader>td", _43_, {silent = true})
  end
  return use({config = _42_, ft = {"go"}, requires = {"mfussenegger/nvim-dap"}, "leoluz/nvim-dap-go"})
end
return (require("packer")).startup(_5_)