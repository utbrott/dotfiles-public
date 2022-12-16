-- Select the colorscheme
local colorscheme = "github_dimmed"

require("tokyonight").setup({
  style = "night",
  sidebars = { "qf", "vista_kind", "terminal", "packer" },
})

require("kanagawa").setup({
  globalStatus = true,
})

require("github-theme").setup({
  dark_float = true,
  sidebars = { "qf", "vista_kind", "terminal", "packer" },
})

-- Set colorscheme
vim.cmd("colorscheme " .. colorscheme)
