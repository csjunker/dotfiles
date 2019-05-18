" .vimrc
" vim settings for ekchju

" enable % to jump matching tags (buildt in vim plugin)
packadd! matchit

" intended size
set columns=140
set lines=45


" easy navigate splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitright
":vne[w] split new right
set splitbelow
":vne[w] split new below

" vim-plug is the plugin handling
" Load vim-plug. install if not present.
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes

" the status line at the bottom
Plug 'itchyny/lightline.vim'

" ex.  cs'"  inside '...'
Plug 'tpope/vim-surround'

" On-demand loading
" NERDTree file handling
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
" syntax completer
call plug#end()

if has("syntax")
  syntax on
endif


" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

"lightline
set laststatus=2
set noshowmode

set sw=4 ts=4
set hlsearch

" relative numbers and current line number
set number
set relativenumber

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)


