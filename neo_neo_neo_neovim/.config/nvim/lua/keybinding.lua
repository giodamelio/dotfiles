local wk = require('which-key')

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
