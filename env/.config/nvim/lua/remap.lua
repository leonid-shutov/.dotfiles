-- Leader key
vim.g.mapleader = " "

-- Mappings
vim.keymap.set('n', '<C-j>', ':cnext<CR>', { silent = true })
vim.keymap.set('n', '<C-k>', ':cprev<CR>', { silent = true })

-- Open file explorer and close other windows
vim.keymap.set('n', '<leader>e', ':Vex<CR><C-w>o', { silent = true })

-- Reload config
vim.keymap.set('n', '<leader><CR>', ':so ~/.config/nvim/init.lua<CR>', { silent = true })

-- Comment current line
vim.keymap.set('n', '<leader>/', '0i//<ESC>', { silent = true })

-- Copy to system clipboard
vim.keymap.set('v', '<leader>y', '"+y', { silent = true })

-- Move selection
vim.keymap.set('v', 'J', [[:m '>+1<CR>gv=gv]], { silent = true })
vim.keymap.set('v', 'K', [[:m '<-2<CR>gv=gv]], { silent = true })
