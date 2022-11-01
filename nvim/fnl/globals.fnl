(fn bufwidth []
  (let [width (vim.fn.winwidth 0)
    wo vim.wo
    numwidth (if (or wo.number wo.relativenumber)
      wo.numberwidth 0)
    foldwidth wo.foldcolumn
    signwidth (match wo.signcolumn
      "yes" 2
      "auto" (let [signs (vim.fn.execute 
        (string.format "sign place buffer=%d" (vim.fn.bufnr "")))]
        (if (> (length (vim.fn.split signs "\n")) 2) 2 0))
      _ 0)]
  (- width (+ numwidth foldwidth signwidth))))

(fn _G.foldtext []
  (let [
    fs (vim.api.nvim_get_vvar "foldstart")
    fe (vim.api.nvim_get_vvar "foldend")
    line (vim.fn.substitute (vim.fn.getline fs) "\t" (string.rep " " vim.bo.tabstop) "g")
    winSize (bufwidth)
    lineCount (string.format "[%d lines]-----" (+ (- fe fs) 1))]
    (.. line
        (string.rep "-" (- winSize (vim.fn.strdisplaywidth line) (vim.fn.strdisplaywidth lineCount)))
        lineCount)))

(fn _G.foldtext2 []
  (if vim.o.diff
    (_G.foldtext)
    (let [
      fs (vim.api.nvim_get_vvar "foldstart")
      fe (vim.api.nvim_get_vvar "foldend")
      ls (vim.fn.substitute (vim.fn.getline fs) "\t" (string.rep " " vim.bo.tabstop) "g")
      le (vim.fn.getline fe)
    ] (.. ls "..." (vim.fn.trim le)))))

(fn _G.toggleNvimTree []
  (let [
    nt (require "nvim-tree")
    view (require "nvim-tree.view")]
  (if (not view.is_visible)
    (if (= vim.fn.expand "%:p" "")
      (nt.open)
      (nt.find_file true))
    (view.close))))

(fn _G.replace []
  (let [w (vim.fn.expand "<cword>")]
  (vim.cmd (.. "call feedkeys(\":%s/" w "/" w "/g\\<Left>\\<Left>\")"))))

(fn _G.tomlFold []
  (let [line (vim.fn.getline vim.v.lnum)]
  (if (or (= line "") (= (line:byte) (: "[" :byte)))
    "0"
    "1")))

(fn _G.showDocumentation []
  (match vim.bo.filetype
    "vim" (vim.cmd (.. "h " (vim.fn.expand "<cword>")))
    _ (vim.lsp.buf.hover)))

(fn _G.dump [...]
  (let [objects (vim.tbl_map vim.inspect [ ... ])]
  (print (unpack objects))))

(fn _G.toggle_format []
  (if vim.b.format_on_save
    (do
      (tset vim.b :format_on_save false)
      (vim.notify "turn off auto format"))
    (do
      (tset vim.b :format_on_save true)
      (vim.notify "turn on auto format"))))

(fn _G.lsp_format []
  (when vim.b.format_on_save
    (vim.lsp.buf.format)))

(fn is_floating [win]
  (let [cfg (vim.api.nvim_win_get_config win)]
    (if (or (> cfg.relative "") cfg.external) true false)))

(fn _G.is_special [window]
  (or (is_floating window) 
    (let [buf (vim.api.nvim_win_get_buf window)]
      (or 
        (vim.tbl_contains [:quickfix :nofile] (vim.api.nvim_buf_get_option buf "buftype"))
        (vim.tbl_contains [:dapui_watches :dap-repl] (vim.api.nvim_buf_get_option buf "filetype"))))))

(fn _G.all_special []
  (let [wins (vim.api.nvim_tabpage_list_wins 0)]
    (accumulate [ret true
                     i w (ipairs wins)]
      (and ret (_G.is_special w)))))
