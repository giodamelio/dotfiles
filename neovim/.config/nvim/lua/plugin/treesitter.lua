local ts = require('nvim-treesitter.configs')

ts.setup({
  ensure_installed = { 'go', 'rust' },
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  rainbow = {
    enable = true,
    disable = {},
  },
})
