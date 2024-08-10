-- Adds git related signs to the gutter, as well as utilities for managing changes
-- NOTE: gitsigns is already included in init.lua but contains only the base
-- config. This will add also the recommended keymaps.
-- for all supported cmd, use `:Gitsigns ....`

return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      current_line_blame = true, -- default to show blame, use keymap to toggle

      on_attach = function(bufnr)
        local gitsigns = require 'gitsigns'

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        ----------------
        -- Navigation --
        ----------------

        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal { ']c', bang = true }
          else
            gitsigns.nav_hunk 'next'
          end
        end, { desc = 'Git: Jump to next change' })

        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal { '[c', bang = true }
          else
            gitsigns.nav_hunk 'prev'
          end
        end, { desc = 'Git: Jump to previous change' })

        -------------
        -- Actions --
        -------------

        -- visual mode
        map('v', '<leader>gs', function()
          gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'stage hunk' })
        map('v', '<leader>gr', function()
          gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'reset hunk' })

        -- normal mode
        map('n', '<leader>gs', gitsigns.stage_hunk, { desc = 'stage hunk' })
        map('n', '<leader>gr', gitsigns.reset_hunk, { desc = 'reset hunk' })
        map('n', '<leader>gS', gitsigns.stage_buffer, { desc = 'Stage buffer' })
        map('n', '<leader>gu', gitsigns.undo_stage_hunk, { desc = 'undo stage hunk' })
        map('n', '<leader>gR', gitsigns.reset_buffer, { desc = 'Reset buffer' })
        map('n', '<leader>gp', gitsigns.preview_hunk_inline, { desc = 'preview hunk' })
        map('n', '<leader>gb', gitsigns.blame_line, { desc = 'blame line' })
        map('n', '<leader>gd', gitsigns.diffthis, { desc = 'diff against index' })
        map('n', '<leader>gD', function()
          gitsigns.diffthis '@'
        end, { desc = 'Diff against last commit' })

        -- Toggles
        map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = 'Toggle - blame line' })
        map('n', '<leader>tD', gitsigns.toggle_deleted, { desc = 'Toggle - git deleted' })
      end,
    },
  },
}
