local status, lualine = pcall(require, "lualine")
if not status then return end

local conditions = {
  buffer_not_empty = function() return vim.fn.empty(vim.fn.expand("%:t")) ~= 1 end,
  hide_in_width = function() return vim.fn.winwidth(0) > 80 end,
}

local branch = {
  "branch",
  icon = "",
}

local diff = {
  "diff",
  symbols = { added = "+", modified = "~", removed = "-" },
  cond = conditions.hide_in_width,
}

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  symbols = { error = " ", warn = " " },
  padding = 0,
}

local filetype = {
  "filetype",
  icon_only = true,
  padding = { left = 1, right = 0 },
  separator = { right = "" },
}

local filename = {
  "filename",
  file_status = true, -- displays file status
  path = 0, -- just filename
}

lualine.setup({
  options = {
    icons_enabled = true,
    theme = "auto",
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
    globalStatus = true,
  },
  -- | A | B | C |        | X | Y | Z | --
  sections = {
    lualine_a = { "mode" },
    lualine_b = { branch },
    lualine_c = { filetype, filename, diagnostics },
    lualine_x = { diff },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { filename },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  extensions = { "fugitive", "nvim-tree" },
})
