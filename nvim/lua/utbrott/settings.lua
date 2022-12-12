local opt = vim.opt
local indent = 2
vim.cmd("autocmd!")

vim.g.mapleader = " "
vim.g.localmapleader = ","
opt.clipboard:prepend({ "unnamed", "unnamedplus" }) -- Enable system clipboard
opt.confirm = true -- Confirm to save chages before leaving modified buffer
opt.mouse = "a" -- Enable mouse in all modes
opt.number = true -- Enable line numbers
opt.relativenumber = true -- Relative line numbers
opt.signcolumn = "yes" -- Always show sign column
opt.scrolloff = 8 -- Lines of  context
opt.sidescrolloff = 8 -- Columns of context

-- Indents
opt.shiftwidth = indent -- Size of indent
opt.expandtab = true -- Use spaces instead of tab
opt.tabstop = indent -- Spaces tab counts for
opt.shiftround = true
opt.smartindent = true
opt.autoindent = true
opt.wrap = false -- Disable line wrap

-- Search settings
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- More space for messages
opt.cmdheight = 1
opt.laststatus = 2

-- Window splitting
opt.splitbelow = true
opt.splitright = true

-- Other
opt.updatetime = 200 -- Shorter update time (base 2000ms)
opt.swapfile = false -- Dont use swapfile
opt.backup = false -- Dont do backups
opt.conceallevel = 0 -- Shows `` in Markdown
opt.backspace = { "start", "eol", "indent" }
opt.path:append({ "**" }) -- Finding files, search down into subdirs
opt.wildignore:append({ "*/node_modules/*" })
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.completeopt = "menu,menuone,noselect"
opt.formatoptions:append({ "r" })

-- Highlights
opt.cursorline = true
opt.termguicolors = true
opt.winblend = 0
opt.wildoptions = "pum"
opt.pumblend = 10
opt.background = "dark"

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode on Insert mode leave
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

-- Use proper syntax highlighting in code blocks
local fences = {
  "lua",
  -- "vim",
  "json",
  "typescript",
  "javascript",
  "js=javascript",
  "ts=typescript",
  "shell=sh",
  "python",
  "sh",
  "console=sh",
}
vim.g.markdown_fenced_languages = fences
vim.g.markdown_recommended_style = 0

-- Don't load the plugins below
local builtins = {
  "gzip",
  "zip",
  "zipPlugin",
  "fzf",
  "tar",
  "tarPlugin",
  "getscript",
  "getscriptPlugin",
  "vimball",
  "vimballPlugin",
  "2html_plugin",
  "matchit",
  "matchparen",
  "logiPat",
  "rrhelper",
}

for _, plugin in ipairs(builtins) do
  vim.g["loaded_" .. plugin] = 1
end
