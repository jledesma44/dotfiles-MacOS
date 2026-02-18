return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "javascript",
      "typescript",
      "tsx",
      "jsx",
      "json",
      "css",
      "html",
    },
    vim.filetype.add({
      extension = {
        kit = function(path, bufnr)
          return "html"
        end,
      },
    }),
  },
}
