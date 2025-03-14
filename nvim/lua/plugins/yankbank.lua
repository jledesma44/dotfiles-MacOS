return {
  'ptdewey/yankbank-nvim',
  dependencies = 'kkharji/sqlite.lua',
  config = function()
    require('yankbank').setup {
      max_entries = 10,
      sep = '-----',
      num_behavior = 'jump',
      focus_gain_poll = true,
      persist_type = 'sqlite',
      keymaps = {
        close = '<Esc>',
        paste = '<CR>',
        navigate_next = 'j',
        navigate_previous = 'k',
        paste_back = 'P',
      },
      registers = {
        yank_register = '+',
      },
    }
  end,
}
