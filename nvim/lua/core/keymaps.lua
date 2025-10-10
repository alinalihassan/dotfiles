-- [[ Basic Keymaps ]]
-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- TODO: Diagnostic keymaps
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ WhichKey Keymaps ]]
vim.keymap.set('n', '<leader>w', vim.cmd.write, { desc = '[W]rite File' })
vim.keymap.set('n', '<leader>q', vim.cmd.quitall, { desc = '[Q]uit NeoVim' })
vim.keymap.set('n', '<leader>pl', ':Lazy<CR>', { desc = '[L]azy' })
vim.keymap.set('n', '<leader>pm', ':Mason<CR>', { desc = '[M]ason' })
vim.keymap.set('n', '<leader>tg', ':Gitsigns toggle_current_line_blame<CR>', { desc = 'Toggle Current Line [G]it Blame' })
vim.keymap.set('n', '<leader>o', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

-- [[ Git Keymaps ]]
vim.keymap.set('n', '<leader>gg', function()
  require('snacks').lazygit.open()
end, { desc = 'Lazy[G]it' })
vim.keymap.set('n', '<leader>gb', ':Gitsigns blame<CR>', { desc = 'Show Git [B]lame' })

-- [[ Documentation Keymaps ]]
-- Show documentation for word under cursor
vim.keymap.set('n', '<C-Space>', vim.lsp.buf.hover, { desc = 'Show Documentation' })

-- [[ Terminal Keymaps ]]
-- TODO: Figure out terminal keybindings
-- vim.keymap.set('n', '<C-/>', function()
--   require('snacks').terminal.toggle()
-- end, { desc = 'Terminal' })
