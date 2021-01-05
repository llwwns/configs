local function try_require(tbl, func)
  res = {}
  for i, pkg in ipairs(tbl) do
    local s, r = pcall(require, pkg)
    if s then
      res[i] = r
    else
      print("failed require "..pkg)
      return
    end
  end
  func(unpack(res))
end

return {
  try_require = try_require,
}
