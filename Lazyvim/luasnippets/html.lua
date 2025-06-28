local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local n = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node

local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt

-- Keymap for insert and selections of snippets

vim.keymap.set({ "i" }, "<C-K>", function()
  ls.expand()
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-L>", function()
  ls.jump(1)
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-J>", function()
  ls.jump(-1)
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-E>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { silent = true })

--Html snippets ==========================================
--
ls.add_snippets("html", {

  --container snippet
  s(
    {
      trig = "font-link",
      name = ".google font link",
      dscr = "link to google fonts",
    },
    fmt(
      [[
      <link
         href='https://fonts.googleapis.com/css2?family={}:wght@200;300;400;500;600;700;800;900&family={}:wght@200;300;400;500;600;700;800;900&display=swap'
         rel='stylesheet'
      />
    ]],
      {
        i(1, "Ralway"),
        i(2, "Poppins"),
      }
    )
  ),
})
