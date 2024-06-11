-- Derived from https://github.com/neovim/nvim-lspconfig/wiki/User-contributed-tips#range-formatting-with-a-motion
local function format_range_operator()
  local old_func = vim.go.operatorfunc
  _G.op_func_formatting = function()
    require("conform").format({
      async = true,
      lsp_fallback = true,
      range = {
        start = vim.api.nvim_buf_get_mark(0, "["),
        ["end"] = vim.api.nvim_buf_get_mark(0, "]"),
      },
    })

    vim.go.operatorfunc = old_func
    _G.op_func_formatting = nil
  end
  vim.go.operatorfunc = "v:lua.op_func_formatting"
  vim.api.nvim_feedkeys("g@", "n", false)
end

return {
  "stevearc/conform.nvim",

  opts = {
    formatters = {
      ["clang-format"] = {
        prepend_args = { "-style=file" },
      },
    },
    formatters_by_ft = {
      c = { "clang-format" },
      cpp = { "clang-format" },
      json = { "prettier" },
      jsonc = { "prettier" },
      lua = { "stylua" },
      python = { "isort", "black" },
    },
  },

  config = function(_, opts)
    require("conform").setup(opts)

    -- Command to run async formatting, taken from recipes
    vim.api.nvim_create_user_command("Format", function(args)
      local range = nil
      if args.count ~= -1 then
        local end_line =
          vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
          start = { args.line1, 0 },
          ["end"] = { args.line2, end_line:len() },
        }
      end
      require("conform").format({
        async = true,
        lsp_fallback = true,
        range = range,
      })
    end, { desc = "Format buffer", range = true })
  end,

  -- Derived from lazy loading recipe
  event = "BufWritePre",
  cmd = { "ConformInfo", "Format" },

  keys = {
    {
      "<Leader>gf",
      format_range_operator,
      mode = { "n", "x" },
      desc = "Format selection",
      silent = true,
    },
  },
}
