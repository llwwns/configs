(require-macros :utils-macros)
(import-macros {: g! : map!} :hibiscus.vim)
(g! mapleader "'")
(g! maplocalleader "'")

(macro use! [name ...]
  (let [opts [...]]
    (if (= 0 (length opts))
      name
      (let [out [name]]
        (each [idx val (ipairs opts)]
          (when (= 1 (% idx 2))
              (let [nval (. opts (+ idx 1))]
                (tset out val nval))))
         out))))

(let [install_path (.. (vim.fn.stdpath "data") "/lazy/lazy.nvim")]
  (when (not (vim.loop.fs_stat install_path))
    (vim.cmd (.. "!git clone https://github.com/folke/lazy.nvim --filter=blob:none --single-branch " install_path)))
  (vim.opt.runtimepath:prepend install_path))

(require-fun :lazy#setup [
  (use! :lukas-reineke/indent-blankline.nvim :lazy false :init #(do 
    (g! indent_blankline_char "│")
    (g! indent_blankline_show_current_context true)))
  (use! :tpope/vim-fugitive)
  (use! :tpope/vim-fugitive)
  (use! :mg979/vim-visual-multi :lazy true :keys [
    {1 "<c-n>" :mode :v}
    "<c-n>"
    "<c-Up>"
    "<c-Down>"
  ] :init #(g! VM_theme "codedark"))
  (use! :godlygeek/tabular :lazy true :cmd ["Tabularize"])
  (use! :maksimr/vim-jsbeautify :lazy true
    :fn [
      :JsBeautify
      :JsonBeautify
      :JsxBeautify
      :HtmlBeautify
      :CSSBeautify
    ])
  (use! :tpope/vim-abolish :lazy true :cmd [:Abolish :Subvert] :keys [
    "crs"
    "crm"
    "crc"
    "cru"
    "cr-"
    "cr."
    "cr "
    "crt"
  ])
  (use! :wellle/targets.vim)
  (use! :mattn/emmet-vim :lazy true :keys {1 "<c-y>" :mode :i})
  (use! :FooSoft/vim-argwrap :lazy true :cmd ["ArgWrap"])
  ;;(use! :sheerun/vim-polyglot)
  (use! :windwp/windline.nvim
    :config #(require "bubble_custom")
    :dependencies "llwwns/nvim-navic")
  (use! "AndrewRadev/deleft.vim" :lazy true :keys ["<leader>dh"]
    :init #(g! deleft_mapping "<leader>dh"))
  (use! "neovim/nvim-lspconfig"
    :dependencies [ 
      "jose-elias-alvarez/null-ls.nvim"
      "nvim-lua/plenary.nvim"
      ;; "ray-x/lsp_signature.nvim"
      "llwwns/nvim-navic"
    ]
    :config #(require "lsp_init"))
  (use! "llwwns/nvim-navic"
    :config #(require-fun "nvim-navic#setup"))
  (use! "hrsh7th/nvim-cmp"
    :lazy true
    :event [:InsertEnter]
    :dependencies [
      "hrsh7th/cmp-buffer"
      "hrsh7th/cmp-nvim-lua"
      "hrsh7th/cmp-nvim-lsp"
      "saadparwaiz1/cmp_luasnip"
      "hrsh7th/cmp-path"
      "hrsh7th/cmp-cmdline"
      "hrsh7th/cmp-nvim-lsp-signature-help"
    ]
    :config #(require "cmp_init"))
  (use! "hrsh7th/cmp-nvim-lsp")
  (use! :nvim-lua/lsp_extensions.nvim :lazy true)
  (use!
    :nvim-neo-tree/neo-tree.nvim
    :lazy true
    :ft ["netrw"]
    :cmd [:Neotree]
    :config #(require :neotree_init)
      :branch "v2.x"
      :dependencies [
        "nvim-lua/plenary.nvim"
        "kyazdani42/nvim-web-devicons"
        "MunifTanjim/nui.nvim"
      ])
  (use! :vim-scripts/BufOnly.vim :lazy true :cmd ["BOnly"])
  (use! :dbeniamine/todo.txt-vim :lazy true :ft ["todo"])
  (use! :houtsnip/vim-emacscommandline :init #(g! EmacsCommandLineSearchCommandLineDisable 1))
  (use! :RRethy/vim-illuminate :config (fn [] 
    (require-fun :illuminate#configure {
      :providers [:regex]
      :delay 0
    })
    (vim.cmd "hi link IlluminatedWordText illuminatedWord")))
  (use! :junegunn/gv.vim :lazy true :cmd ["GV"])
  (use! :lambdalisue/suda.vim :lazy true :cmd ["SudaWrite"])
  (use! :tyru/eskk.vim :lazy true
    :keys [{1 "<c-j>" :mode :i} {1 "<c-j>" :mode :c} {1 "<c-j>" :mode :l}]
    :init #(g! "eskk#enable_completion" 1))
  (use! :powerman/vim-plugin-AnsiEsc :lazy true :cmd [ "AnsiEsc" ])
  ;; use('rhysd/reply.vim')
  (use! :tpope/vim-endwise)
  ;; use { "tomtom/tcomment_vim", opt = true, keys = { { "v", "gc" } } }
  (use! :numToStr/Comment.nvim :lazy true :keys [{1 "gc" :mode :v} {1 "gb" :mode :v}]
    :config #(require-fun :Comment#setup { :extra [] :extended false }))
  ;; (use! :machakann/vim-swap :lazy true
  ;;   :keys [[ "n" "g<" ] [ "n" "g>" ] [ "n" "gs" ] [ "x" "gs" ]])
  (use! :mechatroner/rainbow_csv :lazy true :ft [ "csv" ])
  ;; -- use "google/vim-searchindex"
  ;; -- use('junegunn/fzf', { dir = '~/fzf', ['do'] = './install --all' })
  ;; use { "junegunn/fzf.vim", opt = true, cmd = { "Files", "Buffers" } }
  (use! :AndrewRadev/bufferize.vim :lazy true :cmd ["Bufferize"])
  (use! :L3MON4D3/LuaSnip :lazy true
    :config #(require "luasnip_init"))
  ;; (use! "luochen1990/rainbow" :init #(g! rainbow_active 1))
  (use! :llwwns/nvim-treesitter
    :dependencies [ :p00f/nvim-ts-rainbow ]
    :config #(require "treesitter_init"))
  (use! :nvim-treesitter/playground)
  ;; (use! :bluz71/vim-moonfly-colors)
  ;; (use! :dstein64/nvim-scrollview)
  (use! :petertriho/nvim-scrollbar :config #(require-fun :scrollbar#setup))
  (use! :mbbill/undotree :lazy true :cmd "UndotreeToggle")
  (use! :lewis6991/gitsigns.nvim
    :dependencies [ "nvim-lua/plenary.nvim" ]
    :config (fn []
      (require-fun :gitsigns#setup
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
        })
      (require-fun :scrollbar.handlers.gitsigns#setup)))
  ;; (use! :bluz71/vim-nightfly-guicolors)
  (use! :kevinhwang91/nvim-bqf)
  (use! :onsails/lspkind-nvim
    :config #(require-fun :lspkind#init {
        :mode "text_symbol"
        :symbol_map {
          :Text "  "
          :Method "  "
          :Function "  "
          :Constructor "  "
          :Variable "  "
          :Class "  "
          :Interface "  "
          :Module "  "
          :Property "  "
          :Unit "  "
          :Value "  "
          :Enum "  "
          :Keyword "  "
          :Snippet "  "
          :Color "  "
          :File "  "
          :Folder "  "
          :EnumMember "  "
          :Constant "  "
          :Struct "  "
          :Field "  "
          :TypeParameter "  "
          :Event "  "
          :Operator "  "
          :Reference "  "
        }
      }))
  (use! :folke/tokyonight.nvim :config #(require-fun :tokyonight#setup {
      :sidebars [:qf :neo-tree :FTerm :packer]
  }))
  (use! :EdenEast/nightfox.nvim)
  (use! "TimUntersberger/neogit"
    :lazy true
    :cmd [ "Neogit" ]
    :config #(require-fun :neogit#setup {
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
  (use! :samoshkin/vim-mergetool :lazy true :cmd ["MergetoolStart"] :init #(do
    (g! mergetool_layout "LmR")
    ;; (g! mergetool_prefer_revision "base")
    (g! mergetool_prefer_revision "unmodified")))
  (use! :llwwns/hop.nvim :lazy true :config #(require-fun :hop#setup))
  (use! :akinsho/toggleterm.nvim
    :lazy true :cmd [:ToggleTerm]
    :config #(require-fun :toggleterm#setup {
      :hide_numbers true
      :size #(* (vim.fn.winheight "%") 1.2)
      ;; :size 60
      :winbar { :enabled false }
      :on_open (fn []
                   (tset vim.opt_local :spell false)
                   (tset vim.opt_local :number false)
                   (tset vim.opt_local :relativenumber false)
                   (tset vim.opt_local :winbar ""))
    }))

  (use! :windwp/nvim-ts-autotag)
  (use! :lewis6991/impatient.nvim)
  (use! :ii14/lsp-command :lazy true :cmd ["Lsp"])
  (use! "stevearc/dressing.nvim"
    :config #(require-fun :dressing#setup {
        :select {
          :backend ["telescope" "builtin"]
        }
      }))
  (use! :nyngwang/NeoZoom.lua :lazy true :cmd ["NeoZoomToggle"])
  (use! :ruifm/gitlinker.nvim :lazy true
    :config #(require-fun :gitlinker#setup)
    :keys ["<leader>gy"] {1 "<leader>gy" :mode :v})
  (use! :j-hui/fidget.nvim :config #(require-fun :fidget#setup))
  (use! :nvim-telescope/telescope.nvim :lazy true
    :dependencies [
      [ "nvim-lua/plenary.nvim" ]
      [ "natecraddock/telescope-zf-native.nvim" ]
    ]
    :config #(require :telescope_init))
  (use! :natecraddock/telescope-zf-native.nvim :lazy true)
  (use!
    :sindrets/diffview.nvim
    :dependencies "nvim-lua/plenary.nvim"
    :lazy true
    :cmd [
      "DiffviewFileHistory"
      "DiffviewOpen"
    ]
    :config #(require "diffview_init"))
  ;; (use! "EdenEast/nightfox.nvim")
  (use! "MunifTanjim/nui.nvim")
  (use! "bfredl/nvim-luadev" :lazy true
        :cmd [:Luadev] :config (fn [] 
          (map! [n :noremap] "<leader>ll"  "<Plug>(Luadev-RunLine)")
          (map! [nv :noremap] "<leader>lr"  "<Plug>(Luadev-Run)")
          (map! [n :noremap] "<leader>lw"  "<Plug>(Luadev-RunWord)")
          (map! [i :noremap] "<c-k><c-l>"  "<Plug>(Luadev-Complete)")))
  (use! "llwwns/tangerine.nvim" :lazy true
    :ft "fennel"
    :dependencies ["udayvir-singh/hibiscus.nvim" ]
    :config #(require-fun :tangerine#setup {
        :compiler {
          :verbose false
          :hooks [ "onsave" ]
        }
      }))
  ;; (use! "vimpostor/vim-tpipeline" :init #(g! :tpipeline_cursormoved 1))
  (use! :anuvyklack/hydra.nvim :config #(require :hydra_init) :dependencies :anuvyklack/keymap-layer.nvim)
  (use! :ziontee113/icon-picker.nvim 
    :lazy true :cmd [
      :PickEverything
      :PickIcons
      :PickEmoji
      :PickNerd
      :PickSymbols
      :PickAltFont
      :PickAltFontAndSymbols
      :PickEverythingInsert
      :PickIconsInsert
      :PickEmojiInsert
      :PickNerdInsert
      :PickSymbolsInsert
      :PickAltFontInsert
      :PickAltFontAndSymbolsInsert
    ] :config #(require :icon-picker))
  (use! :tiagovla/scope.nvim :config #(require-fun :scope#setup))
  (use! :rcarriga/nvim-notify :config #(let
                                         [notify (require :notify)]
                                         (notify.setup)
                                         (tset vim :notify notify)))
  (use! :norcalli/nvim-colorizer.lua :config #(require-fun :colorizer#setup))
  (use! :monaqa/dial.nvim :lazy true :config #(require :dial_init))
  (use! :mizlan/iswap.nvim :lazy true :config 
    #(require-fun :iswap#setup {:flash_style false :move_cursor true}))
  (use! :rcarriga/nvim-dap-ui :lazy true)
  (use! :mfussenegger/nvim-dap :config #(require :dap_init) :lazy true)
  (use! :leoluz/nvim-dap-go :lazy true :dependencies [:mfussenegger/nvim-dap] :config
    #(require-fun :dap-go#setup))
  (use! :dstein64/vim-startuptime)
  (use!
    :toppair/peek.nvim
    :build "deno task --quiet build:fast"
    :lazy true :ft "markdown"
    :config #(require-fun :peek#setup {
        :auto_load true
        :close_on_bdelete true
        :syntax true
        :theme "dark"
        :update_on_change true
      }))
  (use! :nvim-zh/colorful-winsep.nvim
    :config #(require-fun :colorful-winsep#setup {
      :symbols ["─" "│" "┌" "┐" "└" "┘"]
    }))
])
