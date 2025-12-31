return { -- preview changes produced by code actions
  'aznhe21/actions-preview.nvim',
  cond = not vim.g.vscode,
  event = 'LspAttach',
  config = function()
    require('actions-preview').setup()
  end,
}
