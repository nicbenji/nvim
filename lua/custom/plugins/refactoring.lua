vim.pack.add {
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/lewis6991/async.nvim',
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/ThePrimeagen/refactoring.nvim',
}

require('refactoring').setup {}
