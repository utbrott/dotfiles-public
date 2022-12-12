local ok, indent = pcall(require, "indent-blanklines")
if not ok then
  return
end

indent.setup({
  buftype_exclude = { "terminal", "nofile" },
  filetype_exclude = {
    "help",
    "packer",
    "NvimTree",
    "Trouble",
  },
  char = "│",
  use_treesitter_scope = false,
  show_trailing_blankline_indent = false,
  show_current_context = true,
  context_patterns = {
    "class",
    "return",
    "function",
    "method",
    "^if",
    "^while",
    "jsx_element",
    "^for",
    "^object",
    "^table",
    "block",
    "arguments",
    "if_statements",
    "else_clause",
    "jsx_self_closing_element",
    "try_statements",
    "catch_clause",
    "import_statements",
    "operation_type",
  },
})
