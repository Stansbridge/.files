local map = vim.keymap.set

-- Movement
map('n', 'j', 'gj', {})
map('n', 'k', 'gk', {})
map('n', '<C-j>', '<C-W>j', {})
map('n', '<C-h>', '<C-W>h', {})
map('n', '<C-k>', '<C-W>k', {})
map('n', '<C-l>', '<C-W>l', {})
map('n', '<C-w>v', ':vsplit<Cr>', {})
map('n', '<C-w>x', ':split<Cr>', {})

-- Utility
map('n', '<leader><cr>', ':noh<cr>', { silent = true })
