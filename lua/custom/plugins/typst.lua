vim.pack.add {
  'https://github.com/chomosuke/typst-preview.nvim',
}

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'typst',
  once = true,
  callback = function()
    require('typst-preview').setup {
      dependencies_bin = {
        tinymist = 'tinymist',
        websocat = nil,
      },
      open_cmd = 'zen-browser %s',
    }
  end,
})
