vim.pack.add {
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/mfussenegger/nvim-jdtls',
  {
    src = 'https://github.com/elmcgill/springboot-nvim',
  },
}

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'java',
  callback = function()
    local springboot_nvim = require 'springboot-nvim'

    vim.keymap.set('n', '<leader>Jr', springboot_nvim.boot_run, {
      desc = 'Spring Boot Run Project',
      buffer = true,
    })

    vim.keymap.set('n', '<leader>Jc', springboot_nvim.generate_class, {
      desc = 'Java Create Class',
      buffer = true,
    })

    vim.keymap.set('n', '<leader>Ji', springboot_nvim.generate_interface, {
      desc = 'Java Create Interface',
      buffer = true,
    })

    vim.keymap.set('n', '<leader>Je', springboot_nvim.generate_enum, {
      desc = 'Java Create Enum',
      buffer = true,
    })

    springboot_nvim.setup {}
  end,
})
