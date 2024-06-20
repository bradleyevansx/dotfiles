-- Load and configure Telescope
local actions = require('telescope.actions')
require('telescope').setup {
  defaults = {
    -- Other default settings
    layout_config = {
      width = 0.85,          -- Total width of the Telescope window
      preview_cutoff = 120,  -- Preview window only appears if the window is larger than this number of columns
      horizontal = {
        preview_width = 0.55, -- Adjust this value to set the width of the preview window as a percentage
      },
      vertical = {
        preview_height = 0.5, -- Adjust this value for vertical layout
      },
    },
    mappings = {
      i = {
      },
    },
  },
}

-- Keymaps for Telescope functions
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>gr', ':Telescope lsp_references<CR>')
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
