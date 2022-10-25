return require('packer').startup(function(use)
  -- Make packer manage itself
  use 'wbthomason/packer.nvim'

  -- TokyoNight Colorscheme
  use {
    'folke/tokyonight.nvim',
    config = function()
      require('tokyonight').setup({
        style = 'storm',
	styles = {
	  -- Don't italazise comments or keywords
          comments = { italic = false },
          keywords = { italic = false }
	}
      })

      vim.cmd[[colorscheme tokyonight]]
    end
  }

  -- Interactivly show keybindings
  use {
    'folke/which-key.nvim',
    config = function()
      require('which-key').setup {}
    end
  }

  -- Fuzzy find all the things
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = function()
      local wk = require("which-key")
      local builtin = require('telescope.builtin')
      wk.register({
          f = {
            name = "file",
            f = { builtin.find_files, "Find File" },
            g = { builtin.live_grep, "Live Grep" }
          },
        },
        { prefix = "<leader>" }
      )
    end
  }
end)
