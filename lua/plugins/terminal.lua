return {
  {
    "akinsho/toggleterm.nvim", version = '*',
    config = function()
      vim.keymap.set('t', '<M-=>', '<C-\\><C-n>:ToggleTerm<cr>')
      vim.keymap.set('n', '<M-=>', '<Esc>:ToggleTerm<cr>')
      vim.keymap.set('i', '<M-=>', '<Esc>:ToggleTerm<cr>')
      require('toggleterm').setup()
    end
  }
}
