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
" tabs or spaces?
"
function! SetIndentStyle()
	let tabs = len(filter(getline('1', '$'), 'v:val =~ "^\t"'))
	let spaces = len(filter(getline('1', '$'), 'v:val =~ "^ "'))
	if spaces > tabs
		set ts=4 sts=4 sw=4 et
	else
		set ts=8 sts=0 sw=8 noet
	endif
endfunction

autocmd FileType * set ts=8 sts=0 sw=8 noet
autocmd FileType c,cpp call SetIndentStyle()

"
" tags
"
set tags=tags;
autocmd FileType cpp execute 'set tags+='.substitute(globpath('~/.vim/tags', '*'), '\n', ',', 'g')
map <leader>rt :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

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
" tagbar
"
let g:tagbar_left=1
map <leader>tb :TagbarToggle<CR>

"
" syntastic
"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
" let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_cpp_compiler_options='-std=c++11'

"
" OmniCppComplete
"
let OmniCpp_NamespaceSearch=1
let OmniCpp_GlobalScopeSearch=1
let OmniCpp_ShowAccess=1
let OmniCpp_ShowPrototypeInAbbr=1 " show function parameters
let OmniCpp_MayCompleteDot=1 " autocomplete after .
let OmniCpp_MayCompleteArrow=1 " autocomplete after ->
let OmniCpp_MayCompleteScope=1 " autocomplete after ::
let OmniCpp_DefaultNamespaces=["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

"
" airline
"
let g:airline_powerline_fonts=1
let g:airline_enable_branch=1
set laststatus=2
