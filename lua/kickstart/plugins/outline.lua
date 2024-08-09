-- better UI than Trouble outline as of today, but Trouble is more concise
return {
  'hedyhli/outline.nvim',
  config = function()
    -- Example mapping to toggle outline
    vim.keymap.set('n', '<leader>xo', '<cmd>Outline<CR>', { desc = 'Toggle [O]tline' })

    require('outline').setup {
      -- Your setup opts here (leave empty to use defaults)
    }
  end,
}
