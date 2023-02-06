local opt = vim.opt

opt.background = 'light'
opt.clipboard = "unnamed"
opt.number = true
opt.signcolumn = "yes"
opt.smartcase = true
opt.ignorecase = true
opt.linebreak = true
opt.textwidth = 500
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.smartindent = true
opt.wrap = false
opt.relativenumber = true

-- Allow unsaved buffers to be switched
opt.hidden = true

-- For regular expressions turn magic on
opt.magic = true

-- How many tenths of a second to blink when matching brackets
opt.matchtime = 2

-- Ms before swap is written, also CursorHold autocommand event
opt.updatetime = 650

