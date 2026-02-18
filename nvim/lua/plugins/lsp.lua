return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      tsserver = {
        settings = {
          typescript = {
            preferences = {
              importModuleSpecifier = "relative",
            },
          },
        },
      },
    },
    inlay_hints = { enabled = false },
  },
}
