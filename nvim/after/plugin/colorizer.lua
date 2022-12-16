local status, colorizer = pcall(require, "colorizer")
if not status then return end

colorizer.setup({
  filetypes = { "*" },
  user_default_options = {
    names = false, -- "Name" codes like `Blue`
    RRGGBBAA = true, -- #RRGGBBAA hex codes
    rgb_fn = true, -- CSS rgb() and rgba() functions
    hsl_fn = true, -- CSS hsl() and hsla() functions
    css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
    tailwind = true,
    mode = "virtualtext", -- Color as virtualtext
    virtualtext = "",
  },
})
