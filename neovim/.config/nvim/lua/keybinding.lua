local wk = require('which-key')
local comment = require('Comment')

-- Top level bindings
wk.register({
  K = { function() vim.lsp.buf.hover() end, 'Hover' },
  gd = { function() vim.lsp.buf.definition() end, 'Go to definition' },
}, {})

-- Top level leader bindings
wk.register({
  ['<tab>'] = { '<cmd>e #<cr>', 'Switch to last buffer' },
  c = { function() comment.toggle() end, 'Comment current line' },
}, { prefix = '<leader>'})

-- Telescope bindings
local ts = require('telescope.builtin')
wk.register({
  f = { 
    name = 'Find',
    f = { function() ts.find_files() end, 'Find file' },
    g = { function() ts.live_grep() end, 'Find line in file' },
    b = { function() ts.buffers() end, 'Find buffer' },
    h = { function() ts.help_tags() end, 'Find buffer' },
    r = { function() ts.oldfiles() end, 'Find recent files' },
    m = { function() ts.marks() end, 'Find marks' },
  },
}, { prefix = '<leader>'})
