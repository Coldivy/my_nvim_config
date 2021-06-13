syntax on
set number
set nocursorline
set wrap
set wildmenu

set hidden

set encoding=utf-8
set langmenu=zh_CN.UTF-8
set ambiwidth=double 

set tabstop =2
noremap j h
noremap i k
noremap k j

noremap o i

noremap <silent> bo :enew<CR>
noremap <silent> bn :bnext<CR>
noremap <silent> bp :bprevious<CR>
noremap <silent> bd :bdelete<CR>

noremap <silent> df :Defx<CR>
map S :w<CR>
map Q :q<CR> 
map <F12> :source $MYVIMRC<CR>

call plug#begin('~/plugged')


Plug 'https://github.com/vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'Shougo/defx.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'    
call plug#end()

let g:airline_powerline_fonts = 1  
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nf_show=1
let g:airline_theme='luna'

call defx#custom#option('_', {
      \ 'winwidth': 30,
      \ 'direction':'topleft',
      \ 'show_ignored_files': 0,
      \ 'buffer_name': '',
      \ 'toggle': 1,})

autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
          " Define mappings
          nnoremap <silent><buffer><expr> <CR>
          \ defx#do_action('open')
          nnoremap <silent><buffer><expr> c
	        \ defx#do_action('copy')
	        nnoremap <silent><buffer><expr> m
      	  \ defx#do_action('move')
	        nnoremap <silent><buffer><expr> p
      	  \ defx#do_action('paste')
          nnoremap <silent><buffer><expr> E
	        \ defx#do_action('open', 'vsplit')

endfunction
