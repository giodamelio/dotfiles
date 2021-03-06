-- Bootstrap the packer package manager
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

-- Install some plugins
vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Vimpeccable helps easily write config in Lua
  use 'svermeulen/vimpeccable'

  -- Colorschemes
  use 'crusoexia/vim-monokai'
  use 'folke/tokyonight.nvim'

  -- Better highlighting and language integrations with treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = "maintained", -- Install all modules with maintainers
        -- Make sure match is installed, since we will need it for the `vim-matchup` plugin
        matchup = {
          enable = true
        }
      })
    end
  }

  -- Fuzzy find things with Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
    config = function()
      local trouble = require("trouble.providers.telescope")
      require('telescope').setup({
        defaults = {
          mappings = {
            i = { ["<c-t>"] = trouble.open_with_trouble },
            n = { ["<c-t>"] = trouble.open_with_trouble },
          },
        },
      })
    end
  }

  -- Which key to help me remember keybindings
  use {
    'folke/which-key.nvim',
    config = function()
      require('which-key').setup()
    end
  }

  -- Fast and easy to configure status line
  use {
    'hoob3rt/lualine.nvim',
    requires = {{'kyazdani42/nvim-web-devicons'}},
    config = function()
      require('lualine').setup({
        options = {
          theme = 'tokyonight'
        },
      })
    end
  }

  -- Better behaved :bdelete and :bwipeout
  use 'moll/vim-bbye'

  -- Repeatable find bindings (f, F, t, T)
  use 'rhysd/clever-f.vim'

  -- Show git status in the sign column
  use 'mhinz/vim-signify'

  -- Better commenting of things
  use 'b3nj5m1n/kommentary'

  -- Unix command helpers
  use 'tpope/vim-eunuch'

  -- Use "." to repeat actions from supported plugins
  use 'tpope/vim-repeat'

  -- Easily change quotes and braces and whatnot
  use 'tpope/vim-surround'

  -- Improve % motion and also matching highlighting
  use 'andymass/vim-matchup'

  -- Lint all the things
  use 'dense-analysis/ale'

  -- Show marks in the sign column
  use 'kshenoy/vim-signature'

  -- Shows git commit history for line under cursor
  use 'rhysd/git-messenger.vim'

  -- Keep track of all of a files troubles
  use {
    'folke/trouble.nvim',
    config = function()
      require('trouble').setup({})
    end
  }
end)
