vim.cmd [[packadd packer.nvim]]

-- Automatically run :PackerCompile when this file changes
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]

return require('packer').startup(function()
  -- Make packer manage itself
  use 'wbthomason/packer.nvim'

  -- Colorschemes
  use 'crusoexia/vim-monokai'
  use 'folke/tokyonight.nvim'

  -- Help me configure and remember my bindings
  use {
    'folke/which-key.nvim',
    config = function()
      require('which-key').setup{}
    end
  }

  -- Fuzzy find all the things
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/plenary.nvim'}
    },
    config = function()
      local wk = require('which-key')
      wk.register({
        f = {
          name = "find",
          f = { "<cmd>Telescope find_files<cr>", "Find File" },
          r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" }
        },
      }, { prefix = "<leader>" })
    end
  }
end)