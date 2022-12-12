local ok, nvim_lsp = pcall(require, "lspconfig")
if not ok then
  print("lspconfig failed")
  return
end

-- Format on save
local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })
local enable_format_on_save = function(_, bufnr)
  vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup_format,
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format({ bufnr = bufnr })
    end,
  })
end

-- Use on_attach function to only map listed keys
-- after the language server attaches to current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  -- Mappings
  local opts = { noremap = true, silent = true }
  -- See `:help vim.lsp.* for documentation
  buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
end

-- Set up completion using nvim_cmp with LSP source
local capabilities = require("cmp_nvim_lsp").default_capabilities()

nvim_lsp.tsserver.setup({
  on_attach = on_attach,
  filetypes = { "typescript", "typesciptreact", "typescript.tsx" },
  capabilities = capabilities,
})

nvim_lsp.clangd.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

nvim_lsp.sumneko_lua.setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    enable_format_on_save(client, bufnr)
  end,
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize `vim` global
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
    },
  },
})

nvim_lsp.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

nvim_lsp.gopls.setup({
  on_attach = on_attach,
  cmd = { "gopls", "serve" },
  settings = {
    gopls = {
      analyses = { unusedparams = true },
      staticcheck = true,
    },
  },
  capabilities = capabilities,
})

nvim_lsp.rust_analyzer.setup({
  on_attach = on_attach,
  cmd = { "rustup", "rust-analyzer" },
  settings = {
    rust = {
      unstable_features = true,
      build_on_save = false,
      all_features = true,
    },
  },
  capabilities = capabilities,
})

nvim_lsp.tailwindcss.setup({
  on_attach = on_attach,
  settings = {
    tailwindCSS = {
      experimental = {
        classRegex = [["cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]"]],
      },
    },
  },
  capabilities = capabilities,
})

nvim_lsp.cssls.setup = {
  on_attach = on_attach,
  capabilities = capabilities,
}

nvim_lsp.cssmodules_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

nvim_lsp.texlab.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

nvim_lsp.astro.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  update_in_insert = false,
  virtual_text = { spacing = 4, prefix = "ﱢ" },
  severity_sort = true,
})

-- Diagnostics symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Info = " ", Hint = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
  virtual_text = {
    prefix = "ﱢ",
  },
  update_in_insert = true,
  float = {
    source = "always", -- Or "if_many"
  },
})
