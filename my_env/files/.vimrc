
"Turn off beep
set noeb vb t_vb=
au GUIEnter * set vb t_vb=

set whichwrap+=<,>,h,l,[,]
set ignorecase
set smartcase
set hlsearch
set magic
set showmatch
set mat=2
syntax enable
colorscheme desert
set background=dark
set encoding=utf8
set ffs=unix,dos,mac
set expandtab
set ai
set wrap
set nu
set hidden
nmap <S-Up> V
nmap <S-Down> V
vmap <S-Up> k
vmap <S-Down> j
imap <S-Up> <Esc> v <Up>
imap <S-Down> <Esc> v <Down>
set linespace=2

if has("gui_running")
	inoremap <Esc> <Esc> `n
endif

set iskeyword+=$

filetype indent on
autocmd FileType perl set cinkeys=0{,0},0),0#,!<Tab>,;,:,o,O,e
autocmd FileType perl set indentkeys=!<Tab>,o,O
autocmd FileType perl map <Tab> i<Tab><Esc>^
autocmd FileType perl set cinoptions=:0,(0,u0,W1s
autocmd FileType perl nnoremap <M-;> i<TAB>print "\n";<ESC>$hhhi
autocmd FileType perl inoremap <M-;> <TAB>print "\n";<ESC>$hhhi
autocmd FileType perl vnoremap <M-;> <ESC>i<TAB>print "\n";<ESC>$hhhi
autocmd FileType perl set shiftwidth=2
autocmd FileType perl set softtabstop=2

if has('unix')
  autocmd FileType perl nnoremap ; i<TAB>print "\n";<ESC>$hhhi
  autocmd FileType perl inoremap ; <TAB>print "\n";<ESC>$hhhi
  autocmd FileType perl vnoremap ; <ESC>i<TAB>print "\n";<ESC>$hhhi
endif

autocmd FileType python set autoindent nosmartindent
autocmd FileType python set smarttab
autocmd FileType python set expandtab
autocmd FileType python set shiftwidth=4
autocmd FileType python set softtabstop=4


" set: paste automatically
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction


autocmd FileType yml,yaml setlocal ts=2 sw=2 expandtab et ai indentkeys-=0#
"cc=1,3,5,7,9,11,13,15,17
"highlight ColorColumn ctermbg=0


call plug#begin('~/.vim/plugged')
Plug 'fholgado/minibufexpl.vim'
Plug 'WolfgangMehner/perl-support'
call plug#end()

noremap <C-TAB>   :MBEbn<CR>
noremap <C-S-TAB> :MBEbp<CR>
let g:miniBufExplCycleArround = 1

if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif










