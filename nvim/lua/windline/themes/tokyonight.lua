local tn = require("tokyonight.colors").setup()

local colors = {
  black = tn.black,
  white = tn.fg_dark,
  red = tn.red,
  green = tn.teal,
  blue = tn.blue,
  yellow = tn.yellow,
  cyan = tn.cyan,
  magenta = tn.magenta,
  black_light = tn.terminal_black,
  white_light = tn.fg,
  red_light = tn.red,
  green_light = tn.teal,
  blue_light = tn.blue,
  yellow_light = tn.yellow,
  cyan_light = tn.cyan,
  magenta_light = tn.magenta,

  NormalFg = tn.fg,
  NormalBg = tn.bg_highlight,
  InactiveFg = tn.fg_dark,
  InactiveBg = tn.bg,
  ActiveFg = tn.fg,
  ActiveBg = tn.bg_highlight,

  TabSelectionBg = tn.blue,
  TabSelectionFg = tn.black,
}

return colors
