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

" Tsuquyomi
let g:tsuquyomi_shortest_import_path = 1
nnoremap <leader>i :TsuImport<CR>
let g:tsuquyomi_singlequote_import = 1

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
