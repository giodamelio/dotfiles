local wk = require('which-key')
local tsutil = require('util-telescope')

function change_runner()
  tsutil.basic_text('Choose Test Runner', { 'gotest', 'delve' }, function(selection)
    print('Test runner set to: ' .. selection)
    vim.g['test#go#runner'] = selection
  end)
end

wk.register({
  r = { function() change_runner() end, 'Change Test Runner' },
}, { prefix = '<localleader>'})
