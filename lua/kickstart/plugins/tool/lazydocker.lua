return {
  'mgierada/lazydocker.nvim',
  cond = not vim.g.vscode,
  dependencies = { 'akinsho/toggleterm.nvim' },
  config = function()
    require('lazydocker').setup {}
  end,
  event = 'VeryLazy', -- or any other event you might want to use.
}
