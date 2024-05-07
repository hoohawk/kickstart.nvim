return {
  'xiyaowong/transparent.nvim',
  priority = 2000, -- load this before others
  init = function()
    vim.g.transparent_groups = vim.list_extend(vim.g.transparent_groups or {}, { 'ExtraGroup' })
  end,
}
