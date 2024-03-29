-- vim.cmd([[command! -bang -nargs=* Rg AsyncRun! rg --vimgrep <args>]])
vim.api.nvim_create_user_command("Rg", "grep <args> | copen", { force = true, nargs = "*" })
vim.api.nvim_create_user_command("Z", "execute('cd '.system('zoxide query <args>'))",
  { force = true, nargs = 1 })
vim.api.nvim_create_user_command("LZ", "execute('lcd '.system('zoxide query <args>'))",
  { force = true, nargs = 1 })
vim.api.nvim_create_user_command("Lcd", "lcd %:h", { force = true })
vim.api.nvim_create_user_command("SS", "<line1>,<line2>!perl -pe 's<q-args>'",
  { force = true, nargs = "*", range = true })

vim.api.nvim_create_user_command("Todo", "e ~/Documents/todo.txt", { force = true })
vim.api.nvim_create_user_command("Gblame", "Git blame", { force = true })
vim.api.nvim_create_user_command("Gstash", "DiffviewFileHistory -g --range=stash", { force = true })
vim.api.nvim_create_user_command("StopLsp", "call v:lua.stop_lsp()", { force = true })
