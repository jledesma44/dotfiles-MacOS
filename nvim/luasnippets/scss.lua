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

--Scss snippets ===================================================

ls.add_snippets("scss", {

  --container snippet
  s(
    "container",
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
    "mqmin",
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
    "mqmax",
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
    "box-shadow",
    fmt(
      [[ 
      {} {{
      "  box-shadow: {}px {}px {}px {}px rgba(0, 0, 0, {});
      }} 
    ]],
      {
        i(1, ".card"),
        i(2, "0"),
        i(3, "10"),
        i(4, "40"),
        i(5, "0"),
        i(6, "0.25"),
      }
    )
  ),

  --Transparent button
  s(
    "trans-btn",
    fmt(
      [[ 
      .btn {{
        padding: {}px {}px;
        border-radius: {}px;
        border: 1px solid var({});
      }} 
    ]],
      {
        i(1, "12"),
        i(2, "22"),
        i(3, "15"),
        i(4, "--medium-gray"),
      }
    )
  ),

  --Solid button
  s(
    "solid-btn",
    fmt(
      [[ 
      .btn {{
        padding: {}px {}px;
        border-radius: {}px;
        background: {}; 
        color: {};
      }} 
    ]],
      {
        i(1, "12"),
        i(2, "22"),
        i(3, "15"),
        i(4, "steelblue"),
        i(5, "white"),
      }
    )
  ),

  --Linear Gradient
  s(
    "linear-grad",
    fmt(
      [[ 
      .card {{
        background-image: linear-gradient(to right, {}, {});
        color: {};
      }}
    ]],
      {
        i(1, "#ed7cda"),
        i(2, "#ffaa1b"),
        i(3, "white"),
      }
    )
  ),

  --Css reset
  s(
    "reset",
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
    "root",
    fmt(
      [[ 
       @import url('https://fonts.googleapis.com/css2?family={}:wght@200,300,400,500,600,700,800,900&family={}:wght@200,300,400,500,600,700,800,900&display=swap');

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
      
        --fs-btn: 16px;
        --fs-body: 16px;
        --fs-h1: 50px;
        --fs-h2: 32px;
        --fs-h3: 28px;
      
        /*  ============== Spacing =============== * */
        --sec-pad: 150px 0;
        --mw: 1280px;
        --w: 85%;
        --gap: 2em;
      }}
      
      @media (min-width: 800px) {{
        :root {{
          --fs-nav: 16px;
          --fs-body: 16px;
          --fs-btn: 16px;
          --fs-h1: 60px;
          --fs-h2: 48px;
          --fs-h3: 28px;
        }}
      }}
    
      @media (min-width: 1100px) {{
        :root {{
          --fs-nav: 18px;
          --fs-body: 18px;
          --fs-btn: 18px;
          --fs-h1: 80px;
          --fs-h2: 56px;
          --fs-h3: 32px;
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
        i(9, "16"),
      }
    )
  ),
})
