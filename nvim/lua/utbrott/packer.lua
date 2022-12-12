local ok, packer = pcall(require, "packer")
if not ok then
  print("Packer is not installed")
  return
end

vim.cmd([[packadd packer.nvim]])

return packer.startup(function(use)
  use("wbthomason/packer.nvim")
  use("folke/tokyonight.nvim")
  use("olimorris/onedarkpro.nvim")
  use("rebelot/kanagawa.nvim")
  use("projekt0n/github-nvim-theme")
  use({
    "nvim-telescope/telescope.nvim",
    requires = "nvim-lua/plenary.nvim",
  })
  use("nvim-telescope/telescope-file-browser.nvim")
  use("nvim-lualine/lualine.nvim") -- Statusline
  use("akinsho/bufferline.nvim") -- Buffer line
  use("nvim-tree/nvim-web-devicons") -- File icons
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })
  use("JoosepAlviste/nvim-ts-context-commentstring")
  use({
    "jose-elias-alvarez/null-ls.nvim",
    requires = "nvim-lua/plenary.nvim",
  }) -- Inject diagnostics, code actions, etc.
  use("neovim/nvim-lspconfig") -- LSP
  use("williamboman/mason.nvim") -- LSP manager
  use("williamboman/mason-lspconfig.nvim")
  use("onsails/lspkind.nvim") -- LSP Icons
  use("glepnir/lspsaga.nvim") -- LSP UIs
  -- use("folke/trouble.nvim") -- Diagnostics display in tab
  use("hrsh7th/nvim-cmp") -- Autocomplete engine
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-nvim-lsp")
  use("saadparwaiz1/cmp_luasnip")
  use("L3MON4D3/LuaSnip") -- Snippets for CMP
  -- use("SirVer/ultisnips") -- Easy snippets for code : castel.dev
  use("windwp/nvim-autopairs") -- Autopairs
  use("windwp/nvim-ts-autotag") -- Autotags
  use("NvChad/nvim-colorizer.lua")
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
  use("dinhhuy258/git.nvim") -- For git blame & browse
  use("lewis6991/gitsigns.nvim") -- Git repo signcolumn (gutter) marks
  use("numToStr/Comment.nvim") -- Universal comments
  use("lukas-reineke/indent-blankline.nvim") -- Indent guides
  use("lervag/vimtex") -- TeX/LaTeX integration
  use("ThePrimeagen/vim-be-good") -- Git gud
end)
