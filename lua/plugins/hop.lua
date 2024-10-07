
return {
  "smoka7/hop.nvim",
  version = "*",

  config = function()
    require("hop").setup()
    local hopped

    -- Same as `hint_with_callback` except it resets any operator mode forced
    -- motion if a hop was executed. Using this workaround is needed otherwise
    -- the operator will still apply on the current cursor or line if motion is
    -- forced, even though the hop gets cancelled. Of course, this assumes that
    -- the hop uses this function.
    local orig_hint_with_callback = require("hop").hint_with_callback
    require("hop").hint_with_callback = function(...)
      orig_hint_with_callback(...)
      if not hopped then require("util").reset_forced_motion() end
      hopped = false
    end

    -- Same as `move_cursor_to` but records if a hop was executed. Of course,
    -- this assumes that the hop uses this function.
    local orig_move_cursor_to = require("hop").move_cursor_to
    require("hop").move_cursor_to = function(...)
      orig_move_cursor_to(...)
      hopped = true
    end
  end,

  keys = {
    { "<Space>", "<Cmd>HopWord<CR>", mode = "" },
    { "<Enter>", "<Cmd>HopChar1<CR>", mode = "" },

    -- See `:h forced-motion` for usages of `v` and `V` in operator pending mode
    {
      "+",
      require("util.hop").hintTill1,
      mode = { "n", "v" },
      desc = "Hop till character",
    },
    {
      "+",
      "v<Cmd>lua require('util.hop').hintTill1()<CR>",
      mode = "o",
      desc = "Hop till character",
    },

    {
      "_",
      require("util.hop").hintLines,
      mode = { "n", "v" },
      desc = "Hop to line",
    },
    {
      "_",
      "V<Cmd>lua require('util.hop').hintLines()<CR>",
      mode = "o",
      desc = "Hop to line",
    },
  },
}
