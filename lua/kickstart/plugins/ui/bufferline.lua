return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('bufferline').setup()
    -- works better with transparent plugin
    require('transparent').clear_prefix 'BufferLine'
  end,
}
