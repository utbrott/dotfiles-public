-- Install packer
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd([[packadd packer.nvim]])
end

-- Automatically source and re-compile packer whenever the file is saved
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = 'packer.lua',
})

return require('packer').startup(function(use)
  use('wbthomason/packer.nvim') -- Packer can manage itself
  -- General plugins
  use('nvim-lua/plenary.nvim') -- lua functions for plugins
  use('nvim-tree/nvim-web-devicons') -- file icons
  use('windwp/nvim-autopairs') -- autopairs
  use('windwp/nvim-ts-autotag') -- autotags
  use('numToStr/Comment.nvim') -- universal comments
  use('tpope/vim-fugitive') -- git integrations
  use('tpope/vim-rhubarb') -- *
  use('lewis6991/gitsigns.nvim') -- *
  use('lervag/vimtex') -- TeX/LaTeX integration
  use('nvim-lualine/lualine.nvim') -- statusline
  use('akinsho/bufferline.nvim') -- bufferline
  use('moll/vim-bbye') -- buffer utils
  use('lukas-reineke/indent-blankline.nvim') -- indent guides
  -- File explorer
  use({
    'nvim-tree/nvim-tree.lua',
    tag = 'nightly',
    requires = 'nvim-tree/nvim-web-devicons',
  })
  use('akinsho/toggleterm.nvim')
  use('NvChad/nvim-colorizer.lua')
  -- Markdown preview
  use({
    'iamcco/markdown-preview.nvim',
    run = function() vim.fn['mkdp#util#install']() end,
  })

  -- Colorschemes
  use('cocopon/iceberg.vim')
  use('navarasu/onedark.nvim')
  use('projekt0n/github-nvim-theme')
  use('rebelot/kanagawa.nvim')
  use({ 'rose-pine/neovim', as = 'rose-pine' })

  -- Telescope
  use({
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    requires = 'nvim-lua/plenary.nvim',
  })
  use('nvim-telescope/telescope-file-browser.nvim')
  use({
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
  })

  -- Treesitter for syntax highlighting
  use({
    'nvim-treesitter/nvim-treesitter',
    run = function() pcall(require('nvim-treesitter.install').update({ with_sync = true })) end,
  })
  use({
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  })
  use('JoosepAlviste/nvim-ts-context-commentstring')
  use({ 'jose-elias-alvarez/null-ls.nvim', requires = 'nvim-lua/plenary.nvim' }) -- Formatters and linters

  -- LSP Bootstrap with lsp-zero
  use({
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      --Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },
      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'SirVer/ultisnips' }, -- Easier to maintain snippets
      { 'rafamadriz/friendly-snippets' },
      -- Addons
      { 'onsails/lspkind.nvim' }, -- vscode-like pictograms for lsp
    },
  })

  if is_bootstrap then
    require('packer').sync()
    print('Installing plugins, wait untill done and restart nvim')
  end
end)
