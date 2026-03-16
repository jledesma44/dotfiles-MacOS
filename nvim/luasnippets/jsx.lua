local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
--local n = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
--local f = ls.function_node
local c = ls.choice_node
--local d = ls.dynamic_node

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

  --JSX classname
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

  --React Component
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

  --Props
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

  --Props Button
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

  -- JSX Variable
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

  --Import React
  s(
    {
      trig = "imr",
      dscr = "Import React",
    },
    fmt(
      [=[
        import React from 'react';
        {}
      ]=],
      {
        i(0),
      }
    )
  ),

  --Import React Component
  s(
    {
      trig = "imrc",
      dscr = "Import React Component",
    },
    fmt(
      [=[
        import React, {{ Component }} from 'react';
        {}
      ]=],
      {
        i(0),
      }
    )
  ),

  --Import ReactDOM
  s(
    {
      trig = "imrd",
      dscr = "Import ReactDOM",
    },
    fmt(
      [=[
        import ReactDOM from 'react-dom';
        {}
      ]=],
      {
        i(0),
      }
    )
  ),

  --Import React, {useState}
  s(
    {
      trig = "imrs",
      dscr = "Import react userstate",
    },
    fmt(
      [=[
        import react, {{ usestate }} from 'react';
        {}
      ]=],
      {
        i(0),
      }
    )
  ),

  --Import React, {useState, useEffect}
  s(
    {
      trig = "imrse",
      dscr = "Import React useState useEffect",
    },
    fmt(
      [=[
        import react, {{ useState, useEffect }} from 'react';
        {}
      ]=],
      {
        i(0),
      }
    )
  ),

  --Import PropTypes
  s(
    {
      trig = "impt",
      dscr = "Import PropTypes",
    },
    fmt(
      [=[
        import PropTypes from 'prop-types';
        {}
      ]=],
      {
        i(0),
      }
    )
  ),

  --Import Pure Component
  s(
    {
      trig = "impc",
      dscr = "Import React PureComponent",
    },
    fmt(
      [=[
        import React, {{ PureComponent }} from 'react';
        {}
      ]=],
      {
        i(0),
      }
    )
  ),

  --Class Component
  s(
    {
      trig = "cc",
      dscr = "Class Component",
    },
    fmt(
      [=[
        
        class {} extends Component {{
         state = {{ {} }} 
         render() {{ 
           return {};
         }}
       }}
      
       export default {};
      ]=],
      {
        i(1, ""),
        i(2, ""),
        i(0, ""),
        rep(1),
      }
    )
  ),

  --Class Pure Component
  s(
    {
      trig = "cpc",
      dscr = "Class Pure Component",
    },
    fmt(
      [=[
        
        class {} extends PureComponent {{
         state = {{ {} }} 
         render() {{ 
           return {};
         }}
       }}
      
       export default {};
      ]=],
      {
        i(1, ""),
        i(2, ""),
        i(0, ""),
        rep(1),
      }
    )
  ),

  --Class Component with constructor
  s(
    {
      trig = "ccc",
      dscr = "Class Component with constructor",
    },
    fmt(
      [=[
        
        class {} extends Component {{
         constructor(props) {{
           super(props);
         }}
         state = {{ {} }} 
         render() {{ 
           return {};
         }}
       }}
      
       export default {};
      ]=],
      {
        i(1, ""),
        i(2, ""),
        i(0, ""),
        rep(1),
      }
    )
  ),
})
