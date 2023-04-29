let data_dir = '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin()

Plug 'voldikss/vim-floaterm'
Plug 'EdenEast/nightfox.nvim'
Plug 'tomasiser/vim-code-dark'

call plug#end()

colorscheme codedark 
syntax on

filetype plugin indent on
filetype plugin on

set updatetime=100
set cc=80
set ts=4
set et
set sw=4
set number

let g:NERDCreateDefaultMappings = 1
let g:airline#extensions#tabline#enabled = 1

" Make Shift-Tab do the same thing as Ctrl-D
inoremap <S-Tab> <C-d>

nnoremap <F3> :noh<CR>

map <F5> :NERDTreeToggle<CR>

nnoremap <silent> <F7>    :FloatermNew<CR>
tnoremap <silent> <F7>    <C-\><C-n>:FloatermNew<CR>
nnoremap <silent> <F8>    :FloatermPrev<CR>
tnoremap <silent> <F8>    <C-\><C-n>:FloatermPrev<CR>
nnoremap <silent> <F9>    :FloatermNext<CR>
tnoremap <silent> <F9>    <C-\><C-n>:FloatermNext<CR>
nnoremap <silent> <F12>   :FloatermToggle<CR>
tnoremap <silent> <F12>   <C-\><C-n>:FloatermToggle<CR>
