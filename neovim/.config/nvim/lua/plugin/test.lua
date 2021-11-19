local wk = require('which-key')

-- Set the default testing strategy to 'neovim'
vim.g['test#strategy'] = 'neovim'

-- Set some keybindings
wk.register({
  t = { 
    name = 'Test',
    t = { '<cmd>TestNearest<cr>', 'Run test nearest to the cursor' },
    l = { '<cmd>TestLast<cr>', 'Run the last test' },
    f = { '<cmd>TestFile<cr>', 'Run all the tests in the current file' },
    v = { '<cmd>TestVisit<cr>', 'Open the buffer from which you last ran your tests' },
  },
}, { prefix = '<leader>'})
