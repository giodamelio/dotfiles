local vimp = require('vimp')

-- Add some mappings for telescope
vimp.nnoremap('<leader>ff', function() require('telescope.builtin').find_files() end)
vimp.nnoremap('<leader>fg', function() require('telescope.builtin').live_grep() end)
vimp.nnoremap('<leader>fb', function() require('telescope.builtin').buffers() end)
vimp.nnoremap('<leader>fh', function() require('telescope.builtin').help_tags() end)