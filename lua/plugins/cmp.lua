local function highlight_cmp_menu()
  -- Some colors taken from:
  -- https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance#how-to-add-visual-studio-code-dark-theme-colors-to-the-menu

  vim.api.nvim_set_hl(
    0,
    "CmpItemAbbrDeprecated",
    { link = "@lsp.mod.deprecated" }
  )

  -- Taken from CocSearch
  vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { bg = "NONE", fg = "#15aabf" })
  vim.api.nvim_set_hl(
    0,
    "CmpItemAbbrMatchFuzzy",
    { link = "CmpIntemAbbrMatch" }
  )

  -- Taken from CocMenuSel
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#13354A" })

  vim.api.nvim_set_hl(0, "CmpItemKindFunction", { link = "@lsp.type.function" })
  vim.api.nvim_set_hl(0, "CmpItemKindMethod", { link = "@lsp.type.method" })
  vim.api.nvim_set_hl(
    0,
    "CmpItemKindConstructor",
    { link = "CmpItemKindMethod" }
  )

  vim.api.nvim_set_hl(0, "CmpItemKindText", { link = "String" })

  vim.api.nvim_set_hl(0, "CmpItemKindProperty", { link = "@lsp.type.property" })
  vim.api.nvim_set_hl(0, "CmpItemKindField", { link = "CmpItemKindProperty" })

  vim.api.nvim_set_hl(0, "CmpItemKindVariable", { link = "@lsp.type.variable" })
  vim.api.nvim_set_hl(
    0,
    "CmpItemKindTypeParameter",
    { link = "@lsp.type.parameter" }
  )
  vim.api.nvim_set_hl(
    0,
    "CmpItemKindReference",
    { link = "CmpItemKindVariable" }
  )

  vim.api.nvim_set_hl(0, "CmpItemKindClass", { link = "@lsp.type.class" })
  vim.api.nvim_set_hl(0, "CmpItemKindStruct", { link = "@lsp.type.struct" })
  vim.api.nvim_set_hl(
    0,
    "CmpItemKindInterface",
    { link = "@lsp.type.interface" }
  )
  vim.api.nvim_set_hl(0, "CmpItemKindEnum", { link = "@lsp.type.enum" })

  vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { link = "@lsp.type.keyword" })

  -- front
  vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { bg = "NONE", fg = "#D4D4D4" })

  vim.api.nvim_set_hl(0, "CmpItemKindModule", { link = "@lsp.type.namespace" })

  -- pink
  vim.api.nvim_set_hl(0, "CmpItemKindFile", { bg = "NONE", fg = "#C586C0" })
  vim.api.nvim_set_hl(0, "CmpItemKindFolder", { link = "CmpItemKindFile" })

  vim.api.nvim_set_hl(
    0,
    "CmpItemKindEnumMember",
    { link = "@lsp.type.enumMember" }
  )
  vim.api.nvim_set_hl(
    0,
    "CmpItemKindConstant",
    { link = "CmpItemKindEnumMember" }
  )

  vim.api.nvim_set_hl(0, "CmpItemKindOperator", { link = "@lsp.type.operator" })
end

return {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter", "CmdlineEnter" },

  dependencies = {
    "windwp/nvim-autopairs", -- To make sure <CR> gets mapped first
    "tpope/vim-endwise",

    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "quangnguyen30192/cmp-nvim-ultisnips",
    "folke/lazydev.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "quangnguyen30192/cmp-nvim-tags",

    "onsails/lspkind.nvim",
  },

  config = function()
    highlight_cmp_menu()

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
        { name = "lazydev" },
        { name = "nvim_lsp" },
        { name = "tags" },
        {
          name = "buffer",
          option = {
            get_bufnrs = function() return vim.api.nvim_list_bufs() end,
          },
        },
        { name = "path" },
      }),

      ---@diagnostic disable-next-line: missing-fields
      formatting = {
        format = require("lspkind").cmp_format(),
      },
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
