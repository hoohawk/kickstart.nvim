return {
  'tpope/vim-fugitive',
  cmd = { 'Git', 'G' },
  keys = {
    { '<leader>gB', '<cmd>Git blame<cr>', desc = 'git blame' },
  },
}
