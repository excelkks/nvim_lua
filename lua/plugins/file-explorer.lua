return {
  ----------------------------------------------------------------
  --- file explorer
  ----------------------------------------------------------------
  {
    'nvim-tree/nvim-tree.lua',
    config = function()
      local function my_on_attach(bufnr)
        local api = require "nvim-tree.api"
      
        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end
      
        -- default mappings
        api.config.mappings.default_on_attach(bufnr)
      
        -- custom mappings
        vim.keymap.set('n', 'P', '-',                    opts('Up'))
        vim.keymap.set('n', '?', api.tree.toggle_help,   opts('Help'))
      end
      require('nvim-tree').setup({
        on_attach = my_on_attach
      })
      vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<cr>')
    end
  },
}
