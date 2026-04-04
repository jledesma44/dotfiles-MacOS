return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    local function word_count()
      if vim.bo.filetype ~= "markdown" then
        return ""
      end

      -- In visual mode, fall back to vim's built-in selection counts
      local wc = vim.fn.wordcount()
      if wc.visual_words then
        return " " .. wc.visual_words .. " words " .. wc.visual_chars .. " chars"
      end

      -- Get buffer lines, skipping YAML front matter (--- ... ---)
      local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
      local start_line = 1
      if lines[1] == "---" then
        for i = 2, #lines do
          if lines[i] == "---" or lines[i] == "..." then
            start_line = i + 1
            break
          end
        end
      end

      local words = 0
      local chars = 0
      for i = start_line, #lines do
        local line = lines[i]
        chars = chars + #line
        for _ in line:gmatch("%S+") do
          words = words + 1
        end
      end

      return " " .. words .. " words " .. chars .. " chars"
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
