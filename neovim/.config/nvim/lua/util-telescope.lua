local pickers = require 'telescope.pickers'
local finders = require 'telescope.finders'
local conf = require('telescope.config').values
local themes = require('telescope.themes')
local actions = require 'telescope.actions'
local action_state = require 'telescope.actions.state'

local M = {}

function M.basic_text(title, values, callback)
  pickers.new(themes.get_dropdown({}), {
    prompt_title = title,
    finder = finders.new_table {
      results = values
    },
    sorter = conf.generic_sorter(),
    attach_mappings = function(prompt_bufnr, map)
      -- When an item is selected, set the strategy and print a message
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        callback(selection[1])
      end)

      return true
    end,
  }):find()
end

return M
