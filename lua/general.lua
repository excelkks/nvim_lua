----------------------------------------------------------
--- emacs key mapping
----------------------------------------------------------
vim.keymap.set('i', '<C-a>', '<home>')
vim.keymap.set('i', '<C-e>', '<end>')
vim.keymap.set('i', '<C-p>', '<up>')
vim.keymap.set('i', '<C-n>', '<down>')
vim.keymap.set('i', '<C-b>', '<left>')
vim.keymap.set('i', '<C-f>', '<right>')

vim.keymap.set('c', '<C-A>', '<C-b>')
vim.keymap.set('c', '<C-B>', '<left>')
vim.keymap.set('c', '<C-F>', '<right>')

----------------------------------------------------------
--- basic key mapping
----------------------------------------------------------
vim.g.mapleader = ' '

----------------------------------------------------------
--- basic settings
----------------------------------------------------------
vim.opt.shellslash = true
vim.opt.autochdir = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.expandtab = true  -- 展开tab为空格
vim.opt.tabstop = 2       -- tab显示的宽度
vim.opt.shiftwidth = 2    -- 缩进宽度(例如按>>)
vim.opt.softtabstop = 2   -- 按下<tab>键插入的空格数
vim.opt.jumpoptions = 'stack'
vim.opt.termguicolors = true
vim.opt.clipboard:append('unnamedplus')
vim.opt.cindent = true
vim.opt.wrap = false
vim.opt.shortmess:append('mrwc')
vim.opt.lazyredraw = true
vim.opt.undofile = true
vim.opt.virtualedit = 'block'
vim.opt.mouse = 'a'
if (vim.loop.os_uname().sysname == "Windows_NT") then
  vim.opt.shell = "powershell"
  vim.opt.shellcmdflag = "-command"
  vim.opt.shellquote='\"'
  vim.opt.shellxquote=''

end



vim.cmd([[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]])


local function list_files_or_dirs(path)
  if(path==nil)
  then
      path = '.'
  end
  local files_and_dirs_str = vim.fn.glob(path .. '/*')
  local pattern = path .. "/(.+)\n"
  local files_and_dirs = {}
  for file_or_dir in string.gmatch(files_and_dirs_str, pattern) do
    table.insert(files_and_dirs, file_or_dir)
  end
  return files_and_dirs
end


----------------------------------------------------------
--- open config file command
----------------------------------------------------------
vim.api.nvim_create_user_command('OpenConfig',
  function(opts)
    local config_path = vim.fn.stdpath('config')
    vim.cmd('edit ' .. config_path .. '/' .. 'init.lua')
  end,
  {
    nargs = 0
  })


----------------------------------------------------------
--- display line number
----------------------------------------------------------
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = { "*.cpp", "*.c", "*.h", -- c/c++
              "*.py",                -- python
              "*.lua",               -- lua
  },
  callback = function()
    vim.opt_local.number = true
    vim.opt_local.relativenumber = true
    vim.opt_local.cursorline = true
    vim.opt_local.colorcolumn = '80'
  end
})


----------------------------------------------------------
--- line number display method
----------------------------------------------------------
vim.opt.signcolumn = 'yes'
vim.diagnostic.config({
  virtual_text = {
    prefix = 'x' -- Could be '■', '●', '▎', 'x'
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})

local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
