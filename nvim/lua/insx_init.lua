local insx = require("insx")
local esc = insx.helper.regex.esc
-- local endwise = require("insx.recipe.endwise")

--- @class standard
local standard = {}


function standard.setup_insert_mode()
  -- quotes
  for _, quote in ipairs({ '"', "'", '`' }) do
    -- jump_out
    insx.add(
      quote,
      require('insx.recipe.jump_next')({
        jump_pat = {
          [[\\\@<!\%#]] .. esc(quote) .. [[\zs]],
        },
      })
    )

    -- auto_pair
    insx.add(
      quote,
      insx.with(
        require('insx.recipe.auto_pair')({
          open = quote,
          close = quote,
          ignore_pat = quote == [[']] and {
            [[\\\%#]],
            [[\a\%#]],
          } or {
            [[\\\%#]],
          },
        }),
        {
          enabled = function(enabled, ctx)
            return enabled(ctx) and not insx.helper.syntax.in_string_or_comment()
          end,
        }
      )
    )

    -- delete_pair
    -- insx.add(
    --   '<BS>',
    --   require('insx.recipe.delete_pair')({
    --     open_pat = esc(quote),
    --     close_pat = esc(quote),
    --     ignore_pat = ([[\\%s\%%#]]):format(esc(quote)),
    --   })
    -- )
  end

  -- pairs
  for open, close in pairs({
    ['('] = ')',
    ['['] = ']',
    ['{'] = '}',
    -- ['<'] = '>',
  }) do
    -- jump_out
    insx.add(
      close,
      require('insx.recipe.jump_next')({
        jump_pat = {
          [[\%#]] .. esc(close) .. [[\zs]],
        },
      })
    )

    -- auto_pair
    insx.add(
      open,
      require('insx.recipe.auto_pair')({
        open = open,
        close = close,
      })
    )

    -- delete_pair
    insx.add(
      '<BS>',
      require('insx.recipe.delete_pair')({
        open_pat = esc(open),
        close_pat = esc(close),
      })
    )

    -- spacing
    insx.add(
      '<Space>',
      require('insx.recipe.pair_spacing').increase({
        open_pat = esc(open),
        close_pat = esc(close),
      })
    )
    insx.add(
      '<BS>',
      require('insx.recipe.pair_spacing').decrease({
        open_pat = esc(open),
        close_pat = esc(close),
      })
    )

    -- fast_break
    insx.add(
      '<CR>',
      require('insx.recipe.fast_break')({
        open_pat = esc(open),
        close_pat = esc(close),
        split = true,
      })
    )

    -- fast_wrap
    insx.add(
      '<C-]>',
      require('insx.recipe.fast_wrap')({
        close = close,
      })
    )
  end

  -- tags.
  insx.add(
    '<CR>',
    require('insx.recipe.fast_break')({
      open_pat = insx.helper.search.Tag.Open,
      close_pat = insx.helper.search.Tag.Close,
    })
  )
end

function standard.setup_cmdline_mode()
  -- quotes
  for _, quote in ipairs({ '"', "'", '`' }) do
    -- jump_out
    insx.add(
      quote,
      require('insx.recipe.universal.jump_out')({
        close = quote,
        ignore_pat = [[\\\%#]],
      }),
      { mode = 'c' }
    )

    -- auto_pair
    insx.add(
      quote,
      require('insx.recipe.universal.auto_pair')({
        open = quote,
        close = quote,
        ignore_pat = quote == [[']] and {
          [[\\\%#]],
          [[\a\%#]],
        } or {
          [[\\\%#]],
        },
      }),
      { mode = 'c' }
    )

    -- delete_pair
    insx.add(
      '<BS>',
      require('insx.recipe.universal.delete_pair')({
        open = quote,
        close = quote,
        ignore_pat = [[\\]] .. esc(quote) .. [[\%#]],
      }),
      { mode = 'c' }
    )
  end

  -- pairs
  for open, close in pairs({
    ['('] = ')',
    ['['] = ']',
    ['{'] = '}',
    ['<'] = '>',
  }) do
    -- jump_out
    insx.add(
      close,
      require('insx.recipe.universal.jump_out')({
        close = close,
      }),
      { mode = 'c' }
    )

    -- auto_pair
    insx.add(
      open,
      require('insx.recipe.universal.auto_pair')({
        open = open,
        close = close,
      }),
      { mode = 'c' }
    )

    -- delete_pair
    insx.add(
      '<BS>',
      require('insx.recipe.universal.delete_pair')({
        open = open,
        close = close,
      }),
      { mode = 'c' }
    )
  end
end

standard.setup_insert_mode()
standard.setup_cmdline_mode()
