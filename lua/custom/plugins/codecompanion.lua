do
  vim.pack.add { {
    src = 'https://github.com/olimorris/codecompanion.nvim',
    version = vim.version.range '^19.0.0',
  } }
  require('codecompanion').setup()
end
