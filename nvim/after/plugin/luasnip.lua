local ok, luasnip = pcall(require, "luasnip")
if not ok then
  return
end

local types = require("luasnip.util.types")

-- Load in snippets
require("luasnip.loaders.from_lua").load({
  paths = vim.fn["stdpath"]("config") .. "/luasnipets",
})

luasnip.config.set_config({
  update_events = "TextChanged,TextChangedI",
  enable_autosnippets = true,
  store_selection_keys = "<Tab>",
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { "< Choice" } },
      },
    },
  },
})
