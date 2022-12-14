local ok, lualine = pcall(require, "lualine")
if not ok then
    print("lualine failed")
    return
end

lualine.setup({
    options = {
        icons_enabled = true,
        theme = "auto",
        section_separators = { left = "", right = "" },
        component_separators = { left = "│", right = "│" },
        globalstatus = true,
    },
    -- | A | B | C |        | X | Y | Z | --
    sections = {
        lualine_a = { "mode" },
        lualine_b = {
            "branch",
            {
                "diff",
                symbols = { added = "+", modified = "~", removed = "-" },
            },
        },
        lualine_c = {
            {
                "filetype",
                icon_only = true,
                padding = { left = 1, right = 0 },
                separator = { right = "" },
            },
            {
                "filename",
                file_status = true, -- displays file status
                path = 0, -- just filename
            },
        },
        lualine_x = {
            {
                "diagnostics",
                sources = { "nvim_diagnostic" },
                symbols = {
                    error = " ",
                    warn = " ",
                    info = " ",
                    hint = " ",
                },
            },
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
            {
                "filename",
                file_status = true, -- displays file status
                path = 0, -- just filename
            },
        },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
    extensions = { "fugitive" },
})
