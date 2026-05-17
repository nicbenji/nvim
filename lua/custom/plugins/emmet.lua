vim.pack.add {
  {
    src = 'https://github.com/olrtg/nvim-emmet',
    load = false,
  },
}

vim.keymap.set({ 'n', 'v' }, '<leader>xe', function()
  vim.pack.load 'nvim-emmet'
  require('nvim-emmet').wrap_with_abbreviation()
end)
