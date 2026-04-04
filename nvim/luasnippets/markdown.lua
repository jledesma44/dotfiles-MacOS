local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
--local n = ls.snippet_node
--local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
--local c = ls.choice_node
--local d = ls.dynamic_node

--local extras = require("luasnip.extras")
--local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt

-- Keymap for insert and selections of snippets

vim.keymap.set({ "i" }, "<C-K>", function()
  ls.expand()
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-L>", function()
  ls.jump(1)
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-H>", function()
  ls.jump(-1)
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-E>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { silent = true })

-- Markdown snippets =======================================
local date = function()
  return { os.date("%B %d,%Y") }
end

local date_iso = function()
  return { os.date("%Y-%m-%d") }
end

ls.add_snippets("markdown", {
  s({
    trig = "ddate",
    dscr = "Date in the form of Jan 20, 1995",
  }, {
    f(date, {}),
  }),
  s(
    {
      trig = "codeblock",
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

  s(
    {
      trig = "fm",
      dscr = "front matter markdown",
    },
    fmt(
      [=[
        ---
        title: {}
        author: {}
        date: {}
        description: {}
        layout: {}
        ---
      ]=],
      {
        i(1, '"My blog post title"'),
        i(2, '"Jaime Ledesma"'),
        f(date_iso, {}),
        i(3, '"Description of this post"'),
        i(4, '"../../layouts/bloglayout.astro"'),
      }
    )
  ),
})
