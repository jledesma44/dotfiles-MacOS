return {
  -- In your plugins/snacks.lua configuration file
  {
    "folke/snacks.nvim",
    opts = {
      explorer = {
        -- Sort options: "name", "size", "mtime"
        sort_by = "mtime", -- Sort by modification time (newest top)
        reverse = true, -- Reverse to make it descending (if needed)
      },
    },
  },
}
