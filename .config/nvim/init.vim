" NOTE:
" node: npm install -g neovim
" coc: :CocInstall coc-tsserver coc-json coc-html coc-css

" colors
colorscheme nord

" yank into unnamed clipboard (yy should work)
set clipboard=unnamed

" Line numbers 
set number

" Allow unsaved buffers to be switched
set hidden

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" For regular expressions turn magic on
set magic

" How many tenths of a second to blink when matching brackets
set matchtime=2

" Linebreak on 500 characters
set linebreak
set textwidth=500

" Default indent
set expandtab
set tabstop=2
set shiftwidth=2

" Smart indent
set smartindent
" Wrap lines
set wrap

" Treat long lines as break lines (useful when moving around in them):
map j gj
map k gk

" Map leader and return to remove highlighting
map <silent> <leader><cr> :noh<cr>

" Easy Window Navigation (best 4 lines ever)
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Show line endings (vim defaults)
set list listchars=tab:>\ ,trail:-,eol:$

" Set relative line number
set relativenumber

" Get CtrlP to stop being annoying with folders and use the git files instead
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
  let g:ackprg = 'ag --vimgrep'
endif

" Plugins
call plug#begin()

Plug 'git@github.com:Numkil/ag.nvim.git'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'git@github.com:ctrlpvim/ctrlp.vim.git'
Plug 'git@github.com:airblade/vim-gitgutter.git'
Plug 'git@github.com:MaxMEllon/vim-jsx-pretty.git'
Plug 'git@github.com:itchyny/lightline.vim.git'
Plug 'git@github.com:preservim/nerdcommenter.git'
Plug 'git@github.com:preservim/nerdtree.git'
Plug 'git@github.com:arcticicestudio/nord-vim.git'
Plug 'git@github.com:kshenoy/vim-signature.git'
Plug 'git@github.com:tpope/vim-sleuth.git'
Plug 'git@github.com:tpope/vim-surround.git'
Plug 'git@github.com:leafgarland/typescript-vim.git'
Plug 'git@github.com:yuezk/vim-js.git'
Plug 'git@github.com:kevinoid/vim-jsonc.git'

" Initialize plugin system
call plug#end()
" :PlugInstall

" CoC.nvim
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" set JSON to JSONC (allow comments)
augroup JsonToJsonc
    autocmd! FileType json set filetype=jsonc
augroup END

" NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" Auto start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Lightline
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }
