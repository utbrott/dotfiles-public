--- @usage "tokyonight" | "kanagawa" | "onedark"
local colorscheme = "onedark"

local ok_tokyonight, tokyonight = pcall(require, "tokyonight")
if not ok_tokyonight then return end
local ok_kanagawa, kanagawa = pcall(require, "kanagawa")
if not ok_kanagawa then return end
local ok_onedark, onedark = pcall(require, "onedark")
if not ok_onedark then return end

tokyonight.setup({
  style = "storm",
  sidebars = { "qf", "vista_kind", "terminal", "packer" },
})

kanagawa.setup({
  globalStatus = true,
})

onedark.setup({})

-- Set colorscheme
vim.cmd("colorscheme " .. colorscheme)
