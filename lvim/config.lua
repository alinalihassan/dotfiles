-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny


-- Options
vim.opt.relativenumber = true

-- LunarVim Core Plugins
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

-- Keybindings
-- Whichkey mappings
lvim.builtin.which_key.mappings['t'] = { "<cmd>TroubleToggle<cr>", "Diagnostics" }

-- Mappings
lvim.keys.normal_mode["<Tab>"] = "<cmd>:bnext<cr>"
lvim.keys.normal_mode["<S-Tab>"] = "<cmd>:bprevious<cr>"

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
  -- Utility
  { "jghauser/mkdir.nvim" }, -- Create directories automatically when making a new file
  { "romainl/vim-cool" },    -- Disable search highlight after search is done (no more :noh after every search)
}
