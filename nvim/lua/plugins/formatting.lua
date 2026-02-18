return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      javascript = { "prettierd", "prettier" },
      javascriptreact = { "prettierd", "prettier" },
      typescript = { "prettierd", "prettier" },
      typescriptreact = { "prettierd", "prettier" },
      json = { "prettierd", "prettier" },
      css = { "prettierd", "prettier" },
      html = { "prettierd", "prettier" },
      kit = { "prettierd", "prettier" },
      sh = { "shfmt" },
      bash = { "shfmt" },
      zsh = { "shfmt" },
      formatters = {
        shfmt = {
          prepend_args = { "-i", "2", "-ci" },
        },
      },
    },
    prettier = {
      prepend_args = {
        "--single-quote",
        "--jsx-single-quote",
      },
    },
  },
}
