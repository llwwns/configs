(require-macros :hibiscus.vim)
(require-macros :utils-macros)

;; (augroup! :numbertoggle
;;     [[BufEnter FocusGained InsertLeave] *
;;       #(tset vim.opt :relativenumber true)]
;;     [[BufLeave FocusLost InsertEnter] *
;;       #(tset vim.opt :relativenumber false)])

(augroup! :highlight_yank
  [[TextYankPost] *
    #(vim.highlight.on_yank { :higroup "Visual" :timeout 200 })])
(augroup! :buf_large
  [[BufReadPre] *
    #(let [(ok stats) (pcall vim.loop.fs_stat (vim.api.nvim_buf_get_name (vim.api.nvim_get_current_buf)))]
       (if (and ok stats (> stats.size 1000000)) (do
                                               (tset vim.b :large_buf true)
                                               (vim.cmd "syntax off")
                                               (vim.cmd "IlluminatePauseBuf")
                                               (vim.cmd "IndentBlanklineDisable")
                                               (vim.cmd "NoMatchParen")
                                               (tset vim.opt_local :foldmethod "manual")
                                               (tset vim.opt_local :spell false))
           (tset vim.b :large_buf false)))])
(augroup! :fugitive_buf
  [[BufReadPost] fugitive://* "set bufhidden=delete"])
(augroup! :term
  [[TermOpen] * "IndentBlanklineDisable"])
(augroup! :autoclose
  ;; [[WinEnter] * #(if (and (= (vim.fn.winnr "$") 1) (= vim.o.buftype "quickfix")) (vim.cmd "q"))])
  [[WinEnter] * #(do
                   (tset _G :__latest_id (if _G.__latest_id (+ _G.__latest_id 1) 1))
                   (when (and (_G.is_special (vim.api.nvim_get_current_win)) (_G.all_special))
                      (let [id _G.__latest_id]
                        (vim.defer_fn
                          #(when (= id _G.__latest_id) (vim.cmd "q")) 0))))])

(augroup! :visualmode
  [[ModeChanged] *
    #(match vim.v.event
       {:new_mode "i" :old_mode ""} (tset vim.opt_local :indentkeys "")
       {:old_mode "i"} (tset vim.opt_local :indentkeys "0{,0},0),0],:,0#,!^F,o,O,e"))])

(augroup! :filetypes
  ;; [[FileType] * (fn []
  ;;   (tset vim.opt_local :spelloptions :camel))]
  [[FileType] make (fn []
    (tset vim.opt_local :tabstop 8)
    (tset vim.opt_local :expandtab false))]
  [[FileType] help (fn []
    (tset vim.opt_local :conceallevel 0))]
  [[FileType] nginx (fn []
    (tset vim.opt_local :tabstop 4)
    (tset vim.opt_local :expandtab false))]
  [[FileType] lua (fn []
    (when vim.b.large_buf (lua "return"))
    (tset vim.opt_local :foldmethod "expr")
    (tset vim.opt_local :foldexpr "nvim_treesitter#foldexpr()")
    (tset vim.b :format_on_save true))]
  [[FileType] ruby (fn []
    (when vim.b.large_buf (lua "return"))
    (tset vim.opt_local :foldmethod "expr")
    (tset vim.opt_local :foldexpr "nvim_treesitter#foldexpr()")
    (tset vim.b :format_on_save true))]
  [[FileType] go (fn []
    (tset vim.opt_local :expandtab false)
    (when vim.b.large_buf (lua "return"))
    (tset vim.opt_local :foldmethod "expr")
    (tset vim.opt_local :foldexpr "nvim_treesitter#foldexpr()")
    (map! [n :buffer :verbose] "<leader>cr" "<cmd>!go run %<CR>")
    (map! [n] "<leader>td" #(require-fun :dap-go#debug_test))
    (tset vim.b :format_on_save true))]
  [[FileType] [cpp c] (fn []
    (when vim.b.large_buf (lua "return"))
    (tset vim.opt_local :foldmethod "expr")
    (tset vim.opt_local :foldexpr "nvim_treesitter#foldexpr()")
    (tset vim.opt_local :tabstop 4)
    (map! [n :buffer :verbose] "<leader>cm" "<cmd>!clang++ -std=c++17 -g3 % <CR>")
    (map! [n :buffer :verbose] "<leader>cr" "<cmd>!clang++ -std=c++17 -g3 % && ./a.out <CR>"))]
  [[FileType] rust (fn []
    (when vim.b.large_buf (lua "return"))
    (tset vim.opt_local :foldmethod "expr")
    (tset vim.opt_local :foldexpr "nvim_treesitter#foldexpr()")
    (tset vim.opt_local :tabstop 4)
    (tset vim.b :format_on_save true))]
  [[FileType] json (fn []
    (when vim.b.large_buf (lua "return"))
    (tset vim.opt_local :foldmethod "expr")
    (tset vim.opt_local :foldexpr "nvim_treesitter#foldexpr()")
    (map! [n :buffer :verbose] "[j" #(vim.cmd "%!prettier --parser json"))
    (map! [n :buffer :verbose] "]j" #(vim.cmd "%!jq -c")))]
  [[FileType] [toml yaml] (fn []
    (when vim.b.large_buf (lua "return"))
    (tset vim.opt_local :foldmethod "expr")
    (tset vim.opt_local :foldexpr "nvim_treesitter#foldexpr()"))]
  [[FileType] [javascript javascript.jsx typescript typescriptreact] (fn []
    (when vim.b.large_buf (lua "return"))
    (tset vim.opt_local :foldmethod "expr")
    (tset vim.opt_local :foldexpr "nvim_treesitter#foldexpr()")
    (tset vim.b :format_on_save true))]
  [[FileType] autohotkey (fn []
    (tset vim.opt_local :tabstop 4))]
  [[BufNewFile BufRead] [*.tsv *.csv] "set filetype=csv"]
  [[FileType] csv (fn []
    (when vim.b.large_buf (lua "return"))
    (map! [n :buffer :verbose] "[c" "<cmd>RainbowAlign<CR>")
    (map! [n :buffer :verbose] "]c" "<cmd>RainbowShrink<CR>"))]
  [[BufNewFile BufRead] [*.cue] "set filetype=cue"]
  [[BufNewFile BufRead] [todo.txt] "set filetype=todo"]
  [[FileType] proto (fn []
    (when vim.b.large_buf (lua "return"))
    (tset vim.opt_local :foldmethod "expr")
    (tset vim.opt_local :foldexpr "nvim_treesitter#foldexpr()"))]
  [[FileType] [sh fish] (fn []
    (when vim.b.large_buf (lua "return"))
    (tset vim.opt_local :foldmethod "expr")
    (tset vim.opt_local :foldexpr "nvim_treesitter#foldexpr()"))]
  [[FileType] [markdown] (fn []
      (map! [n] "<leader>po" #(require-fun :peek#open))
      (map! [n] "<leader>pc" #(require-fun :peek#close)))]

  [[FileType] [
    qf
    help
    man
    notify
    lspinfo
    spectre_panel
    startuptime
    tsplayground
    PlenaryTestPopup
  ] (fn [event] 
    (tset (. vim.bo event.buf) :buflisted false)
    (vim.keymap.set "n" "q" "<cmd>close<cr>" { :buffer event.buf :silent true }))]
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
