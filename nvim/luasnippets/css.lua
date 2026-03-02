local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
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

--Css snippets ===================================================

ls.add_snippets("css", {

  --container snippet
  s(
    {
      trig = "cont",
      dscr = "css container class",
    },
    fmt(
      [[
      .container {{
        max-width: {};
        padding-inline: {};
        margin-inline: {};
      }}
    ]],
      {
        i(1, "1400px"),
        i(2, "40px"),
        i(3, "auto"),
      }
    )
  ),

  --Media Query min-width
  s(
    {
      trig = "mqmin",
      dscr = "media-query min-width",
    },
    fmt(
      [[
      @media (min-width: {}) {{
        {} {{
          {}: {};
        }}
      }}    

    ]],
      {
        i(1, "375px"),
        i(2, ".hero"),
        i(3, "background"),
        i(4, "#333"),
      }
    )
  ),

  --Media Query max-width
  s(
    {
      trig = "mqmax",
      dscr = "media-query max-width",
    },
    fmt(
      [[
      @media (max-width: {}) {{
        {} {{
          {}: {};
        }}
      }}

    ]],
      {
        i(1, "700px"),
        i(2, ".hero"),
        i(3, "background"),
        i(4, "#333"),
      }
    )
  ),

  --Box shadow
  s(
    {
      trig = "boxsh",
      dscr = "css box-shadow",
    },
    fmt(
      [[ 
    box-shadow: {}px {}px {}px {} {};
    ]],
      {
        i(1, "10"),
        i(2, "10"),
        i(3, "10"),
        c(4, {
          sn(nil, { i(1, "10"), t("px") }),
          t(""),
        }),
        c(5, {
          sn(nil, { t("rgba("), i(1, "0"), t(","), i(2, "0"), t(","), i(3, "0"), t(", 0."), i(4, "5"), t(")") }),
          sn(nil, { t("#"), i(1, "ffffff") }),
          sn(nil, { t("hsl("), i(1, "0"), t(" "), i(2, "0"), t("% "), i(3, "100"), t("% / "), i(4, "0.5"), t(")") }),
        }),
      }
    )
  ),

  --Text shadow
  s(
    {
      trig = "textsh",
      dscr = "css text-shadow",
    },
    fmt(
      [[ 
    text-shadow: {}px {}px {} {};
    ]],
      {
        i(1, "10"),
        i(2, "10"),
        c(3, {
          sn(nil, { i(1, "10"), t("px") }),
          t(""),
        }),
        c(4, {
          sn(nil, { t("rgba("), i(1, "0"), t(","), i(2, "0"), t(","), i(3, "0"), t(", 0."), i(4, "5"), t(")") }),
          sn(nil, { t("#"), i(1, "ffffff") }),
          sn(nil, { t("hsl("), i(1, "0"), t(" "), i(2, "0"), t("% "), i(3, "100"), t("% / "), i(4, "0.5"), t(")") }),
        }),
      }
    )
  ),

  --Transparent button
  s(
    {
      trig = "btn-trans",
      dscr = "button with transparent background",
    },
    fmt(
      [[ 
      {} {{
        padding: {}px {}px;
        border-radius: {}px;
        border: 1px solid {};
      }} 
    ]],
      {
        i(1, ".btn-transparent"),
        i(2, "12"),
        i(3, "22"),
        i(4, "15"),
        c(5, {
          sn(nil, { t("rgba("), i(1, "0"), t(","), i(2, "0"), t(","), i(3, "0"), t(", 0."), i(4, "5"), t(")") }),
          sn(nil, { t("#"), i(1, "ffffff") }),
          sn(nil, { t("hsl("), i(1, "0"), t(" "), i(2, "0"), t("% "), i(3, "100"), t("% / "), i(4, "0.5"), t(")") }),
          sn(nil, { t("var(--"), i(1, "primary-color"), t(")") }),
        }),
      }
    )
  ),

  --Solid button
  s(
    {
      trig = "btn-solid",
      dscr = "button with solid color background",
    },
    fmt(
      [[ 
      {} {{
        padding: {}px {}px;
        border-radius: {}px;
        background: {}; 
        color: {};
      }} 
    ]],
      {
        i(1, ".btn-solid"),
        i(2, "12"),
        i(3, "22"),
        i(4, "15"),
        c(5, {
          sn(nil, { t("rgba("), i(1, "0"), t(","), i(2, "0"), t(","), i(3, "0"), t(", 0."), i(4, "5"), t(")") }),
          sn(nil, { t("#"), i(1, "ffffff") }),
          sn(nil, { t("hsl("), i(1, "0"), t(" "), i(2, "0"), t("% "), i(3, "100"), t("% / "), i(4, "0.5"), t(")") }),
          sn(nil, { t("var(--"), i(1, "primary-color"), t(")") }),
        }),
        c(6, {
          sn(nil, { t("rgba("), i(1, "0"), t(","), i(2, "0"), t(","), i(3, "0"), t(", 0."), i(4, "5"), t(")") }),
          sn(nil, { t("#"), i(1, "ffffff") }),
          sn(nil, { t("hsl("), i(1, "0"), t(" "), i(2, "0"), t("% "), i(3, "100"), t("% / "), i(4, "0.5"), t(")") }),
          sn(nil, { t("var(--"), i(1, "primary-color"), t(")") }),
        }),
      }
    )
  ),

  --Linear Gradient
  s(
    {
      trig = "lin-grad",
      dscr = "css linear-gradient background",
    },
    fmt(
      [[ 
      .{} {{
        background-image: linear-gradient(to right, {}, {});
        color: {};
      }}
    ]],
      {
        i(1, "card"),
        i(2, "#ed7cda"),
        i(3, "#ffaa1b"),
        i(4, "white"),
      }
    )
  ),

  --Css reset
  s(
    {
      trig = "reset",
      dscr = "css reset values",
    },
    fmt(
      [[ 
      *,
      *::before,
      *::after {{
        box-sizing: border-box;
        margin: 0;
        padding: 0;
      }}
      
      
      /* Remove list styles on ul, ol elements with a list role, which suggests default styling will be removed */
      ul[role='list'],
      ol[role='list'] {{
        list-style: none;
      }}
      
      /* Set core root defaults */
      html:focus-within {{
        scroll-behavior: smooth;
      }}
      html,
      body {{
        height: 100%;
      }}
      /* Set core body defaults */
      body {{
        text-rendering: optimizeSpeed;
        line-height: 1.5;
      }}
      
      /* Make images easier to work with */
      img,
      picture,
      svg {{
        max-width: 100%;
        display: block;
      }}
      
      /* Remove all animations, transitions and smooth scroll for people that prefer not to see them */
      
      @media (prefers-reduced-motion: reduce) {{
        html:focus-within {{
          scroll-behavior: auto;
         }}
      }}
      
        *,
        *::before,
        *::after {{
          animation-duration: 0.01ms !important;
          animation-iteration-count: 1 !important;
          transition-duration: 0.01ms !important;
          scroll-behavior: auto !important;
        }}
      ]],
      {}
    )
  ),

  --Root snippet
  s(
    {
      trig = "root",
      dscr = "css root variables",
    },
    fmt(
      [[ 
       @import url('https://fonts.googleapis.com/css2?family={}:wght@100...900&family={}:wght@100...900&display=swap');

      :root {{
        /*  ========== Colors ================== * */
      
        /*   primary colors */
      
        --{}: #{};
      
        /*   accent colors */
      
        --{}: #{};
    
        /*   neutral colors */
      
        --{}: #{};
      
        /*   ============= Fonts ================  */
      
        /*   font family */
      
        --primary-ff:  '{}', sans-serif;
        --secondary-ff: '{}', sans-serif;
      
        /* font size */
        --fs-nav: {}px;
      
        --fs-btn: {}px;
        --fs-body: {}px;
        --fs-h1: {}px;
        --fs-h2: {}px;
        --fs-h3: {}px;
      
        /*  ============== Spacing =============== * */
        --sec-pad: 150px 0;
        --mw: 1280px;
        --w: 85%;
        --gap: 2em;
      }}
      
      @media (min-width: 800px) {{
        :root {{
          --fs-nav: {}px;
          --fs-body: {}px;
          --fs-btn: {}px;
          --fs-h1: {}px;
          --fs-h2: {}px;
          --fs-h3: {}px;
        }}
      }}
    
      @media (min-width: 1100px) {{
        :root {{
          --fs-nav: {}px;
          --fs-body: {}px;
          --fs-btn: {}px;
          --fs-h1: {}px;
          --fs-h2: {}px;
          --fs-h3: {}px;
        }}
      }}
    ]],
      {
        i(1, "Frances"),
        i(2, "Manrope"),
        i(3, "dark-grey"),
        i(4, "333"),
        i(5, "eucaplyptus"),
        i(6, "44ffa1"),
        i(7, "ghost-white"),
        i(8, "fcf8ff"),
        rep(1),
        rep(2),
        i(9, "12"),
        i(10, "14"),
        i(11, "14"),
        i(12, "54"),
        i(13, "38"),
        i(14, "18"),
        i(15, "14"),
        i(16, "16"),
        i(17, "16"),
        i(18, "58"),
        i(19, "42"),
        i(20, "24"),
        i(21, "16"),
        i(22, "16"),
        i(23, "16"),
        i(24, "62"),
        i(25, "48"),
        i(26, "28"),
      }
    )
  ),
  s(
    {
      trig = "gfont",
      dscr = "google font @import snippet",
    },
    fmt(
      [[
       @import url('https://fonts.googleapis.com/css2?family={}:wght@100...900{});

       body {{
         font-family: '{}', {};
       }}
      ]],
      {
        i(1, "Poppins"),
        c(2, {
          t("&display=swap'"),
          sn(nil, { t("&family="), i(1, "Manrope"), t(":wght@100...900'") }),
        }),
        rep(1),
        c(3, { t("sans-serif"), t("serif"), t("mono") }),
      }
    )
  ),
})
