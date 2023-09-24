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
set ts=4 sts=4 sw=4 et

let c_space_errors=1

filetype plugin indent on

runtime ftplugin/man.vim

"
" tags
"
set tags=tags;
autocmd FileType cpp execute 'set tags+='.substitute(globpath('~/.vim/tags', '*'), '\n', ',', 'g')

"
" pathogen
"
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

"
" NERDTree
"
let g:NERDTreeWinPos="right"
" let g:NERDTreeDirArrows=0 " remove this for fancy arrows (needs utf-8 locale)
map <leader>nt :NERDTreeFind<CR>

"
" airline
"
let g:airline_powerline_fonts=1
let g:airline_enable_branch=1
set laststatus=2

"
" YouCompleteMe
"
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_log_level = 'debug'
let g:ycm_clangd_binary_path = '/usr/bin/clangd'
map <leader>yg :YcmCompleter GoTo<CR>
map <leader>yd :YcmCompleter GetDoc<CR>
map <leader>yt :YcmCompleter GetType<CR>
map <leader>yf :YcmCompleter FixIt<CR>
