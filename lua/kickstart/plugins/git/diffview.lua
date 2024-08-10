-- Define the toggle_diffview function globally
_G.toggle_diffview = function()
  local view = require('diffview.lib').get_current_view()
  if view then
    vim.cmd 'DiffviewClose'
  else
    vim.cmd 'DiffviewOpen'
  end
end

return {
  'sindrets/diffview.nvim',
  dependencies = 'nvim-lua/plenary.nvim',
  config = function()
    -- Set the keybinding to call the global function
    vim.api.nvim_set_keymap('n', '<leader>td', '<cmd>lua toggle_diffview()<CR>', { desc = 'Toggle - diffview' })
  end,
}
