local source = { words = nil, max_words = 7, path = vim.fn.stdpath "config" .. "/words" }

local function split(str, delimiter)
  local result = {}
  local from = 1
  local delim_from, delim_to = string.find(str, delimiter, from)
  while delim_from do
    table.insert(result, string.sub(str, from, delim_from - 1))
    from = delim_to + 1
    delim_from, delim_to = string.find(str, delimiter, from)
  end
  table.insert(result, string.sub(str, from))
  return result
end

function source.new()
  source = setmetatable({}, { __index = source })
  local uv = vim.loop
  uv.fs_open(source.path, "r", 438, function(err, fd)
    assert(not err, err)
    uv.fs_fstat(fd, function(err2, stat)
      assert(not err2, err2)
      uv.fs_read(fd, stat.size, 0, function(err3, buffer)
        assert(not err3, err3)
        uv.fs_close(fd, function(err4)
          assert(not err4, err4)
          source.words = split(buffer, "\n")
        end)
      end)
    end)
  end)
  return source
end

---Return this source is available in current context or not. (Optional)
---@return boolean
function source:is_available()
  return self.words ~= nil
end

---Return the debug name of this source. (Optional)
---@return string
function source:get_debug_name()
  return "words"
end

---Return keyword pattern for triggering completion. (Optional)
---If this is ommited, nvim-cmp will use default keyword pattern. See |cmp-config.completion.keyword_pattern|
---@return string
function source:get_keyword_pattern()
  return [[\k\+]]
end

---Invoke completion. (Required)
---@param params cmp.SourceCompletionApiParams
---@param callback fun(response: lsp.CompletionResponse|nil)
function source:complete(request, callback)
  local req = request.context.cursor_before_line:sub(request.offset)
  callback(self:get_items(req))
end

---Resolve completion item. (Optional)
---@param completion_item lsp.CompletionItem
---@param callback fun(completion_item: lsp.CompletionItem|nil)
function source:resolve(completion_item, callback)
  callback(completion_item)
end

---Execute command after item was accepted.
---@param completion_item lsp.CompletionItem
---@param callback fun(completion_item: lsp.CompletionItem|nil)
function source:execute(completion_item, callback)
  callback(completion_item)
end

---Register custom source to nvim-cmp.
require("cmp").register_source("words", source.new())

local function lower_bound(tbl, str)
  local l = 1
  local r = #tbl + 1
  while l + 1 < r do
    local m = bit.rshift(l + r, 1)
    if tbl[m] >= str then
      r = m
    else
      l = m
    end
  end
  return r
end

local function starts_with(str, pre)
  if #str < #pre then
    return false
  end
  return str:sub(1, #pre) == pre
end

local function getlist(tbl, str, maxc, next)
  if #str < 4 then
    return
  end
  local l = lower_bound(tbl, str)
  for i = l, l + maxc - 1 do
    if i > #tbl then
      break
    end
    if starts_with(tbl[i], str) then
      next(tbl[i])
    else
      break
    end
  end
end

function source:get_items(req)
  if not self.words then
    return { items = {}, isIncomplete = true }
  end
  if req:find "%u$" then
    local s, t = req:find "%u+$"
    local word = req:sub(s, t)
    local prefix = req:sub(1, s - 1)
    results = {}
    getlist(self.words, word:gsub("%w*", string.lower), self.max_words, function(label)
      table.insert(results, {
        label = prefix .. label:gsub("%w*", string.upper),
      })
    end)

    return { items = results, isIncomplete = true }
  elseif req:find "%l$" then
    local s, t = req:find "%u?%l+$"
    local word = req:sub(s, t)
    local prefix = req:sub(1, s - 1)
    local lower = false
    if not word:find "^%l" then
      lower = true
      word = word:gsub("^.", string.lower)
    end
    results = {}
    getlist(self.words, word, self.max_words, function(label)
      if lower then
        label = label:gsub("^.", string.upper)
      end
      label = prefix .. label
      table.insert(results, { label = label })
    end)

    return { items = results, isIncomplete = true }
  else
    return { items = {}, isIncomplete = true }
  end
end
