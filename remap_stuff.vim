"remap_stuff.vim
"
"remaps and misc.

"highlight current word.  source: http://stackoverflow.com/a/31722469
nnoremap <leader>* :<C-u>let @/ = expand('<cword>')<cr> 
