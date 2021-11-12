local ts = require('nvim-treesitter.configs')

ts.setup({
  ensure_installed = 'maintained',
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
