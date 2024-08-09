-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

local map = vim.keymap.set
-- hlight on search, but clear on pressing <Esc> in normal mode
map('n', '<esc>', '<cmd>nohlsearch<cr>')

-- Diagnostic keymaps
map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })

-- Use trouble for the following: <leader>xx
-- map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
-- map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- map('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- map('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- map('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- map('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Move Lines
-- NOTE: macOS does not work with <A-j> style
map('n', '∆', '<cmd>m .+1<cr>==', { desc = 'Move Down' })
map('n', '˚', '<cmd>m .-2<cr>==', { desc = 'Move Up' })
map('i', '∆', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move Down' })
map('i', '˚', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move Up' })
map('v', '∆', ":m '>+1<cr>gv=gv", { desc = 'Move Down' })
map('v', '˚', ":m '<-2<cr>gv=gv", { desc = 'Move Up' })
map('v', '<', '<gv', { desc = 'Indent left' })
map('v', '>', '>gv', { desc = 'Indent right' })

map('n', '<C-d>', '<C-d>zz', { desc = 'Move Down Half Page And Center' })
map('n', '<C-u>', '<C-u>zz', { desc = 'Move Up Half Page And Center' })
map('n', '*', '*zz')

map('n', 'L', '<cmd>HopLine<cr>', { desc = 'Flash line (by hop)' })

map('n', 'B', '<cmd>lua require("dropbar.api").pick()<cr>', { desc = 'drop Bar pick' })

map('n', '<C-a>', '<cmd>lua require("flash").jump({pattern = vim.fn.expand("<cword>")})<CR>', { desc = 'Flash word' })

-- map('n', '<leader>w', '<cmd>lua require("which-key").show({keys = "<C-w>", loop=true} )<CR>', { noremap = true, desc = 'Win Hydra' })

-- Tabs
map('n', '<Tab>', '<cmd>bn<cr>')
map('n', '<S-Tab>', '<cmd>bp<cr>')

-- Misc
map('v', 'p', '"_dP') -- V mode: paste without clearing the content
map('n', 'x', '"_x') -- N mode: delete without copying into register
map('n', '<leader>a', 'ggVG', { desc = 'Select All' })
map('n', '<leader>c', '<cmd>bd<cr>', { desc = 'Close Buffer' })
-- map('n', '<leader>w', '<cmd>wa<cr>', { desc = 'Save All' })
map('n', '<leader>qq', '<cmd>qa<cr>', { desc = 'Quit All' })
map('n', '<leader>qB', '<cmd>%bd|e#<cr>', { desc = 'Quit Buffers except current' })
map('i', 'jk', '<esc>', { desc = 'ESC' })

-- Neotree Explorer
map('n', '<leader>o', '<cmd>Neotree toggle reveal<cr>', { desc = 'Neotree Open/Close' })

-- map('n', '<leader>cv', '<cmd>AerialToggle!<CR>', { desc = 'Aerial View' })  -- favor trouble symbols toggle
-- should you just use Tmux?
map('n', '<C-/>', '<cmd>ToggleTerm direction=float<cr>', { desc = 'ToggleTerm' })
map('t', '<C-/>', '<C-\\><C-n><C-w>l', { desc = 'ToggleTerm' })

-- Preview code action changes
map({ 'v', 'n' }, 'gm', '<cmd>lua require("actions-preview").code_actions()<CR>', { desc = 'LSP: Code Action Menu' })

map({ 'v', 'n' }, '<leader>tw', '<cmd>set wrap!<CR>', { desc = '[T]oggle [w]rap' })

map('n', '<leader>lr', function()
  return ':IncRename ' .. vim.fn.expand '<cword>'
end, { expr = true, desc = 'Rename' })

map('n', '<leader>o', '<cmd>Neotree toggle reveal<cr>', { desc = 'Neotree Open/Close' })
-- map('n', '<leader>=', '<C-w>=', { desc = 'Equal window size' })

-- NOTE: macOS does not work with <A-,> style, you can type the key combo in the terminal and copy out the char

-- alt-l for continuously enlarge
map('n', '¬', '<C-w>><C-w>>', { desc = 'Enlarge window size', noremap = true })
-- alt-h for continuously shrink
map('n', '˙', '<C-w><<C-w><', { desc = 'Shrink window size', noremap = true })
-- alt-= for equal
map('n', '≠', '<C-w>=', { desc = 'Equal window size', noremap = true })
map('n', '<leader>wm', '<C-w>|', { desc = 'Max out window size', noremap = true })
map('n', '<leader>we', '<C-w>=', { desc = 'Equal window size', noremap = true })

map('n', '<leader>tt', '<cmd>ToggleTerm direction=float<cr>', { desc = '[T]oggle[T]erm Window' })
map('t', '<leader>tt', '<C-\\><C-n><C-w>l', { desc = '[T]oggle[T]erm' })

-- noice LSP doc scroll
map({ 'n', 'i', 's' }, '<c-d>', function()
  if not require('noice.lsp').scroll(4) then
    return '<c-d>'
  end
end, { silent = true, expr = true })
map({ 'n', 'i', 's' }, '<c-u>', function()
  if not require('noice.lsp').scroll(-4) then
    return '<c-u>'
  end
end, { silent = true, expr = true })

map('n', '<leader>n', '<cmd>cn<cr>', { desc = 'Quickfix Next' })
map('n', '<leader>p', '<cmd>cp<cr>', { desc = 'Quickfix Previous' })

map('n', '<leader>tc', '<cmd>CodeiumToggle<cr>', { desc = '[T]oggle Codeium' })
