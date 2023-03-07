return require('packer').startup(function(use)
  use 'marko-cerovac/material.nvim'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'
  use 'simrat39/rust-tools.nvim'
  use 'lewis6991/gitsigns.nvim'
  use 'numToStr/Comment.nvim'
  use 'ms-jpq/coq_nvim'
  use 'jose-elias-alvarez/typescript.nvim'
  use 'tpope/vim-sleuth'
  use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
  })
  use {
    'nvim-telescope/telescope.nvim',
    requires = {'nvim-lua/plenary.nvim'}
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }
  use {
    'nvim-tree/nvim-tree.lua',
    requires = { 'nvim-tree/nvim-web-devicons' }
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }
  use {
    'romgrk/barbar.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }
  use {
    'Wansmer/treesj',
    requires = { 'nvim-treesitter/nvim-treesitter' }
  }
  use {
    'kkoomen/vim-doge',
    run = ':call doge#install()'
  }
end)
