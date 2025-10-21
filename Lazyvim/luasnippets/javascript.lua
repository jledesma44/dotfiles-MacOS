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

--Javascript snippets =================================
ls.add_snippets("javascript", {

  -- console.log
  s(
    {
      trig = "clg",
      dscr = "console log",
    },
    fmt(
      [=[
        console.log({});{}
      ]=],
      {
        i(1, "'test'"),
        i(0),
      }
    )
  ),
  s(
    {
      trig = "invar",
      dscr = "variable input",
    },
    fmt(
      [=[
        ${{{}}}
      ]=],
      {
        i(1, "name"),
      }
    )
  ),
  --Initiate Variable
  s(
    {
      trig = "var",
      dscr = "Initiate a javascript variable",
    },
    fmt(
      [=[
        {} {} = {};
      ]=],
      {
        c(1, {
          t("var"),
          t("const"),
          t("let"),
        }),
        i(2, "x"),
        i(3, "5"),
      }
    )
  ),
  s(
    {
      trig = "func",
      dscr = "javacript function",
    },
    fmt(
      [=[
        function {}({}) {{
          {};
        }}

        {}({});{}

      ]=],
      {
        i(1, "funcName"),
        i(2, "param"),
        i(3, "funcBody"),
        rep(1),
        i(4, "argum"),
        i(0),
      }
    )
  ),
  s(
    {
      trig = "arrow",
      dscr = "converts regular expression to arrow function",
    },
    fmt(
      [=[
      {} {} = ({}) => {{
       return {};
      }};{} 
    ]=],
      {
        i(1, "const"),
        i(2, "calArea"),
        i(3, "radius"),
        i(4, "3.14 * radius**2"),
        i(0),
      }
    )
  ),
  s(
    {
      trig = "qs",
      dscr = "query selector",
    },
    fmt(
      [=[
        {} {} = document.querySelector({});{}
      ]=],
      {
        i(1, "const"),
        i(2, "para"),
        i(3, "'p'"),
        i(0),
      }
    )
  ),
  s(
    {
      trig = "qsa",
      dscr = "query selector all",
    },
    fmt(
      [=[
        {} {} = document.querySelectorAll({});{}
      ]=],
      {
        i(1, "const"),
        i(2, "para"),
        i(3, "'p'"),
        i(0),
      }
    )
  ),
  s(
    {
      trig = "object",
      dscr = "javascript object snippet",
    },
    fmt(
      [=[
        const {} = {{
          {}: {},
          {}: {},
          {}
        }};
      ]=],

      {
        i(1, "user"),
        i(2, "name"),
        i(3, "'John Doe'"),
        i(4, "age"),
        i(5, "30"),
        i(0),
      }
    )
  ),
  s(
    -- object key-value pair string
    {
      trig = "okvs",
      dscr = "object key value pair (string)",
    },
    fmt(
      [=[
        {}: "{}",{}
      ]=],
      {
        i(1, "name"),
        i(2, "John"),
        i(0),
      }
    )
  ),
  s(
    -- object key-value number/boolean
    {
      trig = "okvn",
      dscr = "object key value pair (number/boolean)",
    },
    fmt(
      [=[
        {}: {},{}
      ]=],
      {
        i(1, "value"),
        i(2, "1"),
        i(0),
      }
    )
  ),
})
