return {
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("obsidian").setup({
        workspaces = {
          {
            name = "Devstack44",
            path = "/Users/jaimeledesma/library/Mobile Documents/iCloud~md~obsidian/Documents/Devstack44",
          },
        },
        notes_subdir = "inbox",
        new_notes_location = "notes_subdir",

        disable_frontmatter = true,
        templates = {
          subdir = "templates",
          date_format = "%Y-%m-%d",
          time_format = "%H:%M:%S",
        },

        -- name new notes starting the ISO datetime and ending with note name
        -- put them in the inbox subdir
        -- note_id_func = function(title)
        --   local suffix = ""
        --   -- get current ISO datetime with -5 hour offset from UTC for EST
        --   local current_datetime = os.date("!%Y-%m-%d-%H%M%S", os.time() - 5*3600)
        --   if title ~= nil then
        --     suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        --   else
        --     for _ = 1, 4 do
        --       suffix = suffix .. string.char(math.random(65, 90))
        --     end
        --   end
        --   return current_datetime .. "_" .. suffix
        -- end,

        -- key mappings, below are the defaults
        mappings = {
          -- overrides the 'gj' mapping to work on markdown/wiki links within your vault
          ["gj"] = {
            action = function()
              return require("obsidian").util.gf_passthrough()
            end,
            opts = { noremap = false, expr = true, buffer = true },
          },
          -- toggle check-boxes
          ["<leader>ti"] = {
            action = function()
              return require("obsidian").util.toggle_checkbox()
            end,
            opts = { buffer = true },
          },
        },
        completion = {
          nvim_cmp = true,
          min_chars = 2,
        },
        ui = {
          -- Disable some things below here because I set these manually for all Markdown files using treesitter
          checkboxes = {},
          bullets = {},
        },
      })
    end,
  },
}
