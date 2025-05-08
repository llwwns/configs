local map = vim.keymap.set

vim.g.mapleader = "'"
vim.g.maplocalleader = "'"

map("n", "<c-q>", "<cmd>q<CR>", { silent = false })

map("n", "<c-e>", function()
  if (vim.fn.win_gettype() ~= "command") then
    require("telescope.builtin").buffers({ sort_lastused = true, sort_mru = true })
  end
end, { silent = true })


map("n", "<c-p>", function()
  if (vim.fn.win_gettype() ~= "command") then
    require("telescope.builtin").find_files({ hidden = true })
  end
end, { silent = true })


map("n", "<leader>sw", function()
  if (vim.fn.win_gettype() ~= "command") then
    require("telescope.builtin").git_branches()
  end
end, { silent = true })

map("n", "<leader><tab>", "<cmd>Neotree toggle reveal=true<CR>", { silent = false })

map({ "n", "v" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, noremap = true, silent = false })
map({ "n", "v" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, noremap = true, silent = false })

map("n", "<PageUp>", "<c-u>", { noremap = true, silent = true })
map("n", "<PageDown>", "<c-d>", { noremap = true, silent = true })

map("n", "<up>", "<c-y>", { noremap = true, silent = true })
map("n", "<down>", "<c-e>", { noremap = true, silent = true })
map("n", "<left>", "zH", { noremap = true, silent = true })
map("n", "<right>", "zL", { noremap = true, silent = true })

map("n", "<c-f>", ":Sub/", { noremap = true, silent = true })

map({ "n", "i" }, "<c-w>z", "<cmd>NeoZoomToggle<CR>", { silent = true })


map({ "n", "v", "o" }, "<leader>w", function()
  local hop = require("hop")
  local hint = require("hop.hint")
  hop.hint_words({ direction = hint.HintDirection.AFTER_CURSOR })
end, { silent = true })

map({ "n", "v", "o" }, "<leader>b", function()
  local hop = require("hop")
  local hint = require("hop.hint")
  hop.hint_words({ direction = hint.HintDirection.BEFORE_CURSOR })
end, { silent = true })

map({ "n", "v", "o" }, "<leader>e", function()
  local hop = require("hop")
  local hint = require("hop.hint")
  hop.hint_patterns({ direction = hint.HintDirection.AFTER_CURSOR }, "\\w\\>")
end, { silent = true })

map({ "n", "v", "o" }, "<leader>ge", function()
  local hop = require("hop")
  local hint = require("hop.hint")
  hop.hint_patterns({ direction = hint.HintDirection.BEFORE_CURSOR }, "\\w\\>")
end, { silent = true })

map({ "n", "v", "o" }, "<leader>f", function()
  local hop = require("hop")
  local hint = require("hop.hint")
  hop.hint_char1({ direction = hint.HintDirection.AFTER_CURSOR })
end, { silent = true })

map({ "n", "v", "o" }, "<leader>F", function()
  local hop = require("hop")
  local hint = require("hop.hint")
  hop.hint_char1({ direction = hint.HintDirection.BEFORE_CURSOR })
end, { silent = true })

map({ "n", "v", "o" }, "<leader>j", function()
  local hop = require("hop")
  local hint = require("hop.hint")
  hop.hint_lines({ direction = hint.HintDirection.AFTER_CURSOR })
end, { silent = true })

map({ "n", "v", "o" }, "<leader>k", function()
  local hop = require("hop")
  local hint = require("hop.hint")
  hop.hint_lines({ direction = hint.HintDirection.BEFORE_CURSOR })
end, { silent = true })

map({ "n", "v", "o" }, "<leader>'", function()
  local hop = require("hop")
  hop.hint_patterns({}, "[\"']")
end, { silent = true })

map({ "n", "v", "o" }, "<leader>[", function()
  local hop = require("hop")
  hop.hint_patterns({}, "[\\[(<{]")
end, { silent = true })

map({ "n", "v", "o" }, "<leader>]", function()
  local hop = require("hop")
  hop.hint_patterns({}, "[\\])>}]")
end, { silent = true })

map({ "n", "v", "o" }, "s", function()
  require("hop").hint_char2()
end, { silent = true })

map({ "o" }, "z", function()
  require("hop").hint_char2()
end, { silent = true })

-- map("n", "<leader>a", "<cmd>ArgWrap<CR>", { noremap = true, silent = true })
map("n", "<leader>a", function() require('treesj').toggle() end, { noremap = true, silent = true })

map({ "c" }, "w!!", ":SudaWrite", { silent = true })

map("n", "<Leader>m", "<Plug>(git-messenger)", { silent = true })

map("n", "[,", ":Tab /,<CR>", { silent = true })
map("v", "[,", ":'<,'>Tab /,<CR>", { silent = true })

-- map("v", "<Leader>r", ":TREPLSendSelection<CR>", { silent = true })
--
map("n", "<leader>u", "<cmd>UndotreeToggle<CR>", { silent = true })

map("n", "<C-\\>", ":tab split<CR>:exec('tag '.expand('<cword>'))<CR>", { silent = true })

map({ "n", "t" }, "<c-s>", function()
  if not _G.__term then
    _G.__term = require("terminal").terminal:new({
      layout = { open_cmd = "botright vertical new" },
      cmd = { "fish" },
      autoclose = true,
    })
  end
  _G.__term:toggle({
    open_cmd = "botright " .. math.max(1, math.ceil(vim.api.nvim_win_get_height(0) * 0.4)) .. " new",
  }, false)
  -- require("toggleterm").toggle(0, (vim.api.nvim_win_get_height(0) * 0.4))
end, { noremap = true, silent = true })

map("n", "<leader>gs", "<cmd>Neogit<CR>", { noremap = true, silent = true })

map("n", "<leader>tf", _G.toggle_format, { noremap = true, silent = true })

map("n", "]c", function()
  if vim.wo.diff then
    return "]c"
  else
    return "<cmd>lua require('gitsigns').next_hunk({navigation_message=false})<CR>"
  end
end, { expr = true, noremap = true, silent = true })

map("n", "[c", function()
  if vim.wo.diff then
    return "[c"
  else
    return "<cmd>lua require('gitsigns').prev_hunk({navigation_message=false})<CR>"
  end
end, { expr = true, noremap = true, silent = true })

-- Actions
map({ "n", "v" }, "<leader>hs", function() require("gitsigns").stage_hunk() end, { silent = true })
map({ "n", "v" }, "<leader>hr", function() require("gitsigns").reset_hunk() end, { silent = true })
map("n", "<leader>hS", function() require("gitsigns").stage_buffer() end, { silent = true })
map("n", "<leader>hu", function() require("gitsigns").undo_stage_hunk() end, { silent = true })
map("n", "<leader>hR", function() require("gitsigns").reset_buffer() end, { silent = true })
map("n", "<leader>hp", function() require("gitsigns").preview_hunk() end, { silent = true })
map("n", "<leader>hb", function() require("gitsigns").blame_line({ full = true }) end,
  { silent = true })
map("n", "<leader>tb", function() require("gitsigns").toggle_current_line_blame() end,
  { silent = true })
map("n", "<leader>td", function() require("gitsigns").toggle_deleted() end, { silent = true })
map("n", "<leader>hD", function() require("gitsigns").diffthis("~") end, { silent = true })

map("n", "<leader>hd", "<cmd>Gdiff<CR>", { silent = true })

map("n", "crp", "crcvU", { silent = true })

map("n", "<leader>dq",
  function()
    vim.diagnostic.setqflist({ severity = { min = vim.diagnostic.severity.WARN } })
  end,
  { silent = true })
map("n", "<leader>dl", function()
  vim.diagnostic.setloclist({ severity = { min = vim.diagnostic.severity.WARN } })
end
, { silent = true })

map("i", "<c-a>", "<home>", { noremap = true, silent = true })
map("i", "<c-e>", "<end>", { noremap = true, silent = true })

map("n", "<leader>lu", "<cmd>Lazy update<CR>", { silent = false })
map("n", "<leader>sc", "<cmd>source ~/.config/nvim/init.lua<CR>", { silent = false })
map("n", "<leader>rp", _G.replace, { noremap = true, silent = true })

map("v", "P", "\"0p", { noremap = true, silent = true })
map("t", "<c-\\><c-v>", "<c-\\><c-n>\"+pa", { noremap = true, silent = true })
map("t", "<c-w>h", "<c-\\><c-n><c-w>h", { noremap = true, silent = true })
map("t", "<c-w>j", "<c-\\><c-n><c-w>j", { noremap = true, silent = true })
map("t", "<c-w>k", "<c-\\><c-n><c-w>k", { noremap = true, silent = true })
map("t", "<c-w>l", "<c-\\><c-n><c-w>l", { noremap = true, silent = true })
map("n", "<C-a>", function() return require("dial.map").inc_normal() end,
  { expr = true, noremap = true, silent = false })
map("n", "<C-x>", function() return require("dial.map").dec_normal() end,
  { expr = true, noremap = true, silent = false })
map("v", "<C-a>", function() return require("dial.map").inc_visual() .. "gv" end,
  { expr = true, noremap = true, silent = false })
map("v", "<C-x>", function() return require("dial.map").dec_visual() .. "gv" end,
  { expr = true, noremap = true, silent = false })
map("v", "g<C-a>", function() return require("dial.map").inc_gvisual() .. "gv" end,
  { expr = true, noremap = true, silent = false })
map("v", "g<C-x>", function() return require("dial.map").dec_gvisual() .. "gv" end,
  { expr = true, noremap = true, silent = false })

map("n", "g<", function() require("iswap").iswap_node_with("left") end, { silent = true })
map("n", "g>", function() require("iswap").iswap_node_with("right") end, { silent = true })
map({ "n", "x" }, "<leader>s", function() require("iswap").iswap_node_with() end, { silent = true })

map("i", "<c-r>", "<c-r><c-o>", { noremap = true, silent = true })

map("n", "gp", "`[v`]", { noremap = true, silent = true })

map("n", "<leader>yy", function()
  vim.fn.setreg("+", string.gsub(vim.fn.expand("%"), ".*%.git/[%w%d]+/", ""))
end, { silent = true })

map("n", "]w", function() require("illuminate").goto_next_reference() end, { silent = true })
map("n", "[w", function() require("illuminate").goto_prev_reference() end, { silent = true })

map("n", "<leader>tc", function() vim.cmd.tabclose() end, { silent = true })

map({ "i", "c" }, "<C-j>", "<Plug>(skkeleton-enable)")

map("n", "<leader>z", function() require("zen-mode").toggle() end, { silent = true })

-- improved-search
vim.keymap.set({ "n", "x", "o" }, "n", function() require("improved-search").stable_next() end)

vim.keymap.set({ "n", "x", "o" }, "N", function() require("improved-search").stable_previous() end)

-- Search current word without moving.
vim.keymap.set("n", "!", function() require("improved-search").current_word() end)

-- Search selected text in visual mode
vim.keymap.set("x", "!", function() require("improved-search").in_place() end) -- search selection without moving

vim.keymap.set("x", "*", function() require("improved-search").forward() end)  -- search selection forward

vim.keymap.set("x", "#", function() require("improved-search").backward() end) -- search selection backward

-- Search by motion in place
vim.keymap.set("n", "|", function() require("improved-search").in_place() end)
