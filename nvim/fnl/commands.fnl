(require-macros :hibiscus.vim)

; vim.cmd([[command! -bang -nargs=* Rg AsyncRun! rg --vimgrep <args>]])
(command! [:nargs "*"] :Rg "grep <args> | copen")
(command! [:nargs 1] :Z "execute('cd '.system('zoxide query <args>'))")
(command! [:nargs 1] :LZ "execute('lcd '.system('zoxide query <args>'))")
(command! [] :Lcd "lcd %:h")
(command! [:range true :nargs "*"] :SS "<line1>,<line2>!perl -pe 's<q-args>'")

(command! [] :Todo "e ~/Documents/todo.txt")
(command! [] :Gblame "Git blame")
(command! [] :StopLsp "call v:lua.stop_lsp()")
