return {
  'epwalsh/obsidian.nvim',
  cond = not vim.g.vscode,
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  -- ft = 'markdown',
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    'BufReadPre '
      .. vim.fn.expand '~'
      .. '/obsidian-vaults/**.md',
    'BufNewFile ' .. vim.fn.expand '~' .. '/obsidian-vaults/**.md',
  },
  dependencies = {
    -- Required.
    'nvim-lua/plenary.nvim',
  },
  opts = {
    workspaces = {
      {
        name = 'hao',
        path = '~/obsidian-vaults/hao',
      },
    },
  },
}
