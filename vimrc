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
let g:NERDTreeDirArrows=0 " remove this for fancy arrows (needs utf-8 locale)
map <F12> :NERDTreeToggle<CR>
map <F3> :NERDTreeFind<CR>

"
" tagbar
"
map <F8> :TagbarToggle<CR>
let g:tagbar_left=1

"
" clang_complete
"
let g:clang_use_library=1
let g:clang_close_preview=1
let g:clang_user_options='-std=c++11'
let g:clang_complete_auto=0

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
