-- vim.cmd([[command! -bang -nargs=* Rg AsyncRun! rg --vimgrep <args>]])
vim.cmd([[command! -bang -nargs=* Rg grep <args> | copen]])
vim.cmd([[command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>]])
vim.cmd([[command! -nargs=1 Z execute("cd ".system('zoxide query <args>'))]])
vim.cmd([[command! Lcd lcd %:h]])

vim.cmd([[command! -range -nargs=* SS <line1>,<line2>!perl -pe "s<q-args>"]])
vim.cmd([[command! -range -nargs=* Yml <line1>,<line2>!yq.v2 r -]])
vim.cmd([[command! -range -nargs=* Jq <line1>,<line2>!jq .]])
vim.cmd([[command! -range -nargs=* Json <line1>,<line2>!yq.v2  r -j - | jq .]])
vim.cmd([[command! -range Prettier <line1>,<line2>!prettier --stdin --semi --single-quote --jsx-bracket-same-line --print-width 120]])
vim.cmd([[command! -nargs=* MY !echo "s<q-args>"]])
vim.cmd([[command! Todo e ~/todo.txt]])
vim.cmd([[command! Gblame Git blame]])
vim.cmd([[command! Gstatus Git status]])
