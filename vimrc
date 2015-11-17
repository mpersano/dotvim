set nocompatible
syntax on
set smartindent
set background=dark
set ruler
set showcmd
set hlsearch
set incsearch
set number
set noerrorbells visualbell t_vb=
set matchpairs+=<:>
set complete-=i " scanning included files when autocompleting take *ages* with boost

let c_space_errors=1

filetype plugin indent on

runtime ftplugin/man.vim

"
" pathogen
"
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

"
" NERDTree
"
let g:NERDTreeWinPos="right"
let g:NERDTreeDirArrows=0 " remove this for fancy arrows (needs utf-8 locale)
map <F12> :NERDTreeToggle<CR>
map <F3> :NERDTreeFind<CR>

"
" tagbar
"
map <F8> :TagbarToggle<CR>
let g:tagbar_left=1

"
" syntastic
"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_cpp_compiler_options='-std=c++11'
