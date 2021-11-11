-- Bootstrap packer.nvim if it doesn't exist on this machine
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  -- Make packer manage itself
  use 'wbthomason/packer.nvim'

  -- Auto sync the packer plugins if the config is being bootstraped
  -- **Keep at the end of the plugin list**
  if packer_bootstrap then
    require('packer').sync()
  end
end)
