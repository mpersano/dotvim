set nocompatible
syntax on
set smartindent
set background=dark
set ruler

set matchpairs+=<:>

filetype plugin on

runtime ftplugin/man.vim

" pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

" NERDTree
let g:NERDTreeWinPos="right"
map <F12> :NERDTreeToggle<CR>

" taglist
map <F11> :TlistToggle<CR>

" clang_complete
let g:clang_use_library=1
let g:clang_library_path="/usr/lib/i386-linux-gnu/libclang.so.1"
let g:clang_user_options='-std=c++11'
let g:clang_complete_auto=0
