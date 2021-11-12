-- Bootstrap packer.nvim if it doesn't exist on this machine
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  -- Make packer manage itself
  use 'wbthomason/packer.nvim'

  -- Colorschemes
  use 'folke/tokyonight.nvim'
  use 'tanvirtin/monokai.nvim'

  -- Which Key to help define-remember my keybindings
  use {
    'folke/which-key.nvim',
    config = function()
      require('which-key').setup()
    end
  }

  -- Fuzzy find all the things!
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Setup the language server
  use 'neovim/nvim-lspconfig'

  -- Setup snippets
  use 'dcampos/nvim-snippy'
  use 'dcampos/cmp-snippy'

  -- Setup completions
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  -- Auto sync the packer plugins if the config is being bootstraped
  -- **Keep at the end of the plugin list**
  if packer_bootstrap then
    require('packer').sync()
  end
end)
