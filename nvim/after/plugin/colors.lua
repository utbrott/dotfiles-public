-- Select the colorscheme
local colorscheme = "iceberg"

require("tokyonight").setup({
  style = "night",
  sidebars = { "qf", "vista_kind", "terminal", "packer" },
})

require("kanagawa").setup({
  globalStatus = true,
})

require("onedark").setup({})

require("ayu").setup({
  mirage = true,
})

-- Set colorscheme
vim.cmd("colorscheme " .. colorscheme)
