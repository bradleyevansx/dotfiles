function RenameFile(old_name, new_name)
  os.rename(old_name, new_name)
  vim.cmd('e ' .. new_name) -- Reopen the new file in Neovim
end

vim.api.nvim_create_user_command('Rename', function(opts)
  local old_name = vim.fn.expand('%:p')
  local new_name = opts.args
  RenameFile(old_name, new_name)
end, { nargs = 1 })

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
})

vim.api.nvim_set_keymap('n', '<leader>t', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- init.lua
vim.cmd [[
  function! ListUnsavedFiles()
    redir => output
    silent! ls
    redir END
    let unsaved_files = split(output, "\n")
    for file in unsaved_files
      if file =~ '\[u\]'
        echo file
      endif
    endfor
  endfunction
  command! UnsavedFiles call ListUnsavedFiles()
]]
