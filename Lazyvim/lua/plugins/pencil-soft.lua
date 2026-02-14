return {
  { "preservim/vim-pencil" },
  ft = { "html" }, -- This ensures the plugin is loaded for html files
  config = function()
    -- Autocommand to run PencilSoft specifically for html file types
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "html",
      callback = function()
        vim.cmd("PencilSoft")
      end,
    })
  end,
}
