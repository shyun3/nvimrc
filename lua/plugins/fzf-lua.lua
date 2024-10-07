return {
  "ibhagwan/fzf-lua",
  dependencies = { { "nvim-tree/nvim-web-devicons", opts = {} } },

  opts = {
    preview_layout = "vertical",
    default_previewer = "bat",

    previewers = {
      bat = {
        theme = "Monokai Extended",
      },
    },

    -- Git icons are disabled for performance reasons
    files = {
      git_icons = false,
    },
    oldfiles = {
      include_current_session = true,
    },
    tags = {
      git_icons = false,
    },
    btags = {
      git_icons = false,
    },
    file_icon_padding = " ", -- En space, U+2002
  },

  keys = {
    {
      "<C-p>",
      function()
        require("util").go_to_editable_window()
        require("fzf-lua").files({ cwd = vim.fn.getcwd() })
      end,
      desc = "fzf-lua: Files",
    },
    {
      "<C-q>",
      function()
        require("util").go_to_editable_window()
        require("fzf-lua").files({ cwd = vim.fn.expand("%:p:h") })
      end,
      desc = "fzf-lua: Files in current file directory",
    },
    {
      [[<C-\>]],
      function()
        require("util").go_to_editable_window()
        require("fzf-lua").buffers()
      end,
      desc = "fzf-lua: Buffers",
    },
    {
      "<A-p>",
      function()
        require("util").go_to_editable_window()
        require("fzf-lua").oldfiles()
      end,
      desc = "fzf-lua: Old files",
    },
    {
      "<C-h>",
      function()
        require("util").go_to_editable_window()
        require("fzf-lua").tags()
      end,
      desc = "fzf-lua: Tags",
    },
    {
      "<C-k>",
      function()
        -- `FzfLua btags` by default uses an existing tags file
        -- Generate the latest tags for the current file
        local filePath = vim.fn.expand("%")
        local tmp = vim.fn.tempname()
        vim.cmd({
          cmd = "!",
          args = { "ctags -f", tmp, string.format('"%s"', filePath) },
          mods = { silent = true },
        })

        -- Don't specify cwd for tags call if current file is not under cwd
        local cwd = filePath[0] ~= "/" and vim.fn.getcwd() or ""
        require("fzf-lua").btags({ ctags_file = tmp, cwd = cwd })
      end,
      desc = "fzf-lua: Buffer tags",
    },
    { "<C-j>", "<Cmd>FzfLua blines show_unlisted=true<CR>" },
    { "<Leader>f", "<Cmd>FzfLua builtin<CR>" },
    { "<Leader>;", "<Cmd>FzfLua command_history<CR>" },
    { "<Leader>/", "<Cmd>FzfLua search_history<CR>" },
    { "<Leader>h", "<Cmd>FzfLua help_tags<CR>" },
    { "<Leader>x", "<Cmd>FzfLua commands<CR>" },
    { "<Leader>cf", "<Cmd>FzfLua quickfix<CR>" },

    {
      "<Leader>]",
      "<Cmd>FzfLua lsp_definitions jump_to_single_result=true<CR>",
    },
    {
      "<Leader>s]",
      function()
        require("fzf-lua").lsp_definitions({
          jump_to_single_result = true,
          jump_to_single_result_action = require("fzf-lua.actions").file_split,
        })
      end,
      desc = "LSP: Definition, horizontal split",
    },
    {
      "<Leader>v]",
      function()
        require("fzf-lua").lsp_definitions({
          jump_to_single_result = true,
          jump_to_single_result_action = require("fzf-lua.actions").file_vsplit,
        })
      end,
      desc = "LSP: Definition, vertical split",
    },

    {
      "<Leader>D",
      "<Cmd>FzfLua lsp_typedefs jump_to_single_result=true<CR>",
    },
    {
      "<Leader>sD",
      function()
        require("fzf-lua").lsp_typedefs({
          jump_to_single_result = true,
          jump_to_single_result_action = require("fzf-lua.actions").file_split,
        })
      end,
      desc = "LSP: Type definition, horizontal split",
    },
    {
      "<Leader>vD",
      function()
        require("fzf-lua").lsp_typedefs({
          jump_to_single_result = true,
          jump_to_single_result_action = require("fzf-lua.actions").file_vsplit,
        })
      end,
      desc = "LSP: Type definition, vertical split",
    },

    {
      "<Leader>[",
      "<Cmd>FzfLua lsp_declarations jump_to_single_result=true<CR>",
    },
    {
      "<Leader>s[",
      function()
        require("fzf-lua").lsp_declarations({
          jump_to_single_result = true,
          jump_to_single_result_action = require("fzf-lua.actions").file_split,
        })
      end,
      desc = "LSP: Declaration, horizontal split",
    },
    {
      "<Leader>v[",
      function()
        require("fzf-lua").lsp_declarations({
          jump_to_single_result = true,
          jump_to_single_result_action = require("fzf-lua.actions").file_vsplit,
        })
      end,
      desc = "LSP: Declaration, vertical split",
    },

    { "<Leader>ds", "<Cmd>FzfLua lsp_document_symbols<CR>" },
    { "<Leader>ws", "<Cmd>FzfLua lsp_workspace_symbols<CR>" },

    { "<Leader>rr", vim.lsp.buf.references, desc = "LSP: References" },
    { "<Leader>ri", vim.lsp.buf.incoming_calls, desc = "LSP: Incoming calls" },
    { "<Leader>ro", vim.lsp.buf.outgoing_calls, desc = "LSP: Outgoing calls" },

    {
      "<Leader>gd",
      function()
        local diag = vim.diagnostic.get(0)
        local qf = vim.diagnostic.toqflist(diag)
        vim.fn.setqflist(qf)
        vim.cmd("botright copen")
      end,
      desc = "LSP: Buffer diagnostics",
    },
  },
}
