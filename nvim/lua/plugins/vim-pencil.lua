return {
  'preservim/vim-pencil',
  lazy = false,
  config = function()
    vim.cmd [[runtime! plugin/pencil.vim]]
    vim.g.tex_conceal = ''
    vim.g['pencil#conseallevel'] = 0
    vim.g['pencil#initConceal'] = 0
    vim.g['pencil#wrapModeDefault'] = 'soft'
    vim.cmd [[autocmd FileType markdown,mkd call pencil#init({'wrap', 'soft'})]]
  end,
}
