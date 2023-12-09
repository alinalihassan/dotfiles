-- Options
vim.opt.relativenumber = true

-- Colorscheme
lvim.colorscheme = "tokyonight-night"

-- Format on Save
lvim.format_on_save.enabled = true

-- Add Git Icons in NvimTree
lvim.builtin.nvimtree.setup.renderer.icons.glyphs.git = {
  unstaged = "✗",
  staged = "✓",
  unmerged = "",
  renamed = "➜",
  untracked = "★",
  deleted = "",
  ignored = "◌",
}

-- File Tree Filters/Ignored
lvim.builtin.nvimtree.setup.filters.custom = {
  "node_modules",
  "\\.cache",
  ".git"
}
-- Helps with Java Projects
lvim.builtin.nvimtree.setup.view.adaptive_size = true
lvim.builtin.nvimtree.setup.renderer.group_empty = true

-- Keybindings
-- Whichkey mappings
lvim.builtin.which_key.mappings['t'] = { "<cmd>TroubleToggle<cr>", "Diagnostics" }
lvim.builtin.which_key.mappings['s']['P'] = { "<cmd>Telescope projects<cr>", "Projects" }

-- Mappings
lvim.keys.normal_mode["<Tab>"] = { "<cmd>:bnext<cr>", { desc = "Cycle to next open buffer" } }
lvim.keys.normal_mode["<S-Tab>"] = { "<cmd>:bprevious<cr>", { desc = "Cycle to previous open buffer" } }

-- Formatters
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { name = "prettier" },
}

-- Git
lvim.builtin.gitsigns.opts.current_line_blame = true
lvim.builtin.gitsigns.opts.current_line_blame_opts.delay = 0

-- Message filters
require("noice").setup({
  routes = {
    {
      filter = {
        event = "msg_show",
        kind = "",
        find = "written",
      },
      opts = { skip = true },
    },
  },
})

-- Plugins
lvim.plugins = {
  -- Colorschemes
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night"
    },
  },
  -- Diagonistics UI
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },
  -- Cmdline and notifications UI
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  },
  -- AI Assistant
  {
    "sourcegraph/sg.nvim",
    dependencies = { "nvim-lua/plenary.nvim", --[[ "nvim-telescope/telescope.nvim ]] },
  },
  -- Move between vim and tmux windows like they're the same
  {
    "christoomey/vim-tmux-navigator",
    config = function()
      vim.cmd([[
            " let g:tmux_navigator_save_on_switch = 1
            let  g:tmux_navigator_no_wrap = 1
            ]])
    end,
  },
  -- LSPs
  { "tmux-plugins/vim-tmux" }, -- Tmux Conf LSP
  -- Utility
  { "jghauser/mkdir.nvim" },   -- Create directories automatically when making a new file
  { "romainl/vim-cool" },      -- Disable search highlight after search is done (no more :noh after every search)
}
