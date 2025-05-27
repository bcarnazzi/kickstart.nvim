--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Remember cursor position in file
vim.api.nvim_create_autocmd('BufReadPost', {
  pattern = '*',
  callback = function()
    -- vim.api.nvim_exec('silent! normal! g`"zv', false)
    vim.api.nvim_exec2('silent! normal! g`"zv', { output = false })
  end,
})

-- golang indentation
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'go',
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.shiftwidth = 4
    vim.bo.expandtab = false
  end,
})

-- Start terminal mode when terminal buffer open.
vim.api.nvim_create_autocmd('TermOpen', {
  callback = function()
    vim.cmd 'startinsert!'
  end,
})
