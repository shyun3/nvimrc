return {
  "hrsh7th/nvim-cmp",
  dependencies = { "hrsh7th/cmp-buffer" },
  event = "InsertEnter",

  config = function()
    local cmp = require("cmp")
    cmp.setup({
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
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
