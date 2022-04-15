-- Bootstrap packer.nvim if it doesn't exist on this machine
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  -- Make packer manage itself
  use 'wbthomason/packer.nvim'

  -- So many plugins need this
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'

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
  use 'nvim-telescope/telescope.nvim'

  -- Setup the language server
  use 'neovim/nvim-lspconfig'

  -- Tresitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }
  use 'p00f/nvim-ts-rainbow' -- Rainbow parens

  -- Setup snippets
  use 'dcampos/nvim-snippy'
  use 'dcampos/cmp-snippy'

  -- Setup completions
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'onsails/lspkind-nvim' -- Pretty symbols for nvim-cmp

  -- Pretty statusline
  use 'nvim-lualine/lualine.nvim'
  use 'kyazdani42/nvim-web-devicons' -- For the icons

  -- Show git status
  use 'lewis6991/gitsigns.nvim'

  -- Lists make your troubles go away!
  use 'folke/trouble.nvim'
  use 'luukvbaal/stabilize.nvim' -- Stabalize troubles openening

  -- Do the git
  use 'tpope/vim-fugitive'

  -- Better comments
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  }

  -- Do a Unix to it!
  use 'tpope/vim-eunuch'

  -- Add a well behaved :Bdelete (keeps splits etc...)
  use 'famiu/bufdelete.nvim'

  -- Deal with pairs of things
  use 'tpope/vim-surround'

  -- Show marks in the sign column
  use 'chentau/marks.nvim'

  -- Keep the cursor vertically centered
  use {
    'arnamak/stay-centered.nvim',
    config = function()
      require('stay-centered')
    end,
  }

  -- Generate permalinks to Git forges
  use {
    'ruifm/gitlinker.nvim',
    config = function()
      require('gitlinker').setup({
        mappings = nil
      })
    end,
  }

  -- Run tests easily
  use 'vim-test/vim-test'

  -- Language specific plugins. Should be lazy loaded by FileType

  -- Go development
  use {
    'crispgm/nvim-go',
    ft = 'go',
  }
  use {
    'sebdah/vim-delve',
    ft = 'go',
  }

  -- Auto sync the packer plugins if the config is being bootstraped
  -- **Keep at the end of the plugin list**
  if packer_bootstrap then
    require('packer').sync()
  end
end)
