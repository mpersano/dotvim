set nocompatible
syntax on
set smartindent
set background=dark
set ruler

set matchpairs+=<:>

filetype plugin indent on

runtime ftplugin/man.vim

" pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

" NERDTree
let g:NERDTreeWinPos="right"
map <F12> :NERDTreeToggle<CR>

" taglist
map <F11> :TlistToggle<CR>
