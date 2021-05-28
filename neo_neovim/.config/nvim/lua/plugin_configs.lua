local vimp = require('vimp')
local wk = require('which-key')

-- ## Telescope
-- Add some mappings for finding some things
wk.register({
  f = {
    name = 'find',
    f = { '<cmd>Telescope find_files<cr>', 'Find files in CWD recursivly' },
    g = { '<cmd>Telescope live_grep<cr>', 'Grep CWD' },
    h = { '<cmd>Telescope help_tags<cr>', 'Search help tags' },
  },
  b = {
    name = 'buffer',
    b = { '<cmd>Telescope buffers<cr>', 'Find open buffers' },
    d = { '<cmd>Bdelete<cr>', 'Close a buffer'}
  },
}, { prefix = '<leader>'})