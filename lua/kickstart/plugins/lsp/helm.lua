return {
  {
    'towolf/vim-helm',
    cond = not vim.g.vscode,
    ft = { 'helm', 'yaml' }, -- Load for helm and yaml file types
  },
}
