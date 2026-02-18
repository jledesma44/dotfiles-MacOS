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

--Html snippets ==========================================
--
ls.add_snippets("html", {

  --container snippet
  s(
    {
      trig = "g-font",
      dscr = "html link to google fonts",
    },
    fmt(
      [[
      <link
         href='https://fonts.googleapis.com/css2?family={}:wght@200;300;400;500;600;700;800;900&family={}:wght@200;300;400;500;600;700;800;900&display=swap'
         rel='stylesheet'
      />
    ]],
      {
        i(1, "Ralway"),
        i(2, "Poppins"),
      }
    )
  ),
  s(
    {
      trig = "fa-link",
      dscr = "cdn link to font awesome",
    },
    fmt(
      [[
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" 
        integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" 
        crossorigin="anonymous" referrerpolicy="no-referrer" />
      ]],
      {}
    )
  ),
  s(
    {
      trig = "fa",
      dscr = "font-awesome icon snippet solid",
    },
    fmt(
      [[
        <i class="fa-{} fa-{}"></i>
      ]],
      {
        c(1, { t("solid"), t("regular"), t("light"), t("thin") }),
        c(2, { t("bars"), t("envelope"), t("calendar"), t("user"), t("house"), t("file") }),
      }
    )
  ),
  s(
    {
      trig = "fa-brands",
      dscr = "font-awesome icon snippet brands",
    },
    fmt(
      [[
        <i class="fa-{} fa-{}"></i>
      ]],
      {
        i(1, "brands"),
        c(2, {
          t("facebook"),
          t("instagram"),
          t("youtube"),
          t("x-twitter"),
          t("linkedin"),
          t("github"),
          t("facebook-messanger"),
          t("discord"),
          t("slack"),
        }),
      }
    )
  ),
})
