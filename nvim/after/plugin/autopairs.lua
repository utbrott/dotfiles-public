local ok, autopairs = pcall(require, "nvim-autopairs")
if not ok then
  return
end

autopairs.setup({
  disable_filetype = { "TelescopePrompt", "vim" },
})

-- Disable autopairs for ' and " in .tex files
autopairs.get_rule("'")[1]:with_pair(function()
  if vim.bo.filetype == "tex" then
    return false
  end
end)
autopairs.get_rule('"')[1]:with_pair(function()
  if vim.bo.filetype == "tex" then
    return false
  end
end)
