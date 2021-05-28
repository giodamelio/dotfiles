-- Load some plugins
require('plugins')

-- Set colorscheme
vim.cmd('colorscheme tokyonight')

-- Set leader keys
vim.g.mapleader = " " -- Set global leader to space
vim.g.maplocalleader = "," -- Set local leader to comma

-- Configure the plugins
require('plugin_configs')