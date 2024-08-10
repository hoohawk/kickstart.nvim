return {
  'ruifm/gitlinker.nvim',
  event = 'VeryLazy',
  keys = {
    {
      '<leader>gy',
      function()
        require('gitlinker').get_buf_range_url('n', { action_callback = require('gitlinker.actions').copy_to_clipboard })
      end,
      desc = 'Git Linker',
    },
  },
}
