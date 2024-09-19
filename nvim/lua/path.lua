local function exists(filename)
  local stat = vim.loop.fs_stat(filename)
  return stat ~= nil
end

local is_windows = vim.loop.os_uname().version:match("Windows")
local path_separator = is_windows and "\\" or "/"

local function join(...)
  return table.concat(vim.tbl_flatten({ ... }), path_separator):gsub(path_separator .. "+",
    path_separator)
end

return {
  exists = exists,
  join = join,
}
