return {
  'petertriho/nvim-scrollbar',
  cond = not vim.g.vscode,
  config = function()
    require('scrollbar').setup {}
  end,
}
