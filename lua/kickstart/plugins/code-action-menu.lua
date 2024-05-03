return {
  'weilbith/nvim-code-action-menu',
  cmd = 'CodeActionMenu',
  keys = {
    {
      '<leader>lm',
      mode = { 'n' },
      '<cmd>CodeActionMenu<CR>',
      desc = 'LSP: Code Action [M]enu',
    },
  },
}
