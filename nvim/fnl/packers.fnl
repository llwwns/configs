(import-macros {: g!} :hibiscus.vim)

(macro packer [...]
  `((-> :packer (require) (. :startup))
    (fn [,(sym :use)]
      (do ,...))))

(macro use! [name ...]
  (let [opts [...]]
    (if (= 0 (length opts))
      `(use ,name)
      (let [out [name]]
        (each [idx val (ipairs opts)]
          (when (= 1 (% idx 2))
              (let [nval (. opts (+ idx 1))]
                (tset out val nval))))
         `(use ,out)))))

(pcall #(do
  (vim.cmd "packadd impatient.nvim")
  (require "impatient")))

(when (not (pcall #(
  vim.cmd "packadd packer.nvim")))
    (let [install_path (.. (vim.fn.stdpath "data") "/site/pack/packer/opt/packer.nvim")]
      (do
        (when (> (vim.fn.empty (vim.fn.glob install_path)) 0)
          (vim.cmd (.. "!git clone https://github.com/wbthomason/packer.nvim " install_path)))
        (vim.cmd "packadd packer.nvim"))))

(packer
  (use! :wbthomason/packer.nvim :opt true)
  (use! :lukas-reineke/indent-blankline.nvim :setup #(do 
    (g! indent_blankline_char "│")
    (g! indent_blankline_show_current_context true)))
  (use! :tpope/vim-fugitive)
  (use! :mg979/vim-visual-multi :opt true :keys [["v" "<c-n>"]] )
  (use! :godlygeek/tabular :opt true :cmd ["Tabularize"])
  (use! :maksimr/vim-jsbeautify :opt true
    :fn [
      "JsBeautify"
      "JsonBeautify"
      "JsxBeautify"
      "HtmlBeautify"
      "CSSBeautify"
    ])
  (use! :tpope/vim-abolish)
  (use! :tpope/vim-surround)
  (use! :wellle/targets.vim)
  (use! :mattn/emmet-vim :opt true :keys [["i" "<c-y>"]])
  (use! :FooSoft/vim-argwrap :opt true :cmd ["ArgWrap"])
  ;;(use! :sheerun/vim-polyglot)
  (use! :windwp/windline.nvim
    :config #(require "bubble_custom"))
  (use! "AndrewRadev/deleft.vim" :opt true :keys [["n" "<leader>dh"]]
    :setup #(g! deleft_mapping "<leader>dh"))
  (use! "neovim/nvim-lspconfig"
    :requires [ 
      "jose-elias-alvarez/null-ls.nvim"
      "nvim-lua/plenary.nvim"
      "ray-x/lsp_signature.nvim"
    ]
    :config #(require "lsp_init"))
  (use! "hrsh7th/nvim-cmp"
    :requires [
      "hrsh7th/cmp-buffer"
      "hrsh7th/cmp-nvim-lua"
      "hrsh7th/cmp-nvim-lsp"
      "saadparwaiz1/cmp_luasnip"
      "hrsh7th/cmp-path"
    ]
    :config #(require "cmp_init"))
  (use! :nvim-lua/lsp_extensions.nvim :opt true :module ["lsp_extensions"])
  (use! "kyazdani42/nvim-tree.lua"
    :requires "kyazdani42/nvim-web-devicons"
    :opt true
    :module [ "nvim-tree" ]
    :config #(require "tree_init"))
  (use! :vim-scripts/BufOnly.vim :opt true :cmd ["BOnly"])
  (use! :dbeniamine/todo.txt-vim)
  (use! :houtsnip/vim-emacscommandline :setup #(g! EmacsCommandLineSearchCommandLineDisable 1))
  (use! :RRethy/vim-illuminate :setup #(g! Illuminate_delay 0))
  (use! :junegunn/gv.vim :opt true :cmd ["GV"])
  (use! :lambdalisue/suda.vim)
  (use! :tyru/eskk.vim :opt true
    :keys [[ "i" "<c-j>"] ["c" "<c-j>"] ["l" "<c-j>"]]
    :setup #(g! "eskk#enable_completion" 1))
  (use! :powerman/vim-plugin-AnsiEsc :opt true :cmd [ "AnsiEsc" ])
  ;; use('rhysd/reply.vim')
  (use! :tpope/vim-endwise)
  ;; use { "tomtom/tcomment_vim", opt = true, keys = { { "v", "gc" } } }
  (use! :numToStr/Comment.nvim
    :opt true
    :keys [[ "v" "gc" ] [ "v" "gb" ]]
    :config #((-> :Comment (require) (. :setup)) { :extra [] :extended  false }))
  (use! :machakann/vim-swap :opt true
    :keys [[ "n" "g<" ] [ "n" "g>" ] [ "n" "gs" ] [ "x" "gs" ]])
  (use! :mechatroner/rainbow_csv :opt true :ft [ "csv" ])
  ;; -- use "google/vim-searchindex"
  ;; -- use('junegunn/fzf', { dir = '~/fzf', ['do'] = './install --all' })
  ;; use { "junegunn/fzf.vim", opt = true, cmd = { "Files", "Buffers" } }
  (use! :AndrewRadev/bufferize.vim :opt true :cmd ["Bufferize"])
  (use! :L3MON4D3/LuaSnip :opt true
    :module "luasnip"
    :config #(require "luasnip_init"))
  (use! "luochen1990/rainbow" :setup #(g! rainbow_active 1))
  (use! :nvim-treesitter/nvim-treesitter
    :config #(require "treesitter_init")
    :requires [ "SmiteshP/nvim-gps" ])
  (use! :bluz71/vim-moonfly-colors)
  (use! :dstein64/nvim-scrollview)
  (use! :mbbill/undotree :opt true :cmd "UndotreeToggle")
  (use! :lewis6991/gitsigns.nvim
    :requires [ "nvim-lua/plenary.nvim" ]
    :config #((-> :gitsigns (require) (. :setup))
      {
        :numhl true
        :signs {
          :add { :hl "GitGutterAdd" :text "+" :numhl "GitGutterAdd" }
          :change {
            :hl "GitGutterChange"
            :text "~"
            :numhl "GitGutterChange"
          }
          :delete {
            :hl "GitGutterDelete"
            :text "_"
            :numhl "GitGutterDelete"
          }
          :topdelete {
            :hl "GitGutterDelete"
            :text "‾"
            :numhl "GitGutterDelete"
          }
          :changedelete {
            :hl "GitGutterChange"
            :text "~"
            :numhl "GitGutterChange"
          }
        }
      }))
  (use! :bluz71/vim-nightfly-guicolors)
  (use! :kevinhwang91/nvim-bqf)
  (use! :onsails/lspkind-nvim
    :config #((-> :lspkind (require) (. :init)) {
        :mode "text_symbol"
        :symbol_map {
          :Text "  "
          :Method "  "
          :Function "  "
          :Constructor "  "
          :Variable "[]"
          :Class " פּ "
          :Interface " 蘒"
          :Module "  "
          :Property "  "
          :Unit " 塞 "
          :Value "  "
          :Enum " 練"
          :Keyword "  "
          :Snippet "  "
          :Color "  "
          :File "  "
          :Folder " ﱮ "
          :EnumMember "  "
          :Constant "  "
          :Struct "  "
          :Field "  "
          :TypeParameter "<>"
          :Event " 練"
          :Operator "  "
          :Reference "  "
        }
      }))
  (use! :folke/tokyonight.nvim)
  (use! "TimUntersberger/neogit"
    :opt true
    :cmd [ "Neogit" ]
    :config #((-> :neogit (require) (. :setup)) {
        :disable_commit_confirmation true
        :integrations {
          :diffview true
        }
        :signs {
          :section [ "" "" ]
          :item [ "" "" ]
          :hunk [ "" "" ]
        }
        :sections {
          :staged {
            :folded false
          }
          :unstaged {
            :folded false
          }
          :untracked {
            :folded false
          }
          :stashes {
            :folded true
          }
          :unpulled {
            :folded true
          }
          :unmerged {
            :folded true
          }
          :recent {
            :folded true
          }
        }
      }))
  (use! :samoshkin/vim-mergetool :opt true :cmd ["MergetoolStart"] :setup #(do
    (g! mergetool_layout "LmR")
    ;; (g! mergetool_prefer_revision "base")
    (g! mergetool_prefer_revision "unmodified")))
  (use! :phaazon/hop.nvim :opt true :module "hop" :config #((-> :hop (require) (. "setup"))))
  (use! :numtostr/FTerm.nvim :opt true
    :module "FTerm"
    :config #((-> :FTerm (require) (. :setup)) {
        :dimensions {
          :height 0.95
          :width 0.8
        }
      }))

  (use! :windwp/nvim-ts-autotag)
  (use! :lewis6991/impatient.nvim)
  (use! :ii14/lsp-command :opt true :cmd ["Lsp"])
  (use! :kyazdani42/nvim-web-devicons :opt true
    :module "nvim-web-devicons")
  (use! "stevearc/dressing.nvim"
    :config #((-> :dressing (require) (. :setup)) {
        :select {
          :backend ["builtin"]
        }
      }))
  (use! :nyngwang/NeoZoom.lua :opt true :cmd ["NeoZoomToggle"])
  (use! :ruifm/gitlinker.nvim :opt true
    :config #((-> :gitlinker (require) (. :setup)))
    :keys [[ "v" "<leader>gy" ] [ "n" "<leader>gy" ]])
  (use! :j-hui/fidget.nvim :config #((-> :fidget (require) (. :setup))))
  (use! :nvim-telescope/telescope.nvim :opt true
    :requires [
      [ "nvim-lua/plenary.nvim" ]
      ;; [ "nvim-telescope/telescope-fzy-native.nvim" ]
      [ "natecraddock/telescope-zf-native.nvim" ]
    ]
    :module [ "telescope" ]
    :config #(require :telescope_init))
  ;; -- use {
  ;; --   opt = true,
  ;; --   "nvim-telescope/telescope-fzy-native.nvim",
  ;; --   module = { "telescope._extensions" },
  ;; -- }
  (use! :natecraddock/telescope-zf-native.nvim
    :opt true
    :module [ "telescope._extensions.zf-native" ])
  (use!
    :sindrets/diffview.nvim
    :requires "nvim-lua/plenary.nvim"
    :opt true
    :module "diffview"
    :cmd [
      "DiffviewFileHistory"
      "DiffviewOpen"
    ]
    :config #(require "diffview_init"))
  (use! "EdenEast/nightfox.nvim")
  (use! "puremourning/vimspector"
    :config #(tset vim.g :vimspector_enable_mappings "HUMAN"))
  (use! "MunifTanjim/nui.nvim")
  (use! "bfredl/nvim-luadev")
  (use! "llwwns/tangerine.nvim" :opt true
    :ft "fennel"
    :requires ["udayvir-singh/hibiscus.nvim" ]
    :config #((-> :tangerine (require) (. :setup)) {
        :compiler {
          :verbose false
          :hooks [ "onsave" ]
        }
      }))
  (use! "vimpostor/vim-tpipeline" :setup #(g! :tpipeline_cursormoved 1))
  (use! :anuvyklack/hydra.nvim :config #(require :hydra_init) :requires :anuvyklack/keymap-layer.nvim)
  (use! :ziontee113/icon-picker.nvim 
    :opt true :cmd [
      :PickIcons
      :PickEmoji
      :PickNerd
      :PickIconsInsert
      :PickEmojiInsert
      :PickNerdInsert
    ] :config #(require :icon-picker))
)

