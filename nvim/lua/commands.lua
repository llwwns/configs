-- vim.cmd([[command! -bang -nargs=* Rg AsyncRun! rg --vimgrep <args>]])
vim.api.nvim_create_user_command("Rg", "grep <args> | copen", { nargs = "*" })
vim.api.nvim_create_user_command("Z", [[execute("cd ".system('zoxide query <args>'))]], { nargs = 1 })
vim.api.nvim_create_user_command("Lcd", "lcd %:h", {})

vim.api.nvim_create_user_command("SS", [[<line1>,<line2>!perl -pe "s<q-args>"]], { range = true, nargs = "*" })
vim.api.nvim_create_user_command("Todo", "e ~/todo.txt", {})
vim.api.nvim_create_user_command("Gblame", "Git blame", {})
