local vimp = require('vimp')
local wk = require('which-key')

wk.register({
  -- Add some mappings for finding some things
  f = {
    name = 'find',
    f = { '<cmd>Telescope find_files<cr>', 'Find files in CWD recursivly' },
    g = { '<cmd>Telescope live_grep<cr>', 'Grep CWD' },
    h = { '<cmd>Telescope help_tags<cr>', 'Search help tags' },
  },
  -- Buffer related things
  b = {
    name = 'buffer',
    b = { '<cmd>Telescope buffers<cr>', 'Find open buffers' },
    d = { '<cmd>Bdelete<cr>', 'Close a buffer'}
  },
  -- Git related things
  g = {
    name = 'git',
    m = { '<cmd>GitMessenger<cr>', 'Show git history for line under cursor'}
  }
}, { prefix = '<leader>'})