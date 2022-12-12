local status, _ = pcall(require, "nvim-treesitter")
if not status then
  print("treesitter failed")
  return
end

require("nvim-treesitter.configs").setup({
  ensure_installed = "all",
  sync_install = false,
  highlight = {
    enable = true,
    disable = { "latex" },
    additional_vim_regex_highlighting = { "latex" },
  },
  indent = { enable = true },
  autotag = { enable = true },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
