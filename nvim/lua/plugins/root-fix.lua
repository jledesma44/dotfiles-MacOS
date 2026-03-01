-- Workaround for LazyVim root detection crashing when cwd or buffer path
-- doesn't exist on disk (ENOENT in vim.fs.find with upward = true).
return {
  "LazyVim/LazyVim",
  opts = function()
    -- Override root_spec to skip pattern detection when the path is missing.
    -- "lsp" and "cwd" are safe; only "pattern" (the middle entry) can ENOENT.
    local LazyVimRoot = require("lazyvim.util.root")
    local original_pattern = LazyVimRoot.detectors.pattern

    LazyVimRoot.detectors.pattern = function(buf, patterns)
      local path = LazyVimRoot.bufpath(buf) or vim.uv.cwd()
      -- Guard: skip detection if the path doesn't exist on disk.
      if not path or not vim.uv.fs_stat(path) then
        return {}
      end
      return original_pattern(buf, patterns)
    end
  end,
}
