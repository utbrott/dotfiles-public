-- Select the colorscheme
local colorscheme = 'rose-pine'

require('github-theme').setup({
  dark_float = true,
  sidebars = { 'qf', 'vista_kind', 'terminal', 'packer' },
})

require('kanagawa').setup({
  globalStatus = true,
})

require('rose-pine').setup({
  dark_variant = 'main',
  disable_background = true,
})

-- Set colorscheme
vim.cmd.colorscheme(colorscheme)
