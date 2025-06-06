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

-- Markdown snippets =======================================

ls.add_snippets("markdown", {
  s(
    {
      trig = "codeblock",
      name = "markdown codeblock",
      dscr = "Adds code block snippet",
    },
    fmt(
      [=[
        ```{}
        {}
        ```

        {}
      ]=],
      {
        i(1, "Code-lang"),
        i(2, "Past Code here!"),
        i(0),
      }
    )
  ),
})
