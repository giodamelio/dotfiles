local vimp = require('vimp')
local wk = require('which-key')

-- ## Telescope
-- Add some mappings for finding some things
wk.register({
  f = {
    name = 'find',
    f = { '<cmd>Telescope find_files<cr>', 'Find files in CWD recursivly' },
    g = { '<cmd>Telescope live_grep<cr>', 'Grep CWD' },
    b = { '<cmd>Telescope buffers<cr>', 'Find open buffers' },
    h = { '<cmd>Telescope help_tags<cr>', 'Search help tags' },
  }
}, { prefix = '<leader>'})