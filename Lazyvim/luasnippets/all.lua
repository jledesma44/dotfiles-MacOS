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

-- All snippets =============================

local date = function()
  return { os.date("%B %d,%Y") }
end

ls.add_snippets(nil, {
  all = {
    -- Date snippet
    s({
      trig = "ddate",
      dscr = "Date in the form of Jan 20, 1995",
    }, {
      f(date, {}),
    }),

    -- Snippet template
    s(
      {
        trig = "luasnip",
        dscr = "lua snippet template",
      },
      fmt(
        [[
        s(
          {{
            trig = "{}",
            name = "{}",
            dscr = "{}",
          }},
          fmt(
            [=[
              {}
            ]=],
            {{
              i(1, "{}"),
            }}
          )
        ),
        ]],
        {
          i(1, "trigger"),
          i(2, "snippet-name"),
          i(3, "snippet-dscr"),
          i(4, "snippet-body"),
          i(5, "insert-1"),
        }
      )
    ),
    s(
      {
        trig = "shebang-gee",
        dscr = " bash shebang snippet",
      },
      fmt(
        [=[
          #!/bin/{}
        ]=],
        {
          i(1, "bash"),
        }
      )
    ),
    s(
      {
        trig = "shebang-env",
        dscr = "bash shebang env snippet",
      },
      fmt(
        [=[
          #!/usr/bin/env {}
        ]=],
        {
          i(1, "zsh"),
        }
      )
    ),
  },
})
