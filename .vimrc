
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'rking/ag.vim'
Plugin 'majutsushi/tagbar'
Plugin 'AnsiEsc.vim'
Plugin 'molokai'
Plugin 'vim-clang-format'
Plugin 'ctrlp.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" nerdtree
nnoremap <silent> <F5> :NERDTree<CR>

" vim-gitgutter
set updatetime=100
let g:gitgutter_max_signs = 500  " default value
nmap :ggst :GitGutterSignsToggle

" netrw
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 3
let g:netrw_winsize = 25

" ag.vim
let g:ag_highlight=1

" tagbar
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 30
let g:tagbar_autofocus = 1
map <F8> :TagbarToggle<CR>
nmap <C-]> :tabnew %<CR>g<C-]>
vmap <C-]> <Esc>:tabnew %<CR>gvg<C-]>

" ack
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

" clang-format
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11"}
let g:clang_format#command = 'clang-format-8'

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>
" turn on auto clang for C++
"autocmd FileType c,cpp ClangFormatAutoEnable

" ctrlp
let g:ctrlp_max_files = 0
let g:ctrlp_max_depth = 40
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_open_multiple_files = 'tj'
noremap <Leader><C-P> :CtrlP /home/murphy/git/<CR>

set tags=./tags,tags;$HOME
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
nmap <tab> :tabn<CR>
nmap <S-tab> :tabp<CR>
command Header set scrollopt+=hor <bar> set scrollopt-=ver <bar> set nowrap <bar> 1split <bar> 1 <bar> windo set scrollbind
map m :set mouse=a<Enter>
map M :set mouse=<Enter>
" map F :set foldmethod=indent<Enter>
map F :set foldmethod=syntax<Enter>
" map H :set lines=44<Enter>:set columns=174<Enter>
nmap :W :w
nmap :Q :q
vmap c ^I//<esc>
vmap C :s/\/\///g<CR>
vmap # ^I#<esc>
vnoremap ;rv c<C-O>:set revins<CR><C-R>"<Esc>:set norevins<CR>
if has("gui_running")
    imap <S-Insert> <middlemouse>
    cmap <S-Insert> <middlemouse>
endif
" not compatible with Vi
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" general settings
" setting the textwidth will auto insert cariage return
" set textwidth=78
set nobackup
set history=50
set ruler
set mouse=a
set showcmd
set incsearch
set hlsearch
set nu
set nowrap
syntax on
filetype plugin indent on

" Setting for different filetype
au BufNewFile,BufRead *.lib set syn=off
au BufNewFile,BufRead *.log set filetype=log
au BufNewFile,BufRead *.log AnsiEsc
au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/yaml.vim
au BufNewFile,BufRead *.c,*.cpp,*.h set autoread
" set foldmethod=indent

" highlight Normal ctermfg=grey ctermbg=black
" highlight Normal ctermfg=grey ctermbg=grey

" colorscheme desert
colorscheme darkblue
if has("gui_running")
    colorscheme desert
endif

" let g:molokai_original = 1
" let g:rehash256 = 1

" support 256 color
set t_Co=256

" highlight current line and character under cursor
set cursorline
highlight CursorLine term=bold cterm=bold ctermbg=008
highlight Cursor term=reverse cterm=reverse
highlight Visual term=bold,reverse cterm=bold,reverse

" remove underline for line number
highlight CursorLineNr term=bold cterm=bold ctermfg=011 ctermbg=008 gui=bold

" tab setting
set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab
" set noexpandtab

" moving around key mappings
nmap k gk
nmap j gj

" split windows key mappings
nmap <C-L> <C-W>l
nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k

" Enable filetype plugin
filetype plugin on

" set folding for different filetypes
au BufNewFile,BufRead *.py,*.pyc    source ~/.vim/pyfold.vim
au BufNewFile,BufRead *.c,*.cpp,*.h source ~/.vim/cfold.vim
au BufNewFile,BufRead *.v,          source ~/.vim/vfold.vim
au BufNewFile,BufRead makefile,Makefile,GNUmakefile set noexpandtab

" highlight trailing white spaces
highlight TrailingSpace ctermbg=red
match TrailingSpace /\s\+\%#\@<!$/

" set folding key mappings
nmap zz za

" disable visual bell & beep
set vb t_vb=

" remove spaces
map <F2> : <esc>:nohlsearch<CR>
map <F3> : <esc>:%s/\([^ \t]\)[ \t]*$/\1/g<CR>:%s/^[ \t]*$//g<CR>
map <F4> : <esc>:%s/\([^ \t]\)[ \t]*$/\1/g<CR>:%s/^[ \t]*$//g<CR>

" pretty json
nnoremap <buffer><Leader>pj :%!python -m json.tool<CR>
vnoremap <buffer><Leader>pj :!python -m json.tool<CR>

" disable ex mode
nnoremap Q <Nop>

map <F9> :tabmove -1<CR>
map <F10> :tabmove +1<CR>




