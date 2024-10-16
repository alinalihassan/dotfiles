-- Options
vim.opt.relativenumber = true

-- Colorscheme
lvim.colorscheme = "tokyonight-night"

-- Format on Save
-- lvim.format_on_save.enabled = true

-- -- Add Git Icons in NvimTree
-- lvim.builtin.nvimtree.setup.renderer.icons.glyphs.git = {
--   unstaged = "✗",
--   staged = "✓",
--   unmerged = "",
--   renamed = "➜",
--   untracked = "★",
--   deleted = "",
--   ignored = "◌",
-- }

-- -- File Tree Filters/Ignored
-- lvim.builtin.nvimtree.setup.filters.custom = {
--   "node_modules",
--   "\\.cache",
--   ".git"
-- }
-- -- Keybindings
-- -- Whichkey mappings
-- lvim.builtin.which_key.mappings['t'] = { "<cmd>TroubleToggle<cr>", "Diagnostics" }
-- lvim.builtin.which_key.mappings['s']['P'] = { "<cmd>Telescope projects<cr>", "Projects" }

-- -- Mappings
-- lvim.keys.normal_mode["<Tab>"] = { "<cmd>:bnext<cr>", { desc = "Cycle to next open buffer" } }
-- lvim.keys.normal_mode["<S-Tab>"] = { "<cmd>:bprevious<cr>", { desc = "Cycle to previous open buffer" } }

-- -- Git
-- -- lvim.builtin.gitsigns.opts.current_line_blame = true
-- -- lvim.builtin.gitsigns.opts.current_line_blame_opts.delay = 0

-- Fix for LSP not being attached
require('mason-lspconfig').setup_handlers({
  function(server)
    require('lvim.lsp.manager').setup(server)
  end
})

-- -- Plugins
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
--   -- Diagonistics UI
--   {
--     "folke/trouble.nvim",
--     dependencies = { "nvim-tree/nvim-web-devicons" },
--     opts = {},
--   },
--   -- Utility
--   { "jghauser/mkdir.nvim" },   -- Create directories automatically when making a new file
--   { "romainl/vim-cool" },      -- Disable search highlight after search is done (no more :noh after every search)
}


-- Plugin-specific configuration

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
