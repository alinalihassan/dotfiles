-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny


-- Options
vim.opt.relativenumber = true

-- LunarVim Core Plugins
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

lvim.builtin.nvimtree.setup.filters.custom = {
  "node_modules",
  "\\.cache",
  ".git"
}

-- Plugins
lvim.plugins = {
  -- Colorschemes
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  -- Utility
  { "ThePrimeagen/vim-be-good" }, -- Minigames to get used to Vim
  { "jghauser/mkdir.nvim" }       -- Create directories automatically when making a new file
}
