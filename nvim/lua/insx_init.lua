local insx = require('insx')
local esc = require('insx.helper.regex').esc

local standard = {}

function standard.setup()
  standard.setup_insert_mode()
  standard.setup_cmdline_mode()
end

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
      require('insx.recipe.auto_pair').strings({
        open = quote,
        close = quote,
      })
    )

    -- delete_pair
    insx.add(
      '<BS>',
      require('insx.recipe.delete_pair').strings({
        open_pat = esc(quote),
        close_pat = esc(quote),
      })
    )
  end

  -- pairs
  for open, close in pairs({
    ['('] = ')',
    ['['] = ']',
    ['{'] = '}',
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
      require('insx.recipe.jump_next')({
        jump_pat = {
          [[\\\@<!\%#]] .. esc(quote) .. [[\zs]],
        },
      }),
      { mode = 'c' }
    )

    -- auto_pair
    insx.add(
      quote,
      require('insx.recipe.auto_pair').strings({
        open = quote,
        close = quote,
      }),
      { mode = 'c' }
    )

    -- delete_pair
    -- insx.add(
    --   '<BS>',
    --   require('insx.recipe.delete_pair').strings({
    --     open_pat = esc(quote),
    --     close_pat = esc(quote),
    --   }),
    --   { mode = 'c' }
    -- )
  end

  -- pairs
  for open, close in pairs({
    ['('] = ')',
    ['['] = ']',
    ['{'] = '}',
  }) do
    -- jump_out
    insx.add(
      close,
      require('insx.recipe.jump_next')({
        jump_pat = {
          [[\%#]] .. esc(close) .. [[\zs]],
        },
      }),
      { mode = 'c' }
    )

    -- auto_pair
    insx.add(
      open,
      require('insx.recipe.auto_pair')({
        open = open,
        close = close,
      }),
      { mode = 'c' }
    )

    -- delete_pair
    insx.add(
      '<BS>',
      require('insx.recipe.delete_pair')({
        open_pat = esc(open),
        close_pat = esc(close),
      }),
      { mode = 'c' }
    )
  end
end

standard.setup()
