if exists('g:loaded_mydefaults') || &compatible
  finish
else
  let g:loaded_mydefaults = 'yes'
endif

if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Use :help 'option' to see the documentation for the given option.

let mapleader = "\<Space>"
let maploacalleader = ","

set number
set autoindent
set smartindent
set autoread
set backspace=indent,eol,start
set complete-=i
set smarttab
set nobackup
set noswapfile
set hlsearch
set incsearch
set ignorecase smartcase
set smarttab
set tabstop=2
set showcmd
set nrformats-=octal
set laststatus=2
set ruler
set wildmenu
set display+=lastline
set encoding=utf-8
set sessionoptions-=options

map 0 ^
let g:spellfile_URL = 'http://ftp.vim.org/vim/runtime/spell'


if !has('nvim') && &ttimeoutlen == -1
  set ttimeout
  set ttimeoutlen=100
endif

" This is totally awesome - remap jj to escape in insert mode.  You'll never type jj anyway, so it's great!
inoremap jj <esc>
nnoremap JJJJ <nop>

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

if &history < 1000
  set history=1000
endif
if &tabpagemax < 50
  set tabpagemax=50
endif
if !empty(&viminfo)
  set viminfo^=!
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

"------------------------------------------------------------------------------
" Spell checking
"------------------------------------------------------------------------------
if has("spell")
  " Pressing ss will toggle and untoggle spell checking
  map <leader>ss :setlocal spell!<cr>

  " Shortcuts using <leader>
  map <leader>sn ]s
  map <leader>sp [s
  map <leader>sa zg
  map <leader>s? z=

  " they were using white on white
  highlight PmenuSel ctermfg=black ctermbg=lightgray

  " limit it to just the top 10 items
  set sps=best,10
endif

"Config files
nnoremap <leader>fed :vsplit $MYVIMRC<cr>
nnoremap <leader>fer :source $MYVIMRC<cr>
nnoremap <leader>fev :version<cr>

nnoremap <leader>w- :split<cr>
nnoremap <leader>w/ :vsplit<cr>
nnoremap <leader>w= :wincmd=<cr>
nnoremap <leader>wc :q<cr>

" <Leader>[1-9] move to window [1-9]
for s:i in range(1, 9)
  execute 'nnoremap <Leader>' . s:i . ' :' . s:i . 'wincmd w<CR>'
endfor

" <Leader><leader>[1-9] move to tab [1-9]
for s:i in range(1, 9)
  execute 'nnoremap <Leader>t' . s:i . ' ' . s:i . 'gt'
endfor

" <Leader>b[1-9] move to buffer [1-9]
for s:i in range(1, 9)
  execute 'nnoremap <Leader>b' . s:i . ' :b' . s:i . '<CR>'
endfor

"Buffers
nnoremap <leader>bb :buffers<cr>
nnoremap <leader>bd :bdelete<cr>
nnoremap <leader>bn :bnext<cr>
nnoremap <leader>bp :bprevious<cr>
nnoremap <leader>bl :blast<cr>
nnoremap <leader>bf :bfirst<cr>

nmap <leader>tn :set number! number?<cr>
