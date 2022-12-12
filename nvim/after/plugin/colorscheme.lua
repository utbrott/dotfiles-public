--- @usage "tokyonight" | "kanagawa"
local colorscheme = "kanagawa"

local ok_tokyonight, tokyonight = pcall(require, "tokyonight")
if not ok_tokyonight then return end
local ok_kanagawa, kanagawa = pcall(require, "kanagawa")
if not ok_kanagawa then return end

tokyonight.setup({
  style = "storm",
  sidebars = { "qf", "vista_kind", "terminal", "packer" },
})

kanagawa.setup({
  globalStatus = true,
})

-- Set colorscheme
vim.cmd("colorscheme " .. colorscheme)
