-- Locals
local group = vim.api.nvim_create_augroup
local auto = vim.api.nvim_create_autocmd
local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end
local packer_path = vim.fn.stdpath('config') .. '/site'

-- Globals
vim.o.packpath = vim.o.packpath .. ',' .. packer_path
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = "\\"
vim.g.localleader = ","


-- Modules
require('vars')
require('opts')
require('keys')
require('deps')
require('plug')

-- Diagnostics
sign({name = 'DiagnosticSignError', text = ''})
sign({name = 'DiagnosticSignWarn', text = ''})
sign({name = 'DiagnosticSignHint', text = ''})
sign({name = 'DiagnosticSignInfo', text = ''})
