local telescope = require('telescope')
local tb = require('telescope.builtin');
local trouble = require('trouble.providers.telescope')
local wk = require('which-key')

telescope.setup({
  defaults = {
    mappings = {
      i = { ['<c-t>'] = trouble.open_with_trouble },
      n = { ['<c-t>'] = trouble.open_with_trouble },
    },
  },
})


-- Setup language server bindings
wk.register({
  l = { 
    name = 'LSP',
    l = { function() tb.lsp_code_actions() end, 'Show code actions' },
    r = { function() tb.lsp_references() end, 'Show references' },
    e = { function() tb.lsp_definitions() end, 'Show definitions' },
    t = { function() tb.lsp_type_definitions() end, 'Show type definition' },
    i = { function() tb.lsp_implementations() end, 'Show implementations' },
    s = {
      name = 'Symbols',
      s = { function() tb.lsp_document_symbols() end, 'Show document symbols' },
      w = { function() tb.lsp_workspace_symbols() end, 'Show workspace symbols' },
    },
    d = {
      name = 'Diagnostics',
      d = { function() tb.lsp_document_diagnostics() end, 'Show document diagnostics' },
      w = { function() tb.lsp_workspace_diagnostics() end, 'Show workspace diagnostics' },
    },
  },
}, { prefix = '<leader>'})
