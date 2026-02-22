return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        -- LSPs
        "lua-language-server",
        "emmet-language-server",
        "typescript-language-server",
        "eslint-lsp",
        "json-lsp",
        "marksman",
        "stylua",
        "tailwindcss-language-server",

        -- DAPs
        "js-debug-adapter",

        -- Formatters
        "prettier",
        "shellcheck",
        "shfmt",

        -- Linters
        "eslint_d",
        "flake8",
      },
    },
  },
}
