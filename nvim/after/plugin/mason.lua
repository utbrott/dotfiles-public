local ok_mason, mason = pcall(require, "mason")
if not ok_mason then
  return
end
local ok_lspconfig, lspconfig = pcall(require, "mason-lspconfig")
if not ok_lspconfig then
  print("mason-lspconfig failed")
  return
end

mason.setup()

lspconfig.setup({
  automatic_installation = true,
  ensure_installed = {
    "tsserver",
    "tailwindcss",
    "clangd",
    "gopls",
    "rust_analyzer",
    "pyright",
    "sumneko_lua",
    "texlab",
  },
})
