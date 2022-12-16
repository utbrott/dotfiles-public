local fn = vim.fn

-- Automatic packer installation
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Packer installed, reopen Neovim")
  vim.cmd([[packadd packer.nvim]])
end

-- Source packer.lua on file save
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile>
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then return end

-- Use popup for Packer with rounded border
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

return packer.startup(function(use)
  use("wbthomason/packer.nvim") -- Packer can manage itself
  -- General plugins
  use("nvim-lua/plenary.nvim") -- lua functions for plugins
  use("nvim-tree/nvim-web-devicons") -- file icons
  use("windwp/nvim-autopairs") -- autopairs
  use("windwp/nvim-ts-autotag") -- autotags
  use("numToStr/Comment.nvim") -- universal comments
  use("tpope/vim-fugitive") -- git integrations
  use("lewis6991/gitsigns.nvim") -- git repo signcolumn (gutter) marks
  use("lervag/vimtex") -- TeX/LaTeX integration
  use("folke/trouble.nvim") -- diagnostics display
  use("folke/which-key.nvim") -- keymaps manager, display
  use("nvim-lualine/lualine.nvim") -- statusline
  use("akinsho/bufferline.nvim") -- bufferline
  use("moll/vim-bbye") -- buffer utils
  use("lukas-reineke/indent-blankline.nvim") -- indent guides
  -- File explorer
  use({
    "nvim-tree/nvim-tree.lua",
    tag = "nightly",
    requires = "nvim-tree/nvim-web-devicons",
  })
  use("akinsho/toggleterm.nvim")
  use("NvChad/nvim-colorizer.lua")
  -- Markdown preview
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  -- Colorschemes
  use("folke/tokyonight.nvim")
  use("rebelot/kanagawa.nvim")
  use("cocopon/iceberg.vim")
  use("LunarVim/onedarker.nvim")
  use("LunarVim/darkplus.nvim")
  use("projekt0n/github-nvim-theme")

  -- Telescope
  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.0",
    requires = "nvim-lua/plenary.nvim",
  })
  use("nvim-telescope/telescope-file-browser.nvim")

  -- Treesitter for syntax highlighting
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  use("JoosepAlviste/nvim-ts-context-commentstring")
  use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" }) -- Formatters and linters

  -- LSP Bootstrap with lsp-zero
  use({
    "VonHeikemen/lsp-zero.nvim",
    requires = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
      --Autocompletion
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },
      -- Snippets
      { "L3MON4D3/LuaSnip" },
      { "SirVer/ultisnips" }, -- Easier to maintain snippets
      { "rafamadriz/friendly-snippets" },
      -- Addons
      { "onsails/lspkind.nvim" }, -- vscode-like pictograms for lsp
    },
  })
  -- Automatically setup plugins after packer is installed
  if PACKER_BOOTSTRAP then require("packer").sync() end
end)
