-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd({ 'BufEnter', 'WinEnter', 'CursorMoved', 'CursorMovedI', 'CursorHold', 'CursorHoldI' }, {
  desc = 'Highlight cursor line',
  group = vim.api.nvim_create_augroup('cursor-line-highlight', { clear = true }),
  callback = function()
    -- Apply your custom highlight
    vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#2a2f38' })
  end,
})

-- https://github.com/kevinhwang91/nvim-ufo/issues/33#issuecomment-1664656433
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'nvcheatsheet', 'neo-tree' },
  callback = function()
    require('ufo').detach()
    vim.opt_local.foldenable = false
  end,
})
