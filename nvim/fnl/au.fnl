(require-macros :hibiscus.vim)

(augroup! :numbertoggle
    [[BufEnter FocusGained InsertLeave] *
      #(tset vim.opt :relativenumber  true)]
    [[BufLeave FocusLost InsertEnter] *
      #(tset vim.opt :relativenumber false)]
)
(augroup! :highlight_yank
  [[TextYankPost] *
    #(vim.highlight.on_yank { :higroup "Visual" :timeout 200 })])
(augroup! :buf_large
  [[BufReadPre] *
    "if getfsize(expand('%')) > 10000000 | syntax off | endif"])
(augroup! :fugitive_buf
  [[BufReadPost] fugitive://* "set bufhidden=delete"])
(augroup! :term
  [[TermOpen] * "IndentBlanklineDisable"])
(augroup! :filetypes
  [[FileType] make (fn []
    (tset vim.opt_local :tabstop 8)
    (tset vim.opt_local :expandtab false))]
  [[FileType] nginx (fn []
    (tset vim.opt_local :tabstop 4)
    (tset vim.opt_local :expandtab false))]
  [[FileType] lua (fn []
    (tset vim.opt_local :foldmethod "expr")
    (tset vim.opt_local :foldexpr "nvim_treesitter#foldexpr()")
    (tset vim.b :format_on_save true))]
  [[FileType] ruby (fn []
    (tset vim.opt_local :foldmethod "expr")
    (tset vim.opt_local :foldexpr "nvim_treesitter#foldexpr()")
    (tset vim.b :format_on_save true))]
  [[FileType] go (fn []
    (tset vim.opt_local :expandtab false)
    (tset vim.opt_local :foldmethod "expr")
    (tset vim.opt_local :foldexpr "nvim_treesitter#foldexpr()")
    (map! [n :buffer :verbose] "<leader>cr" "<cmd>!go run %<CR>")
    (tset vim.b :format_on_save true))]
  [[FileType] [cpp c] (fn []
    (tset vim.opt_local :foldmethod "expr")
    (tset vim.opt_local :foldexpr "nvim_treesitter#foldexpr()")
    (tset vim.opt_local :tabstop 4)
    (map! [n :buffer :verbose] "<leader>cm" "<cmd>!clang++ -std=c++17 -g3 % <CR>")
    (map! [n :buffer :verbose] "<leader>cr" "<cmd>!clang++ -std=c++17 -g3 % && ./a.out <CR>"))]
  [[FileType] rust (fn []
    (tset vim.opt_local :foldmethod "expr")
    (tset vim.opt_local :foldexpr "nvim_treesitter#foldexpr()")
    (tset vim.opt_local :tabstop 4)
    (tset vim.b :format_on_save true))]
  [[FileType] rust (fn []
    (tset vim.opt_local :foldmethod "expr")
    (tset vim.opt_local :foldexpr "nvim_treesitter#foldexpr()")
    (tset vim.b :format_on_save true))]
  [[FileType] json (fn []
    (tset vim.opt_local :foldmethod "expr")
    (tset vim.opt_local :foldexpr "nvim_treesitter#foldexpr()")
    (map! [n :buffer :verbose] "[j" vim.fn.JsonBeautify {}))]
  [[FileType] [toml yaml] (fn []
    (tset vim.opt_local :foldmethod "expr")
    (tset vim.opt_local :foldexpr "nvim_treesitter#foldexpr()"))]
  [[FileType] [javascript javascript.jsx typescript typescriptreact] (fn []
    (tset vim.opt_local :foldmethod "expr")
    (tset vim.opt_local :foldexpr "nvim_treesitter#foldexpr()")
    (tset vim.b :format_on_save true))]
  [[FileType] autohotkey (fn []
    (tset vim.opt_local :tabstop 4))]
  [[BufNewFile BufRead] [*.tsv *.csv] "set filetype=csv"]
  [[FileType] csv (fn []
    (map! [n :buffer :verbose] "[c" "<cmd>RainbowAlign<CR>")
    (map! [n :buffer :verbose] "]c" "<cmd>RainbowShrink<CR>"))]
  [[BufNewFile BufRead] [*.cue] "set filetype=cue"]
  [[FileType] proto (fn []
    (tset vim.opt_local :foldmethod "expr")
    (tset vim.opt_local :foldexpr "nvim_treesitter#foldexpr()"))]
  [[FileType] [sh fish] (fn []
    (tset vim.opt_local :foldmethod "expr")
    (tset vim.opt_local :foldexpr "nvim_treesitter#foldexpr()"))]
)
;; -- augroups {
;; --   filetypes = {
;; -- "FileType json nmap [j :call JsonBeautify() <CR>",
;; -- "FileType json set foldmethod=expr",
;; -- "FileType json set foldexpr=nvim_treesitter#foldexpr()",
;; -- "FileType confluencewiki setlocal fdm=expr",
;; -- "FileType confluencewiki setlocal fdl=0",
;; -- "FileType confluencewiki setlocal fdc=1",
;; -- "BufNewFile,BufRead *.cwk set filetype=confluencewiki",
;; -- "BufNewFile,BufRead *.coffee set filetype=coffee",
;; -- },
;; -- asyncrun = {
;; --   "QuickFixCmdPost asyncrun botright copen 8",
;; -- },
;; -- completion = {
;; -- "BufEnter * lua local s, com = pcall(require, 'completion'); if s then com.on_attach() end",
;; -- "User eskk-enable-pre call v:lua.vim.api.nvim_set_var('completion_enable_auto_popup', 0)",
;; -- "User eskk-disable-pre call v:lua.vim.api.nvim_set_var('completion_enable_auto_popup', 1)",
;; -- },
;; -- }
