return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      vim.keymap.set('n', '<leader>b', ':Telescope buffers<cr>')
      vim.keymap.set('n', '<leader>f', ':Telescope find_files<cr>')
      vim.keymap.set('n', '<leader>F', ':Telescope find_files<cr>')
    end
  }
}
