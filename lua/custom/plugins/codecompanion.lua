do
  vim.pack.add { {
    src = 'https://github.com/olimorris/codecompanion.nvim',
    version = vim.version.range '^19.0.0',
  } }
  require('codecompanion').setup {
    adapters = {
      http = {
        -- Override the built-in Tavily adapter to pull the key from the
        -- macOS Keychain instead of a plaintext environment variable.
        tavily = function()
          return require('codecompanion.adapters').extend('tavily', {
            env = {
              api_key = 'cmd:security find-generic-password -w -s codecompanion-tavily -a $USER',
            },
          })
        end,
      },
    },
    interactions = {
      chat = {
        tools = {
          groups = {
            ['agent'] = {
              tools = {
                'ask_questions',
                'create_file',
                'delete_file',
                'file_search',
                'get_changed_files',
                'get_diagnostics',
                'grep_search',
                'insert_edit_into_file',
                'read_file',
                'run_command',
                'web_search', -- 👈 added
              },
            },
          },
          ['web_search'] = {
            opts = {
              adapter = 'tavily',
              opts = {
                search_depth = 'advanced', -- basic | advanced
                topic = 'general', -- general | news
                chunks_per_source = 3,
                max_results = 5,
              },
            },
          },
        },
      },
    },
  }
  vim.keymap.set('n', '<leader>cc', '<cmd>CodeCompanionChat<CR>', { desc = 'Open Code Companion Chat' })
end
