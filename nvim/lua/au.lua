local function augroups(definitions)
  for group_name, definition in pairs(definitions) do
    vim.cmd("augroup " .. group_name)
    vim.cmd "autocmd!"
    for _, def in ipairs(definition) do
      local cmd = "autocmd " .. def
      vim.cmd(cmd)
    end
    vim.cmd "augroup END"
  end
end

augroups {
  numbertoggle = {
    "BufEnter,FocusGained,InsertLeave * set relativenumber",
    "BufLeave,FocusLost,InsertEnter * set norelativenumber",
  },
  filetypes = {
    -- "Filetype calendar IndentLinesDisable",
    "FileType * setlocal tabstop=2 expandtab",
    "FileType make setlocal tabstop=8 noexpandtab",
    "FileType yaml setlocal tabstop=2 expandtab",
    "FileType cpp setlocal tabstop=4 expandtab",
    "FileType vim setlocal tabstop=2 expandtab",
    "FileType ruby setlocal tabstop=2 expandtab",
    "FileType coffee setlocal tabstop=2 expandtab",
    "FileType html setlocal tabstop=2 expandtab",
    "FileType pug setlocal tabstop=2 expandtab",
    "FileType css setlocal tabstop=2 expandtab",
    "FileType scss setlocal tabstop=2 expandtab",
    "FileType lisp setlocal tabstop=2 expandtab",
    "FileType nim setlocal tabstop=2 expandtab",
    "FileType javascript setlocal tabstop=2 expandtab",
    "FileType javascript.jsx setlocal tabstop=2 expandtab",
    "FileType slim setlocal tabstop=2 expandtab",
    "FileType go setlocal tabstop=2 noexpandtab",
    "FileType nginx setlocal tabstop=4 noexpandtab",
    "FileType csv nmap [c :RainbowAlign <CR>",
    "FileType csv nmap ]c :RainbowShrink <CR>",
    "FileType json nmap [j :call JsonBeautify() <CR>",
    "FileType rust setlocal tabstop=4 expandtab",
    "FileType * set formatoptions-=c",
    "FileType * set formatoptions-=r",
    "FileType * set formatoptions-=o",
    "FileType * set fdl=18",
    "FileType * set fdm=indent",
    "FileType * set fdm=indent",
    "FileType rust set foldmethod=expr",
    "FileType rust set foldexpr=nvim_treesitter#foldexpr()",
    "FileType go set foldmethod=expr",
    "FileType go set foldexpr=nvim_treesitter#foldexpr()",
    "FileType lua set foldmethod=expr",
    "FileType lua set foldexpr=nvim_treesitter#foldexpr()",
    "FileType cpp set foldmethod=expr",
    "FileType cpp set foldexpr=nvim_treesitter#foldexpr()",
    "FileType c set foldmethod=expr",
    "FileType c set foldexpr=nvim_treesitter#foldexpr()",
    "FileType javascript set foldmethod=expr",
    "FileType javascript set foldexpr=nvim_treesitter#foldexpr()",
    "FileType typescript set foldmethod=expr",
    "FileType typescript set foldexpr=nvim_treesitter#foldexpr()",
    "FileType typescriptreact set foldmethod=expr",
    "FileType typescriptreact set foldexpr=nvim_treesitter#foldexpr()",
    "FileType json set foldmethod=expr",
    "FileType json set foldexpr=nvim_treesitter#foldexpr()",
    -- "FileType * set foldtext=v:lua.foldtext()",
    "FileType * set shortmess=atToOFcA",
    "FileType toml set fdm=expr",
    "FileType toml set foldexpr=TOMLFold()",
    "FileType confluencewiki setlocal fdm=expr",
    "FileType confluencewiki setlocal fdl=0",
    "FileType confluencewiki setlocal fdc=1",
    "BufReadPost fugitive://* set bufhidden=delete",
    "BufNewFile,BufRead *.cwk set filetype=confluencewiki",
    "BufNewFile,BufRead *.coffee set filetype=coffee",
    'BufReadPre * if getfsize(expand("%")) > 10000000 | syntax off | endif',
    "Filetype cpp nmap <buffer> <leader>cm :!clang++ -std=c++17 -g3 % <CR>",
    "Filetype cpp nmap <buffer> <leader>cr :!clang++ -std=c++17 -g3 % && ./a.out <CR>",
    "TermOpen * IndentBlanklineDisable",
  },
  asyncrun = {
    "QuickFixCmdPost asyncrun botright copen 8",
  },
  completion = {
    "BufEnter * lua local s, com = pcall(require, 'completion'); if s then com.on_attach() end",
    -- "User eskk-enable-pre call v:lua.vim.api.nvim_set_var('completion_enable_auto_popup', 0)",
    -- "User eskk-disable-pre call v:lua.vim.api.nvim_set_var('completion_enable_auto_popup', 1)",
  },
  highlight_yank = {
    'TextYankPost * silent! lua vim.highlight.on_yank { higroup="Visual", timeout=200 }',
  },
}
