local ok, lspkind = pcall(require, "lspkind")
if not ok then
  return
end

lspkind.init({
  mode = "symbol",
  -- default symbol map
  -- can be either 'default' (requires nerd-fonts font) or
  -- 'codicons' for codicon preset (requires vscode-codicons font)
  -- default: 'default'
  preset = "codicons",
  -- override preset symbols
  symbol_map = {
    Text = " ",
    Method = " ",
    Function = "ƒ ",
    Constructor = " ",
    Field = "ﰠ ",
    Variable = " ",
    Class = "ﴯ ",
    Interface = " ",
    Module = " ",
    Property = " ﰠ",
    Unit = "塞 ",
    Value = " ",
    Enum = " ",
    Keyword = " ",
    Snippet = " ",
    Color = " ",
    File = " ",
    Reference = " ",
    Folder = " ",
    EnumMember = " ",
    Constant = " ",
    Struct = "פּ ",
    Event = " ",
    Operator = " ",
    TypeParameter = " ",
  },
})
