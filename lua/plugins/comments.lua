-- Tiny plugin to enhance Neovim's native comments
return {
  'folke/ts-comments.nvim',
  opts = {},
  event = 'VeryLazy',
  -- enabled = vim.fn.has 'nvim-0.10.0' == 1,
  enabled = false,
  keys = {
    {
      ']t',
      function()
        require('todo-comments').jump_next()
      end,
      desc = 'Next Todo Comment',
    },
    {
      '[t',
      function()
        require('todo-comments').jump_prev()
      end,
      desc = 'Previous Todo Comment',
    },
    { '<leader>xt', '<cmd>Trouble todo toggle<cr>', desc = 'Todo (Trouble)' },
    { '<leader>xT', '<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>', desc = 'Todo/Fix/Fixme (Trouble)' },
    { '<leader>st', '<cmd>TodoTelescope<cr>', desc = 'Todo' },
    { '<leader>sT', '<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>', desc = 'Todo/Fix/Fixme' },
  },
}
