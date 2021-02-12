local cmd = vim.cmd
local fn = vim.fn
local gl = require("galaxyline")
local section = gl.section
gl.short_line_list = {"LuaTree", "packager", "Floaterm", "coc-eplorer"}

local nord_colors = {
  bg = "#2E3440",
  fg = "#81A1C1",
  line_bg = "#2E3440",
  fg_green = "#8FBCBB",
  yellow = "#EBCB8B",
  cyan = "#A3BE8C",
  darkblue = "#81A1C1",
  green = "#8FBCBB",
  orange = "#D08770",
  purple = "#B48EAD",
  magenta = "#BF616A",
  gray = "#616E88",
  blue = "#5E81AC",
  red = "#BF616A"
}

local buffer_not_empty = function()
  if fn.empty(fn.expand("%:t")) ~= 1 then
    return true
  end
  return false
end

section.left = {
  {
    FirstElement = {
      provider = function() return "  " end,
      highlight = {nord_colors.blue, nord_colors.line_bg}
    }
  }, {
    ViMode = {
      provider = function()
        -- auto change color according the vim mode
        local mode_color = {
          n = nord_colors.magenta,
          i = nord_colors.green,
          v = nord_colors.blue,
          [""] = nord_colors.blue,
          V = nord_colors.blue,
          c = nord_colors.red,
          no = nord_colors.magenta,
          s = nord_colors.orange,
          S = nord_colors.orange,
          [""] = nord_colors.orange,
          ic = nord_colors.yellow,
          R = nord_colors.purple,
          Rv = nord_colors.purple,
          cv = nord_colors.red,
          ce = nord_colors.red,
          r = nord_colors.cyan,
          rm = nord_colors.cyan,
          ["r?"] = nord_colors.cyan,
          ["!"] = nord_colors.red,
          t = nord_colors.red
        }
        cmd("hi GalaxyViMode guifg=" .. mode_color[fn.mode()])
        return vim.fn.mode()
      end,
      separator = " ",
      highlight = {nord_colors.red, nord_colors.line_bg, "bold"}
    }
  }, {
    Paste = {
      provider = function() return "paste" end,
      condition = function() return vim.o.paste end,
      separator = " ",
      separator_highlight = {nord_colors.purple, nord_colors.bg},
      highlight = {nord_colors.red, nord_colors.line_bg, "bold"}
    }
  }, {
    FileName = {
      provider = function()
        return fn.expand("%:F")
      end,
      condition = buffer_not_empty,
      separator = " ",
      separator_highlight = {nord_colors.purple, nord_colors.bg},
      highlight = {nord_colors.purple, nord_colors.line_bg, "bold"}
    }
  }, {
    Readonly = {
      provider = function() return fn.expand("") end,
      condition = function() return vim.bo.readonly end,
      separator = " ",
      separator_highlight = {nord_colors.purple, nord_colors.bg},
      highlight = {nord_colors.purple, nord_colors.line_bg, "bold"}
    }
  }, {
    GitBranch = {
      provider = "GitBranch",
      condition = require("galaxyline.provider_vcs").check_git_workspace,
      separator = "",
      separator_highlight = {nord_colors.purple, nord_colors.bg},
      highlight = {nord_colors.orange, nord_colors.line_bg, "bold"}
    }
  }, {
    FileFormat = {
      provider = function() return vim.bo.filetype end,
      separator = ' ',
      highlight = { nord_colors.blue, nord_colors.line_bg },
    },
  }
}

section.right = {
  {
    DiffAdd = {
      provider = "DiffAdd",
      icon = " ",
      separator = " ",
      separator_highlight = {nord_colors.purple, nord_colors.bg},
      highlight = {nord_colors.green, nord_colors.line_bg}
    }
  }, {
    DiffModified = {
      provider = "DiffModified",
      icon = "柳 ",
      separator = " ",
      separator_highlight = {nord_colors.purple, nord_colors.bg},
      highlight = {nord_colors.yellow, nord_colors.line_bg}
    }
  }, {
    DiffRemove = {
      provider = "DiffRemove",
      icon = " ",
      separator = " ",
      separator_highlight = {nord_colors.purple, nord_colors.bg},
      highlight = {nord_colors.red, nord_colors.line_bg}
    }
  }, {
  LineInfo = {
    provider = "LineColumn",
    separator = " ",
    icon= "☰ ",
    separator_highlight = {nord_colors.blue, nord_colors.line_bg},
    highlight = {nord_colors.gray, nord_colors.line_bg}
  }
},{
    DiagnosticError = {
      provider = "DiagnosticError",
      separator = " ",
      icon = " ",
      highlight = {nord_colors.red, nord_colors.line_bg},
      separator_highlight = {nord_colors.bg, nord_colors.bg}
    }
  }, {
    DiagnosticWarn = {
      provider = "DiagnosticWarn",
      separator = " ",
      icon = " ",
      highlight = {nord_colors.yellow, nord_colors.line_bg},
      separator_highlight = {nord_colors.bg, nord_colors.bg}
    }
  }, {
    DiagnosticInfo = {
      separator = " ",
      provider = "DiagnosticInfo",
      icon = " ",
      highlight = {nord_colors.green, nord_colors.line_bg},
      separator_highlight = {nord_colors.bg, nord_colors.bg}
    }
  }, {
    DiagnosticHint = {
      provider = "DiagnosticHint",
      separator = " ",
      icon = " ",
      highlight = {nord_colors.blue, nord_colors.line_bg},
      separator_highlight = {nord_colors.bg, nord_colors.bg}
    }
  }
}

section.short_line_left = {
  {
    BufferType = {
      provider = 'FileTypeName',
      separator = ' ',
      separator_highlight = {'NONE',nord_colors.bg},
      highlight = {nord_colors.blue,nord_colors.bg,'bold'}
    }
  }, {
    SFileName = {
      provider = function ()
        local fileinfo = require('galaxyline.provider_fileinfo')
        local fname = fileinfo.get_current_file_name()
        for _,v in ipairs(gl.short_line_list) do
          if v == vim.bo.filetype then
            return ''
          end
        end
        return fname
      end,
      condition = buffer_not_empty,
      highlight = {nord_colors.white,nord_colors.bg,'bold'}
    }
  }
}

