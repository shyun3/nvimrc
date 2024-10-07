return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },

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
  },
}
