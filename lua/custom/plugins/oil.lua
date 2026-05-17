vim.pack.add {
  'https://github.com/nvim-mini/mini.icons',
  'https://github.com/stevearc/oil.nvim',
}

require('mini.icons').setup()

require('oil').setup {
  view_options = {
    show_hidden = true,
  },
}
