syntax on
set number
set nocursorline
set wrap
set wildmenu

set hidden

set fillchars=vert:|

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



autocmd CursorHold * silent call CocActionAsync('highlight')
set updatetime=100
set signcolumn=yes
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
nmap <leader>rn <Plug>(coc-rename)





nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nnoremap <silent> H :call <SID>show_documentation()<CR>


call plug#begin('~/plugged')


Plug 'https://github.com/vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'Shougo/defx.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'    

Plug 'connorholyday/vim-snazzy'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

let g:coc_global_extensions =['coc-json', 'coc-vimlsp' ,'coc-clangd', 'coc-marketplace', 'coc-python']

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

let g:SnazzyTransparent = 1
colorscheme snazzy



