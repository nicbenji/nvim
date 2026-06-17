local ok, jdtls = pcall(require, 'jdtls')
if not ok then return end

local mason = vim.fn.stdpath 'data' .. '/mason'

local root_dir = require('jdtls.setup').find_root {
  'settings.gradle',
  'settings.gradle.kts',
  'pom.xml',
  'mvnw',
  'gradlew',
  '.git',
}

if not root_dir then return end

local workspace_dir = vim.fn.stdpath 'data' .. '/jdtls-workspaces/' .. vim.fn.fnamemodify(root_dir, ':p'):gsub('/', '_')

local bundles = {}

vim.list_extend(
  bundles,
  vim.split(vim.fn.glob(mason .. '/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar'), '\n', { trimempty = true })
)

vim.list_extend(bundles, vim.split(vim.fn.glob(mason .. '/packages/java-test/extension/server/*.jar'), '\n', { trimempty = true }))

local config = {
  cmd = {
    'jdtls',
    '-data',
    workspace_dir,
  },

  root_dir = root_dir,

  settings = {
    java = {
      eclipse = {
        downloadSources = true,
      },

      maven = {
        downloadSources = true,
      },

      references = {
        includeDecompiledSources = true,
      },

      implementationsCodeLens = {
        enabled = true,
      },

      referencesCodeLens = {
        enabled = true,
      },

      configuration = {
        updateBuildConfiguration = 'automatic',
      },
    },
  },

  init_options = {
    bundles = bundles,
  },

  on_attach = function(_, bufnr)
    local opts = { buffer = bufnr }

    vim.keymap.set('n', '<leader>oi', jdtls.organize_imports, opts)

    vim.keymap.set('n', '<leader>ev', jdtls.extract_variable, opts)

    vim.keymap.set('n', '<leader>ec', jdtls.extract_constant, opts)

    vim.keymap.set('n', '<leader>tc', jdtls.test_class, opts)

    vim.keymap.set('n', '<leader>tm', jdtls.test_nearest_method, opts)

    pcall(function()
      jdtls.setup_dap {
        hotcodereplace = 'auto',
      }
    end)
  end,
}

jdtls.start_or_attach(config)
