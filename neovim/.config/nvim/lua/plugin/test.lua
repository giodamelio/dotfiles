local wk = require('which-key')
local pickers = require 'telescope.pickers'
local finders = require 'telescope.finders'
local conf = require('telescope.config').values
local themes = require('telescope.themes')
local actions = require 'telescope.actions'
local action_state = require 'telescope.actions.state'

-- Set the default testing strategy to 'neovim'
vim.g['test#strategy'] = 'neovim'

-- Allow changing the test strategy easily with Telescope
local change_strategy = function()
  pickers.new(themes.get_dropdown({}), {
    prompt_title = 'Choose Test Strategy',
    finder = finders.new_table {
      results = { 'neovim', 'kitty', 'terminal' }
    },
    sorter = conf.generic_sorter(),
    attach_mappings = function(prompt_bufnr, map)
      -- When an item is selected, set the strategy and print a message
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        print('Test strategy set to: ' .. selection[1])
        vim.g['test#strategy'] = selection[1]
      end)

      return true
    end,
  }):find()
end

-- Set some keybindings
wk.register({
  t = { 
    name = 'Test',
    t = { '<cmd>TestNearest<cr>', 'Run test nearest to the cursor' },
    l = { '<cmd>TestLast<cr>', 'Run the last test' },
    f = { '<cmd>TestFile<cr>', 'Run all the tests in the current file' },
    v = { '<cmd>TestVisit<cr>', 'Open the buffer from which you last ran your tests' },
    s = { function() change_strategy() end, 'Change the testing strategy' },
  },
}, { prefix = '<leader>'})
