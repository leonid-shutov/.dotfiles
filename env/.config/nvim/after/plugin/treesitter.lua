require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  sync_install = false,
  auto_install = true,
  ensure_installed = {"javascript", "typescript", "json", "bash"},
}

-- JSON file folding
vim.cmd([[autocmd FileType json setlocal foldmethod=expr]])
vim.cmd([[autocmd FileType json setlocal foldexpr=nvim_treesitter#foldexpr()]])

