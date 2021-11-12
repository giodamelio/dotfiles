local trouble = require('trouble')
local wk = require('which-key')
local st = require('stabilize')

trouble.setup()
st.setup()

-- Setup some keybindings
wk.register({
  t = { 
    name = 'Trouble',
    t = { '<cmd>TroubleToggle<cr>', 'Time for trouble' },
    d = { '<cmd>TroubleToggle lsp_document_diagnostics<cr>', 'Trouble document diagnostics' },
    r = { '<cmd>TroubleToggle lsp_references<cr>', 'Trouble references' },
    e = { '<cmd>TroubleToggle lsp_definitions<cr>', 'Trouble definitions' },
    i = { '<cmd>TroubleToggle lsp_implementations<cr>', 'Trouble implementations' },
  },
}, { prefix = '<leader>'})
