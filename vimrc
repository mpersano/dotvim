set nocompatible
syntax on
set smartindent
set background=dark
set ruler

set matchpairs+=<:>

filetype plugin on

runtime ftplugin/man.vim

"
" cscope
"
if has("cscope")
    set csprg=gtags-cscope " GNU Global >>> cscope
    set csto=0
    set cst
    set nocsverb
    if filereadable("GTAGS") " ditto
        cs add GTAGS
    endif
    set csverb

    " find references to token under cursor
    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>

    " find calls to function name under cursor
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
endif

"
" pathogen
"
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

"
" NERDTree
"
let g:NERDTreeWinPos="right"
map <F12> :NERDTreeToggle<CR>

"
" taglist
"
map <F11> :TlistToggle<CR>

"
" clang_complete
"
let g:clang_use_library=1
let g:clang_library_path="/usr/lib/i386-linux-gnu/libclang.so.1"
let g:clang_user_options='-std=c++11'
let g:clang_complete_auto=0
