return {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter", "CmdlineEnter" },

  dependencies = {
    "windwp/nvim-autopairs",
    "tpope/vim-endwise",

    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "quangnguyen30192/cmp-nvim-ultisnips",
    "folke/lazydev.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },

  config = function()
    local cmp = require("cmp")
    cmp.setup({
      snippet = {
        expand = function(args) vim.fn["UltiSnips#Anon"](args.body) end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),

        ["<CR>"] = function(fallback)
          if cmp.visible() then
            if cmp.get_active_entry() then
              cmp.confirm({ select = false })
            else
              cmp.abort()
            end
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
        { name = "ultisnips" },
        { name = "nvim_lsp" },
        { name = "lazydev" },
        {
          name = "buffer",
          option = {
            get_bufnrs = function() return vim.api.nvim_list_bufs() end,
          },
        },
        { name = "path" },
      }),
    })

    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline" },
      }),
    })
  end,
}
