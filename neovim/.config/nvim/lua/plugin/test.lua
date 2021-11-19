local wk = require('which-key')
local tsutil = require('util-telescope')

-- Set the default testing strategy to 'neovim'
vim.g['test#strategy'] = 'neovim'

function change_strategy()
  tsutil.basic_text('Choose Test Strategy', { 'neovim', 'kitty', 'terminal' }, function(selection)
    print('Test strategy set to: ' .. selection)
    vim.g['test#strategy'] = selection
  end)
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
