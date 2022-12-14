local _, lsp = pcall(require, "lsp-zero")
local _, cmp = pcall(require, "cmp")
local _, lspkind = pcall(require, "lspkind")

local map = vim.keymap.set

lsp.preset("recommended")

lsp.ensure_installed({
  "tsserver",
  "eslint",
  "cssls",
  "cssmodules_ls",
  "sumneko_lua",
  "clangd",
  "gopls",
  "rust_analyzer",
  "texlab",
  "pyright",
  "tailwindcss",
})

local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
  ["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
  ["<C-y>"] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

lsp.set_preferences({
  sign_icons = {
    error = "",
    warn = "",
    info = "",
    hint = "",
  },
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings,
  formatting = {
    fields = { "kind", "abbr" },
    format = lspkind.cmp_format({
      mode = "symbol",
      ellipsis_char = "...",
    })
  }
})

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }
  map("n", "gd", vim.lsp.buf.definition, opts)
  map("n", "gD", vim.lsp.buf.declaration, opts)
  map("n", "K", vim.lsp.buf.hover, opts)
  map("n", "<leader>vs", vim.lsp.buf.workspace_symbol, opts)
  map("n", "<leader>dj", vim.diagnostic.goto_next, opts)
  map("n", "<leader>dk", vim.diagnostic.goto_prev, opts)
  map("n", "<leader>dl", require("telescope.builtin").diagnostics, opts)
  map("n", "<leader>c", vim.lsp.buf.code_action, opts)
  map("n", "<leader>vr", vim.lsp.buf.references, opts)
  map("n", "<leader>r", vim.lsp.buf.rename, opts)
  map("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

lsp.configure("sumneko_lua", {
  settings = {
    Lua = {
      diagnostics = {
        -- Register `vim` global with LSP
        globals = { "vim" },
      },
      workspace = {
        -- Make LSP aware of Neovim's runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      }
    }
  }
})

lsp.configure("gopls", {
  settings = {
    gopls = {
      analyses = { unusedparams = true },
      staticcheck = true,
    }
  }
})

vim.diagnostic.config({
  virtual_text = { prefix = "" },
  update_in_insert = false,
  signs = true,
  severity_sort = true,
  float = true,
})

lsp.setup()
