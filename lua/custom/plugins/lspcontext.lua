vim.pack.add {
  'https://github.com/nvim-treesitter/nvim-treesitter-context',
}

require('treesitter-context').setup {
  enable = true,
  max_lines = 7,
  trim_scope = 'inner',
  mode = 'cursor',
  separator = nil,

  patterns = {
    default = {
      'parameters',
      'parameter_list',
      'formal_parameters',
      'argument_list',
    },
  },
}
