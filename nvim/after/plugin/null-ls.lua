local ok, null_ls = pcall(require, "null-ls")
if not ok then
  print("null-ls failed")
  return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  })
end

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.eslint_d.with({
      diagnostics_format = "[eslint] #{m}\n(#{c})",
    }),
    null_ls.builtins.formatting.clang_format.with({
      extra_args = { "--style", "{BasedOnStyle: Google, IndentWidth: 4}" },
    }),
    null_ls.builtins.formatting.latexindent.with({
      extra_args = {
        "-y",
        "noAddtionalIndent:document:0;problem:0;defaultIndent:'  ',verbatimEnvironments:cpp:1;python:1",
      },
    }),
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.gofmt,
    null_ls.builtins.formatting.rustfmt,
    null_ls.builtins.formatting.rustywind,
    null_ls.builtins.formatting.stylua.with({
      extra_args = { "--indent-type", "Spaces" },
    }),
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          lsp_formatting(bufnr)
        end,
      })
    end
  end,
})

vim.api.nvim_create_user_command("DisableLspFormatting", function()
  vim.api.nvim_clear_autocmds({ group = augroup, buffer = 0 })
end, { nargs = 0 })