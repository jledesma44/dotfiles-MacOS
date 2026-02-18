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
vim.keymap.set({ "i", "s" }, "<C-H>", function()
  ls.jump(-1)
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-E>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { silent = true })

--Json snippets =================================
ls.add_snippets("json", {

  s(
    {
      trig = "jsn-init",
      dscr = "json init entry",
    },
    fmt(
      [=[
        [ 
          {{
            "{}": "{}",
            "{}": "{}"
          }}
        ]
      ]=],
      {
        i(1, "name"),
        i(2, "John"),
        i(3, "age"),
        i(4, "32"),
      }
    )
  ),
  s(
    {
      trig = "jtable",
      dscr = "json entry",
    },
    fmt(
      [=[
          {{
            "{}": "{}",
            "{}": "{}"
          }}
      ]=],
      {
        i(1, "name"),
        i(2, "John"),
        i(3, "age"),
        i(4, "32"),
      }
    )
  ),
  s(
    -- JSON key-value pair
    {
      trig = "jkv",
      dscr = "json key value pair",
    },
    fmt(
      [=[
        "{}": "{}",{}
      ]=],
      {
        i(1, "name"),
        i(2, "John"),
        i(0),
      }
    )
  ),
  -- JSON Object
  s("job", {
    t("{"),
    t({ "", "  " }),
    i(1, '"key"'),
    t(": "),
    i(2, '"value"'),
    i(0),
    t({ "", "}" }),
  }),

  -- JSON array
  s("jarr", {
    t("["),
    t({ "", "  " }),
    i(1, '"item"'),
    i(0),
    t({ "", "]" }),
  }),

  -- JSON array of objects
  s("jarrobj", {
    t("["),
    t({ "", "  {" }),
    t({ "", "    " }),
    i(1, '"key"'),
    t(": "),
    i(2, '"value"'),
    t({ "", "  }" }),
    i(0),
    t({ "", "]" }),
  }),

  -- Nested JSON object
  s("jnested", {
    t("{"),
    t({ "", "  " }),
    i(1, '"key"'),
    t(": {"),
    t({ "", "    " }),
    i(2, '"nestedKey"'),
    t(": "),
    i(3, '"value"'),
    i(0),
    t({ "", "  }" }),
    t({ "", "}" }),
  }),
})
