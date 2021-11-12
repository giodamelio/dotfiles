---- Setup Completion with nvim-cmp ----
local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup({
  snippet = {
    expand = function(args)
      require'snippy'.expand_snippet(args.body)
    end,
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'snippy' },
  }, {
    { name = 'buffer' },
  }),
  formatting = {
    format = lspkind.cmp_format({ maxwidth = 50})
  }
})

-- Use buffer source when searching with `/`
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use path and cmdline source with runnign commands with `:`
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Generate a set of capabilities to pass to the LSP
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

---- Setup LSP with nvim-lspconfig ----
local lsp = require('lspconfig')

-- Table of language servers to activate with any additional options
local language_servers = {
  rust_analyzer = {},
  elixirls = {},
}

local global_config = {
  -- Set capabilities from nvim-cmp
  capabilities = capabilities,
}

for lang, config in pairs(language_servers) do
  local merged_config = vim.tbl_deep_extend('force', config, global_config)
  lsp[lang].setup(merged_config)
end
