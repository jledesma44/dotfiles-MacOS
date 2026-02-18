return {
  "3rd/image.nvim",
  config = function()
    require("image").setup({
      backend = "kitty",
      processor = "magick_cli", -- Use ImageMagick CLI
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = false,
          filetypes = { "markdown", "vimwiki" },
        },
      },
      max_height_window_percentage = 50,
      hijack_file_patterns = {
        "*.png",
        "*.jpg",
        "*.jpeg",
        "*.gif",
        "*.webp",
        "*.svg",
      },
      -- Custom render command for SVG files
      render_using_dvisvgm = false,
      magick_rock_config = {
        convert_svg_to = "png", -- Convert SVG to PNG
        svg_dpi = 150, -- Higher DPI for better quality
      },
    })
  end,
}
