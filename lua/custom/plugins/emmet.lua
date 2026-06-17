vim.pack.add {
  {
    src = 'https://github.com/olrtg/nvim-emmet',
  },
}

vim.keymap.set({ 'n', 'v' }, '<leader>xe', function()
  local ok, emmet = pcall(require, 'nvim-emmet')

  if not ok then return end
  emmet.wrap_with_abbreviation()
end)
