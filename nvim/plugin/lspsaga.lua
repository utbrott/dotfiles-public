local ok, saga = pcall(require, "lspsaga")
if not ok then
  print("lspsaga failed")
  return
end
local map = vim.keymap.set

saga.init_lsp_saga({
  server_filetype_map = {
    typescript = "typescript",
  },
})

local opts = { noremap = true, silent = true }
map("n", "<leader>dj", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
map("n", "<leader>dk", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
map({ "n", "v" }, "<leader>c", "<cmd>Lspsaga code_action<CR>", opts)
map("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
map("n", "gd", "<cmd>Lspsaga lsp_finder<CR>", opts)
map("i", "<C-k>", "<cmd>Lspsaga signature_help<CR>", opts)
map("n", "gp", "<cmd>Lspsaga preview_definition<CR>", opts)
map("n", "<leader>r", "<cmd>Lspsaga rename<CR>", opts)
