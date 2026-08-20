do
  vim.pack.add { 'https://github.com/nvim-treesitter/nvim-treesitter-context' }

  -- Configure treesitter-context
  require('treesitter-context').setup {
    enable = true,
    max_lines = 3, -- how many context lines to show (0 = no limit)
    min_window_height = 0,
    line_numbers = true,
    multiline_threshold = 1,
    trim_scope = 'outer',
    mode = 'cursor', -- "cursor" or "topline"
    separator = nil, -- e.g. "─" for a divider line under the context
    zindex = 20,
  }

  -- Keymap: jump to the top of the current context (upward navigation)
  vim.keymap.set('n', '[c', function() require('treesitter-context').go_to_context(vim.v.count1) end, { desc = 'Jump to context (upwards)' })
end
