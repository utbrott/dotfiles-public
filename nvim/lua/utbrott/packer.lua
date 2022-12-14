local ok, packer = pcall(require, "packer")
if not ok then
  print("Packer is not installed")
  return
end

vim.cmd([[packadd packer.nvim]])

return packer.startup(function(use)
  use("wbthomason/packer.nvim")
  -- Some colorschemes
  use("folke/tokyonight.nvim")
  use("rebelot/kanagawa.nvim")
  use("navarasu/onedark.nvim")
  use("Shatur/neovim-ayu")
  use("wincent/base16-nvim")
  use("Mofiqul/vscode.nvim")
  use("cocopon/iceberg.vim")
  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.0",
    requires = "nvim-lua/plenary.nvim",
  })
  use("nvim-telescope/telescope-file-browser.nvim")
  use("nvim-lualine/lualine.nvim") -- Statusline
  use("akinsho/bufferline.nvim") -- Buffer line
  use("nvim-tree/nvim-web-devicons") -- File icons
  use({
    "nvim-tree/nvim-tree.lua",
    tag = "nightly",
    requires = "nvim-tree/nvim-web-devicons",
  })
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })
  use("JoosepAlviste/nvim-ts-context-commentstring")
  use({
    "jose-elias-alvarez/null-ls.nvim",
    requires = "nvim-lua/plenary.nvim",
  }) -- Inject diagnostics, code actions, etc.
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
  use("folke/trouble.nvim") -- Diagnostics display in tab
  use("windwp/nvim-autopairs") -- Autopairs
  use("windwp/nvim-ts-autotag") -- Autotags
  use("NvChad/nvim-colorizer.lua")
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
  use("tpope/vim-fugitive")
  use("lewis6991/gitsigns.nvim") -- Git repo signcolumn (gutter) marks
  use("numToStr/Comment.nvim") -- Universal comments
  use("lervag/vimtex") -- TeX/LaTeX integration
  use("ThePrimeagen/vim-be-good") -- Git gud
end)
