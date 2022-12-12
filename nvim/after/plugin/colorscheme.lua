--- @usage "tokyonight" | "kanagawa" | "onedark" | "github_dark_default"
local colorscheme = "github_dark_default"

local ok_tokyonight, tokyonight = pcall(require, "tokyonight")
if not ok_tokyonight then return end
local ok_kanagawa, kanagawa = pcall(require, "kanagawa")
if not ok_kanagawa then return end
local ok_github, github = pcall(require, "github-theme")
if not ok_github then return end
local ok_onedark, onedark = pcall(require, "onedarkpro")
if not ok_onedark then return end

tokyonight.setup({
  style = "night",
  sidebars = { "qf", "vista_kind", "terminal", "packer" },
})

kanagawa.setup({
  globalStatus = true,
})

github.setup({
  sidebars = { "qf", "vista_kind", "terminal", "packer" },
})

onedark.setup({
  options = {
    bold = false,
  },
  plugins = {
    gitsigns = true,
    indentline = true,
    lsp_saga = true,
    nvim_cmp = true,
    native_lsp = true,
    packer = true,
    telescope = true,
    treesitter = true,
  },
})

-- Set colorscheme
vim.cmd("colorscheme " .. colorscheme)
