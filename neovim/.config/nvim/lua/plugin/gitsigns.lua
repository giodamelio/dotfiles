local gs = require('gitsigns')
local gsa = require('gitsigns.actions')
local gl = require('gitlinker')
local wk = require('which-key')

gs.setup({
  current_line_blame = true,
  keymaps = {}, -- Remove default bindings since we add our own
})

-- Setup some keybindings
wk.register({
  g = { 
    name = 'Git',
    n = { function() gsa.next_hunk() end, 'Go to next hunk' },
    p = { function() gsa.prev_hunk() end, 'Go to previous hunk' },
    s = { function() gs.stage_hunk() end, 'Stage hunk' },
    u = { function() gs.undo_stage_hunk() end, 'Unstage hunk' },
    r = { function() gs.reset_hunk() end, 'Reset hunk' },
    b = { function() gs.blame_line(true) end, 'Blame Current Line' }, -- true shows full blame with a diff
    y = { function() gl.get_buf_range_url('n') end, 'Get Permalink' },
  },
}, { prefix = '<leader>'})

-- Some visual mode keybindings
-- TODO: these seem to be broken
wk.register({
  g = { 
    name = 'Git',
    s = { function() gs.stage_hunk({vim.fn.line("."), vim.fn.line("v")}) end, 'Stage hunk' },
    r = { function() gs.reset_hunk({vim.fn.line("."), vim.fn.line("v")}) end, 'Reset hunk' },
    y = { function() gl.get_buf_range_url('v') end, 'Get Permalink' },
  },
}, { prefix = '<leader>', mode = 'v' })
