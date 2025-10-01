-- Session management
return {
  'folke/persistence.nvim',
  event = 'BufReadPre',
  opts = {},
  keys = {
    {
      '<leader>mr',
      function()
        require('persistence').load()
      end,
      desc = '[R]estore Session',
    },
    {
      '<leader>ms',
      function()
        require('persistence').select()
      end,
      desc = '[S]elect Session',
    },
    {
      '<leader>ml',
      function()
        require('persistence').load { last = true }
      end,
      desc = 'Restore [L]ast Session',
    },
    {
      '<leader>md',
      function()
        require('persistence').stop()
      end,
      desc = "[D]on't Save Current Session",
    },
  },
}

