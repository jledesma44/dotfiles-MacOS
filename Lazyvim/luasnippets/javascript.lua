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

--Javascript snippets =================================
ls.add_snippets("javascript", {

  -- Variable snippet -

  s("var", {
    t("${"),
    i(1),
    t("}"),
  }),

  -- Variable insert
  s(
    {
      trig = "invar",
      name = "variable",
      dscr = "variable snippet",
    },
    fmt(
      [=[
        ${{{}}}{}
      ]=],
      {
        i(1, "'name'"),
        i(0),
      }
    )
  ),

  -- console.log
  s(
    {
      trig = "clg",
      name = "console.log",
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

  -- Let Varibale
  s(
    {
      trig = "let",
      name = "let",
      dscr = "js let variable",
    },
    fmt(
      [=[
        let {} = {};
      ]=],
      {
        i(1, "x"),
        i(2, "5"),
      }
    )
  ),

  -- Const Variable
  s(
    {
      trig = "const",
      name = "constant",
      dscr = "js constant variable",
    },
    fmt(
      [=[
        const {} = {};
      ]=],
      {
        i(1, "y"),
        i(2, "9"),
      }
    )
  ),
  s(
    {
      trig = "as",
      name = "arrow function simple",
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
      name = "querySelector",
      dscr = "1uery selector",
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
      name = "querySelectorAll",
      dscr = "1uery selector all",
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
})
