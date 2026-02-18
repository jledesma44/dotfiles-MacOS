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

--JSX snippets ==========================================
--
ls.add_snippets("javascriptreact", {
  s(
    {

      trig = "cn",
      dscr = "JSX className",
    },
    fmt(
      [[
        className="{}"
      ]],
      {
        i(1, "container"),
      }
    )
  ),
  s(
    {
      trig = "comp",
      dscr = "react component snippet",
    },
    fmt(
      [[
        function {}() {{
          return {}
        }}


        export default {};
      ]],
      {
        i(1, "greeting"),
        i(2, "<h1>Hello</h1>"),
        rep(1),
      }
    )
  ),
  s(
    {
      trig = "props",
      dscr = "react property snippet",
    },
    fmt(
      [[
        function {}(props) {{
          return {}
        }}


        export default {};
      ]],
      {
        i(1, "greeting"),
        i(2, "<h1>Hello,{props.name}!</h1>"),
        rep(1),
      }
    )
  ),
  s(
    {
      trig = "props-btn",
      dscr = "react property button snippet",
    },
    fmt(
      [[
        function {}(props) {{
          return <button onClick={{props.handleClick}}>{}</button>
        }}


        export default {};
      ]],
      {
        i(1, "Button"),
        i(2, "Click Me"),
        rep(1),
      }
    )
  ),
  s(
    {
      trig = "var",
      dscr = "jsx variable",
    },
    fmt(
      [=[
        {} {} = {};
      ]=],
      {
        c(1, { t("const"), t("let"), t("var") }),
        i(2, "y"),
        i(3, "9"),
      }
    )
  ),
})
