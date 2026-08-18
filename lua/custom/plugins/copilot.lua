do
  vim.pack.add { 'https://github.com/github/copilot.vim' }
  vim.g.copilot_no_tab_map = true

  vim.keymap.set('i', '<C-J>', 'copilot#Accept("<CR>")', { silent = true, expr = true, replace_keycodes = false })
end
