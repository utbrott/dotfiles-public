local status, _ = pcall(require, "nvim-treesitter")
if not status then
  print("treesitter failed")
  return
end

require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "help",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "cpp",
    "lua",
    "rust",
    "go",
    "latex",
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
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
