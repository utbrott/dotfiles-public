local ok, npairs = pcall(require, "nvim-autopairs")
if not ok then return end

npairs.setup({
  disable_filetype = { "TelescopePrompt", "vim" },
})

-- Disable autopairs for ' and " in .tex files
npairs.get_rule("'")[1]:with_pair(function()
  if vim.bo.filetype == "tex" then return false end
end)
npairs.get_rule('"')[1]:with_pair(function()
  if vim.bo.filetype == "tex" then return false end
end)
