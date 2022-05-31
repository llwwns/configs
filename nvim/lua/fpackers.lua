-- :fennel:1653976382
local function _1_()
  local _2_
  do
    vim.cmd("packadd impatient.nvim")
    _2_ = require("impatient")
  end
  return _2_()
end
pcall(_1_)
local function _3_()
  return vim.cmd("packadd packer.nvim")()
end
if not pcall(_3_) then
  local install_path = (vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim")
  if (vim.fn.empty(vim.fn.glob(install_path)) > 0) then
    vim.cmd(("!git clone https://github.com/wbthomason/packer.nvim " .. install_path))
  else
  end
  vim.cmd("packadd packer.nvim")
else
end
local function _6_(use)
  use({opt = true, "wbthomason/packer.nvim"})
  use("lukas-reineke/indent-blankline.nvim")
  use("tpope/vim-fugitive")
  use({keys = {{"v", "<c-n>"}}, opt = true, "mg979/vim-visual-multi"})
  use({cmd = {"Tabularize"}, opt = true, "godlygeek/tabular"})
  use({fn = {"JsBeautify", "JsonBeautify", "JsxBeautify", "HtmlBeautify", "CSSBeautify"}, opt = true, "maksimr/vim-jsbeautify"})
  use("tpope/vim-abolish")
  use("tpope/vim-surround")
  use("wellle/targets.vim")
  use({keys = {{"i", "<c-y>"}}, opt = true, "mattn/emmet-vim"})
  use({cmd = {"ArgWrap"}, opt = true, "FooSoft/vim-argwrap"})
  local function _7_()
    return require("bubble_custom")
  end
  use({config = _7_, "windwp/windline.nvim"})
  use({keys = {{"n", "<leader>dh"}}, opt = true, "AndrewRadev/deleft.vim"})
  local function _8_()
    return require("lsp_init")
  end
  use({config = _8_, requires = {"jose-elias-alvarez/null-ls.nvim", "nvim-lua/plenary.nvim", "ray-x/lsp_signature.nvim"}, "neovim/nvim-lspconfig"})
  local function _9_()
    return require("cmp_init")
  end
  use({config = _9_, requires = {"hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lua", "hrsh7th/cmp-nvim-lsp", "saadparwaiz1/cmp_luasnip", "hrsh7th/cmp-path"}, "hrsh7th/nvim-cmp"})
  use({module = {"lsp_extensions"}, opt = true, "nvim-lua/lsp_extensions.nvim"})
  local function _10_()
    return require("tree_init")
  end
  use({config = _10_, module = {"nvim-tree"}, opt = true, requires = "kyazdani42/nvim-web-devicons", "kyazdani42/nvim-tree.lua"})
  use({cmd = {"BOnly"}, opt = true, "vim-scripts/BufOnly.vim"})
  use("dbeniamine/todo.txt-vim")
  use("houtsnip/vim-emacscommandline")
  use("RRethy/vim-illuminate")
  use({cmd = {"GV"}, opt = true, "junegunn/gv.vim"})
  use("lambdalisue/suda.vim")
  use({keys = {{"i", "<c-j>"}, {"c", "<c-j>"}, {"l", "<c-j>"}}, opt = true, "tyru/eskk.vim"})
  use({cmd = {"AnsiEsc"}, opt = true, "powerman/vim-plugin-AnsiEsc"})
  use("tpope/vim-endwise")
  local function _11_()
    return (require("Comment")).setup({extra = {}, extended = false})
  end
  use({config = _11_, keys = {{"v", "gc"}, {"v", "gb"}}, opt = true, "numToStr/Comment.nvim"})
  use({keys = {{"n", "g<"}, {"n", "g>"}, {"n", "gs"}, {"x", "gs"}}, opt = true, "machakann/vim-swap"})
  use({ft = {"csv"}, opt = true, "mechatroner/rainbow_csv"})
  use({cmd = {"Bufferize"}, opt = true, "AndrewRadev/bufferize.vim"})
  local function _12_()
    return require("luasnip_init")
  end
  use({config = _12_, module = "luasnip", opt = true, "L3MON4D3/LuaSnip"})
  use("luochen1990/rainbow")
  local function _13_()
    return require("treesitter_init")
  end
  use({config = _13_, requires = {"SmiteshP/nvim-gps"}, "nvim-treesitter/nvim-treesitter"})
  use("bluz71/vim-moonfly-colors")
  use("dstein64/nvim-scrollview")
  use({cmd = "UndotreeToggle", opt = true, "mbbill/undotree"})
  local function _14_()
    return (require("gitsigns")).setup({numhl = true, signs = {add = {hl = "GitGutterAdd", text = "+", numhl = "GitGutterAdd"}, change = {hl = "GitGutterChange", text = "~", numhl = "GitGutterChange"}, delete = {hl = "GitGutterDelete", text = "_", numhl = "GitGutterDelete"}, topdelete = {hl = "GitGutterDelete", text = "\226\128\190", numhl = "GitGutterDelete"}, changedelete = {hl = "GitGutterChange", text = "~", numhl = "GitGutterChange"}}})
  end
  use({config = _14_, requires = {"nvim-lua/plenary.nvim"}, "lewis6991/gitsigns.nvim"})
  use("bluz71/vim-nightfly-guicolors")
  use("kevinhwang91/nvim-bqf")
  local function _15_()
    return (require("lspkind")).init({mode = "text_symbol", symbol_map = {Text = " \239\148\171 ", Method = " \238\158\155 ", Function = " \238\158\155 ", Constructor = " \238\136\143 ", Variable = "[\238\156\150]", Class = " \239\173\132 ", Interface = " \239\168\160", Module = " \239\153\168 ", Property = " \239\130\173 ", Unit = " \239\165\172 ", Value = " \239\162\159 ", Enum = " \239\169\151", Keyword = " \239\157\167 ", Snippet = " \239\151\143 ", Color = " \238\136\171 ", File = " \239\133\155 ", Folder = " \239\177\174 ", EnumMember = " \239\133\157 ", Constant = " \239\155\188 ", Struct = " \239\134\179 ", Field = " \238\156\150 ", TypeParameter = "<\239\158\131>", Event = " \239\169\151", Operator = " \239\154\148 ", Reference = " \239\146\129 "}})
  end
  use({config = _15_, "onsails/lspkind-nvim"})
  use("folke/tokyonight.nvim")
  local function _16_()
    return (require("neogit")).setup({disable_commit_confirmation = true, integrations = {diffview = true}, signs = {section = {"\239\145\160", "\239\145\188"}, item = {"\239\145\160", "\239\145\188"}, hunk = {"", ""}}, sections = {staged = {folded = false}, unstaged = {folded = false}, untracked = {folded = false}, stashes = {folded = true}, unpulled = {folded = true}, unmerged = {folded = true}, recent = {folded = true}}})
  end
  use({cmd = {"Neogit"}, config = _16_, opt = true, "TimUntersberger/neogit"})
  use({cmd = {"MergetoolStart"}, opt = true, "samoshkin/vim-mergetool"})
  local function _17_()
    return (require("hop")).setup()
  end
  use({config = _17_, module = "hop", opt = true, "phaazon/hop.nvim"})
  local function _18_()
    return (require("FTerm")).setup({dimensions = {height = 0.95, width = 0.8}})
  end
  use({config = _18_, module = "FTerm", opt = true, "numtostr/FTerm.nvim"})
  use("windwp/nvim-ts-autotag")
  use("lewis6991/impatient.nvim")
  use({cmd = {"Lsp"}, opt = true, "ii14/lsp-command"})
  use({module = "nvim-web-devicons", opt = true, "kyazdani42/nvim-web-devicons"})
  local function _19_()
    return (require("dressing")).setup({select = {backend = {"builtin"}}})
  end
  use({config = _19_, "stevearc/dressing.nvim"})
  use({cmd = {"NeoZoomToggle"}, opt = true, "nyngwang/NeoZoom.lua"})
  local function _20_()
    return (require("gitlinker")).setup()
  end
  use({config = _20_, keys = {{"v", "<leader>gy"}, {"n", "<leader>gy"}}, opt = true, "ruifm/gitlinker.nvim"})
  local function _21_()
    return (require("fidget")).setup()
  end
  use({config = _21_, "j-hui/fidget.nvim"})
  local function _22_()
    return require("telescope_init")
  end
  use({config = _22_, module = {"telescope"}, opt = true, requires = {{"nvim-lua/plenary.nvim"}, {"natecraddock/telescope-zf-native.nvim"}}, "nvim-telescope/telescope.nvim"})
  use({module = {"telescope._extensions.zf-native"}, opt = true, "natecraddock/telescope-zf-native.nvim"})
  local function _23_()
    return require("diffview_init")
  end
  use({cmd = {"DiffviewFileHistory", "DiffviewOpen"}, config = _23_, module = "diffview", opt = true, requires = "nvim-lua/plenary.nvim", "sindrets/diffview.nvim"})
  use("EdenEast/nightfox.nvim")
  local function _24_()
    vim.g["vimspector_enable_mappings"] = "HUMAN"
    return nil
  end
  use({config = _24_, "puremourning/vimspector"})
  use("MunifTanjim/nui.nvim")
  use("bfredl/nvim-luadev")
  local function _25_()
    return (require("tangerine")).setup({compiler = {verbose = false, hooks = {"onsave"}}})
  end
  return use({config = _25_, ft = "fennel", opt = true, requires = {"udayvir-singh/hibiscus.nvim"}, "udayvir-singh/tangerine.nvim"})
end
return (require("packer")).startup(_6_)