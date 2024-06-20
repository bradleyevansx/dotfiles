-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }


  use({
    'navarasu/onedark.nvim',
    as = 'onedark',
    config = function()
      require('onedark').setup {
        style = 'cool',                       -- You can adjust this to the style you prefer
        transparent = true,                   -- Ensure background is not transparent
        term_colors = true,                   -- Update terminal colors
        ending_tildes = false,                -- Ensure tildes are hidden
        cmp_itemkind_reverse = false,         -- Set CMP menu item kind to default
      }
      require('onedark').load()
    end
  })

  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use('nvim-treesitter/playground')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')

  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
  }

  use { 'hoob3rt/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }

  use('jose-elias-alvarez/null-ls.nvim')

  use "nvim-lua/plenary.nvim"   -- don't forget to add this one if you don't have it yet!
  use {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    requires = { { "nvim-lua/plenary.nvim" } }
  }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',       -- optional
    },
  }

  use('mlaursen/vim-react-snippets')
  use('windwp/nvim-ts-autotag')
  use({
    "stevearc/oil.nvim",
    config = function()
      require("oil").setup()
    end,
  })

end)
