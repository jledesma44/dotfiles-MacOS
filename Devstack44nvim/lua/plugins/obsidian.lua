return {
  'epwalsh/obsidian.nvim',
  version = '*',
  lazy = true,
  ft = 'markdown',
  dependencies = {
    'nvim.lua/planery.nvim',
  },
  require('obsidian').setup {
    workspaces = {
      name = 'Devstack44',
      path = 'Users/jaimeledesma/library/Mobile Documents/iCloud~md~obsidian/Documents/Devstack44',
    },
  },
}
