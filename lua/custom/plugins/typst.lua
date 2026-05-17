vim.pack.add {
  'https://github.com/chomosuke/typst-preview.nvim',
}

require('typst-preview').setup {
  dependencies_bin = {
    tinymist = 'tinymist',
    websocat = nil,
  },
  open_cmd = 'zen-browser %s',
}

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'typst',
  callback = function() vim.pack.load 'typst-preview.nvim' end,
})
