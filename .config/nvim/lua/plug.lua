local map = vim.keymap.set
local group = vim.api.nvim_create_augroup
local auto = vim.api.nvim_create_autocmd
local map_opts = { noremap = true, silent = true }

-- Colours
vim.g.material_style = "lighter"
require('material').setup({
  plugins = {
    "gitsigns",
    "nvim-tree",
    "telescope"
  }
})
vim.cmd 'colorscheme material'

-- Mason
local opts = { noremap=true, silent=true }
map('n', '<space>e', vim.diagnostic.open_float, opts)
map('n', '[d', vim.diagnostic.goto_prev, opts)
map('n', ']d', vim.diagnostic.goto_next, opts)
map('n', '<space>q', vim.diagnostic.setloclist, opts)

local lsp_on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  map('n', 'gD', vim.lsp.buf.declaration, bufopts)
  map('n', 'gd', vim.lsp.buf.definition, bufopts)
  map('n', 'K', vim.lsp.buf.hover, bufopts)
  map('n', 'gi', vim.lsp.buf.implementation, bufopts)
  map('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  map('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  map('n', 'gr', vim.lsp.buf.references, bufopts)
  map('n', '<localleader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

require('mason').setup()
require("mason-lspconfig").setup({
  ensure_installed = { "sumneko_lua", "rust_analyzer", "tsserver", "taplo" }
})
require("mason-lspconfig").setup_handlers {
    function (server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {
          server = {
            on_attach = lsp_on_attach
          }
        }
    end,
    ["rust_analyzer"] = function ()
        -- RustTools
        require("rust-tools").setup({
          server = {
            on_attach = lsp_on_attach
          }
        })
    end,
    ["sumneko_lua"] = function ()
      require('lspconfig')['sumneko_lua'].setup {
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' }
            }
          }
        },
        server = {
          on_attach = lsp_on_attach
        }
      }
    end,
    ["tsserver"] = function ()
        -- Typescript.nvim
        require("typescript").setup({
          server = {
            on_attach = lsp_on_attach
          }
        })
    end
}


-- Lualine
require('lualine').setup({
  options = {
    theme = 'auto'
  }
})

-- GitSigns
require('gitsigns').setup()

-- TreeSj (Split Join)
require('treesj').setup({
  use_default_keymaps = false
});
map('n', '<leader>s', '<Cmd>TSJToggle<CR>', map_opts)

-- TreeSitter
require('nvim-treesitter.configs').setup({
  ensure_installed = { "lua", "vim", "help", "rust", "typescript", "toml" },
  highlight = {
    enable = true,
    disable = {},
  },
  context_commentstring = {
    enable = true
  },
  indent = {
    enable = true
  }
})

-- Barbar
map('n', 'tc', '<Cmd>BufferClose<CR>', map_opts)
map('n', 'tp', '<Cmd>BufferPrevious<CR>', map_opts)
map('n', 'tn', '<Cmd>BufferNext<CR>', map_opts)
map('n', 'tmp', '<Cmd>BufferMovePrevious<CR>', map_opts)
map('n', 'tmn', '<Cmd>BufferMoveNext<CR>', map_opts)
map('n', 't1', '<Cmd>BufferGoto 1<CR>', map_opts)
map('n', 't2', '<Cmd>BufferGoto 2<CR>', map_opts)
map('n', 't3', '<Cmd>BufferGoto 3<CR>', map_opts)
map('n', 't4', '<Cmd>BufferGoto 4<CR>', map_opts)
map('n', 't5', '<Cmd>BufferGoto 5<CR>', map_opts)
map('n', 't6', '<Cmd>BufferGoto 6<CR>', map_opts)
map('n', 't7', '<Cmd>BufferGoto 7<CR>', map_opts)
map('n', 't8', '<Cmd>BufferGoto 8<CR>', map_opts)
map('n', 't9', '<Cmd>BufferGoto 9<CR>', map_opts)
map('n', 't0', '<Cmd>BufferLast<CR>', map_opts)
map('n', 'tt', '<Cmd>BufferPick<CR>', map_opts)

-- Telescope
local telescope = require('telescope.builtin')
local find_dot_files = function()
  telescope.find_files({
    find_command = {'rg', '--files', '--hidden', '-g', '!.git' }
  })
end
map('n', '<leader>ff', find_dot_files, {})
map('n', '<leader>fb', telescope.buffers, {})
map('n', '<leader>fg', telescope.live_grep, {}) --Requires ripgrep

-- Nvim-Tree
require("nvim-tree").setup({
  reload_on_bufenter = true,
  git = {
    ignore = false
  },
  update_focused_file = {
    enable = true,
    update_cwd = true
  }
})

local function open_nvim_tree(data)
  -- buffer is a real file on the disk
  local real_file = vim.fn.filereadable(data.file) == 1

  -- buffer is a [No Name]
  local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

  if not real_file and not no_name then
    return
  end

  -- open the tree, find the file but don't focus it
  require("nvim-tree.api").tree.toggle({ focus = false, find_file = true, })
end

map('n', '<C-n>', ':NvimTreeToggle<cr>', map_opts)
map('n', '<C-f>', ':NvimTreeFindFile<cr>', map_opts)
map('n', '<C-b>', ':NvimTreeFocus<cr>', map_opts)

local nvim_tree_group = group('NvimTree', { clear = true })
auto({'VimEnter'}, { callback = open_nvim_tree, group = nvim_tree_group })

-- Coq
vim.g.coq_settings = {
    auto_start = true,
    clients = {
        lsp = {
          enabled = true,
          resolve_timeout = 0.12,
        },
        tree_sitter = {
          enabled = true,
          weight_adjust = 1.0
        },
    },
    keymap = {
      jump_to_mark = '',
      bigger_preview = '',
    }
}
require('coq')

-- Comment
require('Comment').setup()
