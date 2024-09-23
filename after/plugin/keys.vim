" map! <NUL> <C-Space>
" imap <C-Space> <ESC>

aug python
au!
" ftype/python.vim overwrites this
au FileType python setlocal ts=2 sts=2 sw=2 
" noexpandtab
aug end

set t_Co=256
