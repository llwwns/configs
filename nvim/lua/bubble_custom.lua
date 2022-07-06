-- :fennel:generated
local windline = require("windline")
local helper = require("windline.helpers")
local sep = helper.separators
local vim_components = require("windline.components.vim")
local b_components = require("windline.components.basic")
local state = _G.WindLine.state
local lsp_comps = require("windline.components.lsp")
local git_comps = require("windline.components.git")
local navic = require("nvim-navic")
local hl_list = {Black = {"white", "black"}, White = {"black", "white"}, Inactive = {"InactiveFg", "InactiveBg"}, Active = {"ActiveFg", "ActiveBg"}}
local text_colors = {Normal = "blue_light", Insert = "green", Visual = "yellow", Replace = "red", Command = "magenta"}
table.flatmap = function(tbl, func)
  local ret_tbl = {}
  for k, v in pairs(tbl) do
    local t2 = func(k, v)
    for k2, v2 in pairs(t2) do
      ret_tbl[k2] = v2
    end
  end
  return ret_tbl
end
local basic
local function _1_(k, v)
  return {[(k .. "S1")] = {"ActiveBg", "InactiveBg"}, [(k .. "Icon")] = {v, "ActiveBg"}, [(k .. "Before")] = {v, "ActiveBg"}, [k] = {"black", v, "bold"}, [(k .. "After")] = {"white", v}}
end
local function _2_()
  return {{sep.left_rounded, (state.mode[2] .. "Before")}, {(state.mode[1] .. " "), state.mode[2]}, {sep.left_rounded, (state.mode[2] .. "After")}}
end
local function _3_()
  if lsp_comps.check_lsp() then
    return {{lsp_comps.lsp_error({format = " \239\129\151 %s"}), "red"}, {lsp_comps.lsp_warning({format = " \239\129\177 %s"}), "yellow"}, {lsp_comps.lsp_hint({format = " \239\159\187 %s"}), "blue"}}
  else
    return ""
  end
end
local function _5_(bufnr, winid, width)
  local fname
  if (width > 110) then
    fname = b_components.full_file_name
  else
    fname = b_components.cache_file_name("[No Name]", "full")
  end
  return {{b_components.cache_file_icon({default = "\239\131\182"}), "default"}, {" ", "default"}, {fname}, {b_components.file_modified("\239\129\128 "), ""}}
end
local function _7_()
  return {{sep.left_rounded, "sep_before"}, {"l/n", "text"}, {b_components.line_col, "text"}, {"\239\131\137 ", "text"}, {b_components.progress, "text"}, {sep.right_rounded, "sep_after"}}
end
local function _8_()
  if git_comps.is_git() then
    return {{" "}, {git_comps.diff_added({format = "+ %s"}), "green"}, {git_comps.diff_removed({format = " - %s"}), "red"}, {git_comps.diff_changed({format = " ~ %s"}), "blue"}}
  else
    return ""
  end
end
local function _10_()
  if navic.is_available() then
    return (" " .. navic.get_location())
  else
    return ""
  end
end
basic = {divider = {b_components.divider, ""}, space = {" ", ""}, file_name_inactive = {b_components.full_file_name, hl_list.Inactive}, line_col_inactive = {b_components.line_col, hl_list.Inactive}, progress_inactive = {b_components.progress, hl_list.Inactive}, vi_mode = {name = "vi_mode", hl_colors = table.flatmap(text_colors, _1_), text = _2_}, lsp_diagnos = {name = "diagnostic", hl_colors = {red = {"red", "ActiveBg"}, yellow = {"yellow", "ActiveBg"}, blue = {"blue", "ActiveBg"}}, width = 90, text = _3_}, file = {name = "file", hl_colors = {default = hl_list.White}, text = _5_}, right = {hl_colors = {sep_before = {"black_light", "ActiveBg"}, sep_after = {"black_light", "ActiveBg"}, text = {"white", "black_light"}}, text = _7_}, git = {name = "git", width = 90, hl_colors = {green = {"green", "ActiveBg"}, red = {"red", "ActiveBg"}, blue = {"blue", "ActiveBg"}}, text = _8_}, navic = {_10_, {"white", "ActiveBg"}}}
local default = {filetypes = {"default"}, active = {{" ", hl_list.Active}, basic.vi_mode, basic.file, {vim_components.search_count(), {"black", "white"}}, {sep.right_rounded, {"white", "ActiveBg"}}, basic.lsp_diagnos, basic.git, basic.navic, basic.divider, {"[%{&fileformat}]", {"blue", "ActiveBg"}, 90}, {git_comps.git_branch({icon = " \238\130\160 "}), {"green", "ActiveBg"}, 90}, {" ", hl_list.Active}, basic.right, {" ", hl_list.Active}}, inactive = {basic.file_name_inactive, basic.divider, basic.divider, basic.line_col_inactive, {"\238\130\185", {"white", "InactiveBg"}}, basic.progress_inactive}}
local quickfix
local function _12_()
  return (vim.fn.getqflist({title = 0})).title
end
quickfix = {filetypes = {"qf", "Trouble"}, active = {{helper.separators.left_rounded, {"red_light", "black_light"}}, {"Quickfix ", {"black", "red_light"}}, {helper.separators.left_rounded, {"black_light", "red_light"}}, {_12_, {"cyan", "black_light"}}, {" Total : %L ", {"cyan", "black_light"}}, {helper.separators.right_rounded, {"black_light", "InactiveBg"}}, {" ", {"InactiveFg", "InactiveBg"}}, basic.divider}, always_active = true}
local explorer = {filetypes = {"fern", "NvimTree", "lir"}, active = {{helper.separators.left_rounded, {"black", "black_light"}}, {" \239\144\148 ", {"white", "black"}}, {helper.separators.right_rounded, {"black", "black_light"}}, {b_components.divider, ""}, {b_components.file_name("\239\131\182"), {"white", "black_light"}}}, always_active = true, show_last_status = true}
local function _13_(colors)
  return colors
end
return windline.setup({colors_name = _13_, statuslines = {default, explorer, quickfix}, tabline = {template = {select = {"", {"TabSelectionFg", "TabSelectionBg"}}, select_start = {"", {"TabLineBg", "TabSelectionBg"}}, select_end = {(sep.slant_right .. " "), {"TabSelectionBg", "TabLineBg"}}, select_last = {sep.slant_right, {"TabSelectionBg", "TabLineFillBg"}}, normal = {"", {"TabLineFg", "TabLineBg"}}, normal_start = {" ", {"TabLineFg", "TabLineBg"}}, normal_end = {sep.slant_right_thin, {"TabLineFg", "TabLineBg"}}, normal_select = {(sep.slant_right .. " "), {"TabLineBg", "TabSelectionBg"}}, normal_last = {sep.slant_right, {"TabLineBg", "TabLineFillBg"}}}}})