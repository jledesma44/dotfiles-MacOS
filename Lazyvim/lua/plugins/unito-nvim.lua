return {
  {
    "axelvc/unito.nvim",
    config = function()
      require("unito").setup({
        rem = 16, -- rem value used for conversions
        max_decimals = 4, -- max decimal for floating values
      })
    end,
  },
}
