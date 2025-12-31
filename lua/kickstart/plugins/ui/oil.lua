return {
  'stevearc/oil.nvim',
  cond = not vim.g.vscode,
  opts = {
    columns = {
      'icon',
      'permissions',
      'size',
      'mtime',
    },
    delete_to_trash = true,
  },
  keys = {
    { '-', '<cmd>Oil<cr>', desc = 'Oil' },
  },
  -- Optional dependencies
  dependencies = { { 'echasnovski/mini.icons', opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
}
