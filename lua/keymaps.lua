-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- hlight on search, but clear on pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })

-- Use trouble for the following: <leader>xx
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

local map = vim.keymap.set

-- Move Lines
-- NOTE: macOS does not work with <A-j> style
map('n', '∆', '<cmd>m .+1<cr>==', { desc = 'Move Down' })
map('n', '˚', '<cmd>m .-2<cr>==', { desc = 'Move Up' })
map('i', '∆', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move Down' })
map('i', '˚', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move Up' })
map('v', '∆', ":m '>+1<cr>gv=gv", { desc = 'Move Down' })
map('v', '˚', ":m '<-2<cr>gv=gv", { desc = 'Move Up' })

map('n', '<C-d>', '<C-d>zz', { desc = 'Move Down Half Page And Center' })
map('n', '<C-u>', '<C-u>zz', { desc = 'Move Up Half Page And Center' })
map('n', '*', '*zz')

map('n', 'L', '<cmd>HopLine<cr>', { desc = 'Flash line (by hop)' })
map('n', '<C-a>', '<cmd>lua require("flash").jump({pattern = vim.fn.expand("<cword>")})<CR>', { desc = 'Flash word' })

-- Tabs
map('n', '<Tab>', '<cmd>bn<cr>')
map('n', '<S-Tab>', '<cmd>bp<cr>')

-- Misc
map('v', 'p', '"_dP') -- V mode: paste without clearing the content
map('n', 'x', '"_x') -- N mode: delete without copying into register
map('n', '<leader>a', 'ggVG', { desc = 'Select All' })
map('n', '<leader>w', '<cmd>wa<cr>', { desc = 'Save All' })
map('n', '<leader>qq', '<cmd>qa<cr>', { desc = 'Quit All' })
map('i', 'jk', '<esc>', { desc = 'ESC' })

-- Neotree Explorer
map('n', '<leader>o', '<cmd>Neotree toggle reveal<cr>', { desc = 'Neotree Open/Close' })

-- map('n', '<leader>cv', '<cmd>AerialToggle!<CR>', { desc = 'Aerial View' })  -- favor trouble symbols toggle
map('n', '<C-_>', '<cmd>ToggleTerm direction=float<cr>', { desc = 'ToggleTerm' })

-- Preview code action changes
map({ 'v', 'n' }, 'gm', '<cmd>lua require("actions-preview").code_actions()<CR>', { desc = 'Code Action Menu' })

map({ 'v', 'n' }, '<leader>tw', '<cmd>set wrap!<CR>', { desc = 'Toggle wrap' })
