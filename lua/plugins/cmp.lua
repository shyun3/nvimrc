return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",

  dependencies = {
    "windwp/nvim-autopairs",
    "tpope/vim-endwise",

    "hrsh7th/cmp-buffer",
  },

  config = function()
    local cmp = require("cmp")
    cmp.setup({
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<CR>"] = function(fallback)
          if cmp.visible() then
            cmp.confirm({ select = false })
          else
            fallback()
            vim.fn.feedkeys(
              vim.api.nvim_replace_termcodes(
                "<Plug>DiscretionaryEnd",
                true,
                true,
                true
              )
            )
          end
        end,
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<C-Space>"] = cmp.mapping.complete(),
      }),
      sources = cmp.config.sources({
        { name = "buffer" },
      }),
    })
  end,
}
