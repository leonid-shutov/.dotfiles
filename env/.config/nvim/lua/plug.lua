local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim')
Plug('projekt0n/github-nvim-theme')
Plug('MunifTanjim/nui.nvim')
Plug('kdheepak/lazygit.nvim')
Plug('preservim/nerdcommenter')
Plug('neoclide/coc.nvim', { ['branch'] = 'release' })
Plug('nvim-lua/plenary.nvim')
Plug('nvim-treesitter/nvim-treesitter')
Plug('chrisbra/csv.vim')
Plug('ThePrimeagen/harpoon')

vim.call('plug#end')
