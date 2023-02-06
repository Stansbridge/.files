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
local diagnostics_group = group('Diagnostics', { clear = true })
local open_diagnostics = function()
  vim.diagnostic.open_float(nil, { focusable = false })
end
vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = false,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})
sign({name = 'DiagnosticSignError', text = ''})
sign({name = 'DiagnosticSignWarn', text = ''})
sign({name = 'DiagnosticSignHint', text = ''})
sign({name = 'DiagnosticSignInfo', text = ''})
auto({ 'CursorHold' }, { pattern = "*", group = diagnostics_group, callback = open_diagnostics })
