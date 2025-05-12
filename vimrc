call plug#begin()

Plug 'dag/vim-fish'
Plug 'dense-analysis/ale'
Plug 'drmikehenry/vim-headerguard'
Plug 'erwan-privat/vim-commentary'
" Plug 'goerz/jupytext.vim'
Plug 'habamax/vim-godot'
Plug 'jiangmiao/auto-pairs'
Plug 'jupyter-vim/jupyter-vim'
Plug 'nanotee/zoxide.vim' 
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()

set mouse=a
set list listchars=tab:>·,trail:·
set background=dark
set textwidth=69
set colorcolumn=70
set number
set nu
set smartindent
set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
" set vb
set hlsearch
set ignorecase
set smartcase
set hidden
set t_ut=
set t_Co=256
set cursorline
highlight CursorLine cterm=NONE ctermbg=0

let mapleader=','
let maplocalleader=','

let fortran_free_source=1
let fortran_do_enddo=1
augroup filetypes_options
  au!
  au FileType fortran setlocal shiftwidth=3 softtabstop=3
  au FileType scilab  setlocal shiftwidth=2 softtabstop=2
  let clangargs = [
        \]
  au FileType c,cpp,arduino setlocal equalprg=
        \"clang-format -style='{BaseOnStyle: microsoft, IdentWidth: 2, ColumnLimit: 61}'"
  au FileType fish compiler fish
augroup END
aug python
  au!
  " ftype/python.vim overwrites this
  au FileType python setlocal ts=2 sts=2 sw=2 noexpandtab
aug end

autocmd FileType arduino,h,cpp setlocal commentstring=//\ %s
noremap <leader>y "+y
set rnu
noremap <leader>n :set rnu!<CR>
noremap <silent> <leader>p "+p

color gruvbox
let g:airline#extensions#tabline#enabled = 1

set pastetoggle=<F2>
imap <NUL> <C-Space>
xmap <NUL> <C-Space>
imap <C-Space> <ESC><ESC>
xmap <C-Space> <ESC>:noh<CR>
nmap <C-w><C-w> :bd<CR>
nmap [5;5~ :bp<CR>
nmap [6;5~ :bn<CR>
nmap <C-j> :bp<CR>
nmap <C-n> :bn<CR>
nmap <C-s> :w<CR>
imap <C-s> <ESC>:w<CR>
noremap x "_x
nmap £ "ayiw:tag <C-r>a<CR>
map [1;5C w
map! [1;5C <C-o>w
map [1;5D b
map! [1;5D <C-o>b
map [1;5A 5-
map! [1;5A <C-o>5- 
map [1;5B 5+
map! [1;5B <C-o>5+
imap <F3> eprivat <C-r>=strftime('%F')<CR>
nmap <F3> O<F3><ESC><leader>ccA<CR>
nmap <F4> O#!/usr/bin/env bash<CR><CR>
" scilab create function
" nmap <F5> "ayiw:e <C-r>a.sci<CR>ifunction <C-r>a()<CR><CR>endfunction<ESC>gg<F3><ESC><ESC>kko// 
" cpp header guard
nmap <F5> :HeaderguardAdd<CR>
nmap <F6> O#!/usr/bin/env python3<CR><CR>def main() -> None:<CR>pass<CR><CR><CR>if __name__ == "__main__":<CR>main()<DEL>
" nmap <F9> :silent !tmux send-keys -t :.+ "./<C-r>%" Enter<CR> <C-l>
let g:UltiSnipsExpandTrigger="<S-Tab>"
" list all snippets for current filetype
let g:UltiSnipsListSnippets="<C-L>"


augroup scilab
  au!
  " 1;6B is C-S-Down
  au FileType scilab imap [1;6B <Space>..<CR><Space><Space>
  au FileType scilab nmap [1;6B i<Space>..<CR><Space><Space><ESC><ESC>
augroup END

augroup latex
  au!
  noremap \b ciw\begin{<C-R>"}<CR>\end{<C-R>"}<ESC><ESC>O
augroup END

" set nofoldenable
" au VimLeavePre * if v:this_session != '' | exec "mks! " . v:this_session | endif

set tags+=$HOME/tags;
set directory=$HOME/.vim/swp//
set noswapfile " set directory just in case
set undofile
set undodir=$HOME/.vim/undodir//
set backupskip+=$HOME/secure/*,/media/$USER/Ypsilon/*
augroup secure
  au!
  au BufWritePre,FileWritePre */secure/*,*/Ypsilon/* setlocal noundofile
  " au BufWritePre,FileWritePre Ypsilon/* setlocal noundofile
augroup END

" Toggle background transparency with keybind and reset term colors.
augroup TBG
  au!
  au VimEnter * hi Normal guibg=NONE ctermbg=NONE
  au VimLeave * !echo -ne "\033[0m"
augroup END

let t:is_transparent = 0
function! Toggle_transparent_background()
  if t:is_transparent == 0
    hi Normal guibg=#333333 ctermbg=black
    let t:is_transparent = 1
  else
    hi Normal guibg=NONE ctermbg=NONE
    let t:is_transparent = 0
  endif
endfunction
nnoremap <F9> :call Toggle_transparent_background()<CR>

" Windows Terminal cursor fix
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"
