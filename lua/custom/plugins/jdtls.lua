vim.pack.add {
  {
    src = 'https://github.com/mfussenegger/nvim-jdtls',
    load = false,
  },
}

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'java',
  callback = function() vim.pack.load 'nvim-jdtls' end,
})
