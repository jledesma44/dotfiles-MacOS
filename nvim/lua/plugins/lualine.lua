return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    local function word_count()
      if vim.bo.filetype ~= "markdown" then
        return ""
      end
      local wc = vim.fn.wordcount()
      if wc.visual_words then
        return " " .. wc.visual_words .. " words " .. wc.visual_chars .. " characters"
      end
      return " " .. wc.words .. " words " .. wc.chars .. " characters"
    end

    -- Add word count to lualine_c (left side)
    table.insert(opts.sections.lualine_c, {
      word_count,
      color = { fg = "#a0a8b8" },
    })

    -- Add location (line:col) to lualine_y if not already present
    local has_location = false
    for _, comp in ipairs(opts.sections.lualine_y or {}) do
      if comp == "location" or (type(comp) == "table" and comp[1] == "location") then
        has_location = true
        break
      end
    end
    if not has_location then
      table.insert(opts.sections.lualine_y, { "location" })
    end

    return opts
  end,
}
