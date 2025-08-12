return {
  "pocco81/auto-save.nvim",
  config = function()
    require("auto-save").setup({
      enabled = true,
      execution_message = {
        message = function()
          return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
        end,
        dim = 0.18,
        cleaning_interval = 1250,
      },
      trigger_events = { "InsertLeave", "TextChanged" },
      condition = function(buf)
        local fn = vim.fn
        local utils = require("auto-save.utils.data")

        -- Get the file name and extension
        local filename = fn.expand("%:t")
        local filepath = fn.expand("%:p")
        local filetype = vim.bo[buf].filetype

        -- Only auto-save specific file types
        local allowed_filetypes = {
          "lua",
          "markdown",
        }

        -- Check if current filetype is in allowed list
        if not vim.tbl_contains(allowed_filetypes, filetype) then
          return false
        end

        -- Exclude certain directories
        local excluded_dirs = {
          "node_modules",
          ".git",
          "dist",
          "build",
        }

        for _, dir in ipairs(excluded_dirs) do
          if string.find(filepath, dir) then
            return false
          end
        end

        -- Only save files with extensions
        if filename == "" or not string.find(filename, "%.") then
          return false
        end

        return true and utils.not_in(fn.getbufvar(buf, "&filetype"), {})
      end,
      write_all_buffers = false,
      debounce_delay = 135,
    })
  end,
}
