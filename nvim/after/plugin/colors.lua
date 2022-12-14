--- @usage "tokyonight" | "kanagawa" | "onedark" | "rose-pine"
local colorscheme = "tokyonight"

local ok_tokyonight, tokyonight = pcall(require, "tokyonight")
if not ok_tokyonight then
  return
end
local ok_kanagawa, kanagawa = pcall(require, "kanagawa")
if not ok_kanagawa then
  return
end
local ok_rosepine, rosepine = pcall(require, "rose-pine")
if not ok_rosepine then
  return
end
local ok_onedark, onedark = pcall(require, "onedark")
if not ok_onedark then
  return
end

tokyonight.setup({
  style = "storm",
  transparent = true,
  sidebars = { "qf", "vista_kind", "terminal", "packer" },
})

kanagawa.setup({
  globalStatus = true,
})

rosepine.setup({
  dark_variant = "main",
  disable_background = true,
})

onedark.setup({})

-- Set colorscheme
vim.cmd("colorscheme " .. colorscheme)
