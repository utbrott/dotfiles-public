require("utbrott.settings")
require("utbrott.remap")
require("utbrott.packer")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- [[ Highlight on Yank ]]
-- `:h vim.highlight.on_yank()`
local highlight_group = augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
  callback = function() vim.highlight.on_yank() end,
  group = highlight_group,
  pattern = "*",
})
