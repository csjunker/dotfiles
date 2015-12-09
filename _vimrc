set nocompatible
:let do_syntax_sel_menu = 1


set columns=120
set lines=50

if has("gui_running")
  set lines=60 columns=150
endif

source $HOME/vimfiles/gvim_stuff.vim

""source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set autochdir
set nobk


""""source $HOME/vimfiles/vundle_stuff.vim
filetype off                  " required

" set the runtime path to include Vundle and initialize
""""set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/vimfiles/bundle/Vundle.vim/
""""call vundle#begin()
call vundle#begin('~/vimfiles/')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-fugitive'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
""Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
""""Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'rstacruz/sparkup', {'rtp': 'vim'}

Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Bundle 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'elzr/vim-json'
Plugin 'fboender/bexec'

Plugin 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plugin 'pangloss/vim-javascript'

"passive features
Plugin 'tpope/vim-sleuth'
Plugin 'bling/vim-airline'
Plugin 'valloric/MatchTagAlways'

"Color scheme
Plugin 'tomasr/molokai'

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


set encoding=utf-8
colorscheme molokai

set splitbelow
set splitright


"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
"""nnoremap <space> za

"""let g:SimpylFold_docstring_preview=1

"""au BufNewFile,BufRead *.py
"""    \ set tabstop=4
"""    \ set softtabstop=4
"""    \ set shiftwidth=4
"""    \ set textwidth=79
"""    \ set expandtab
"""    \ set autoindent
"""    \ set fileformat=unix


"""au BufNewFile,BufRead *.js, *.html, *.css; set tabstop=2; set softtabstop=2; set shiftwidth=2

""au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"You can use <c-j> to goto the next <++> - it is pretty smart.

"JavaScript
autocmd BufRead,BufNewFile *.tmpl,*.htm,*.js inorea <buffer> cfun <c-r>=IMAP_PutTextWithMovement("function <++>(<++>) {\n<++>;\nreturn <++>;\n}")<CR>
autocmd BufRead,BufNewFile *.tmpl,*.htm,*.js inorea <buffer> cfor <c-r>=IMAP_PutTextWithMovement("for(<++>; <++>; <++>) {\n<++>;\n}")<CR>
autocmd BufRead,BufNewFile *.tmpl,*.htm,*.js inorea <buffer> cif <c-r>=IMAP_PutTextWithMovement("if(<++>) {\n<++>;\n}")<CR>
autocmd BufRead,BufNewFile *.tmpl,*.htm,*.js inorea <buffer> cifelse <c-r>=IMAP_PutTextWithMovement("if(<++>) {\n<++>;\n}\nelse {\n<++>;\n}")<CR>

"HTML
autocmd BufRead,BufNewFile *.tmpl,*.js,*.htm inorea <buffer> cahref <c-r>=IMAP_PutTextWithMovement('<a href="<++>"><++></a>')<CR>
autocmd BufRead,BufNewFile *.tmpl,*.js,*.htm inorea <buffer> cbold <c-r>=IMAP_PutTextWithMovement('<b><++></b>')<CR>
autocmd BufRead,BufNewFile *.tmpl,*.js,*.htm inorea <buffer> cimg <c-r>=IMAP_PutTextWithMovement('<¿mg src="<++>" alt="<++>" />')<CR>
autocmd BufRead,BufNewFile *.tmpl,*.js,*.htm inorea <buffer> cpara <c-r>=IMAP_PutTextWithMovement('<p><++></p>')<CR>
autocmd BufRead,BufNewFile *.tmpl,*.js,*.htm inorea <buffer> ctag <c-r>=IMAP_PutTextWithMovement('<<++>><++></<++>>')<CR>
autocmd BufRead,BufNewFile *.tmpl,*.js,*.htm inorea <buffer> ctag1 <c-r>=IMAP_PutTextWithMovement("<<++>><CR><++><CR></<++>>")<CR>

"Python
autocmd BufNewFile,BufRead *.py inorea <buffer> cfun <c-r>=IMAP_PutTextWithMovement("def <++>(<++>):\n<++>\nreturn <++>")<CR>
autocmd BufRead,BufNewFile *.py inorea <buffer> cclass <c-r>=IMAP_PutTextWithMovement("class <++>:\n<++>")<CR>
autocmd BufRead,BufNewFile *.py inorea <buffer> cfor <c-r>=IMAP_PutTextWithMovement("for <++> in <++>:\n<++>")<CR>
autocmd BufRead,BufNewFile *.py inorea <buffer> cif <c-r>=IMAP_PutTextWithMovement("if <++>:\n<++>")<CR>
autocmd BufRead,BufNewFile *.py inorea <buffer> cifelse <c-r>=IMAP_PutTextWithMovement("if <++>:\n<++>\nelse:\n<++>")<CR>

"Press c-q insted of space (or other key) to complete the snippet
imap <C-q> <C-]>

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>


"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF


let python_highlight_all=1
syntax on

"let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

set rnu

set clipboard=unnamed


