return {
  'xiyaowong/transparent.nvim',
  cond = not vim.g.vscode,
  priority = 2000, -- load this before others
  opts = {
    extra_groups = {
      'NormalFloat',
      'FloatBorder',
      'SnacksTerminal',
      'SnacksTerminalNormal',
    },
  },
}
