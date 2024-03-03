call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'   
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', { 'branch' : 'release' }
Plug 'sainnhe/sonokai'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
call plug#end()
colorscheme sonokai
let g:airline_theme = 'sonokai'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
nmap <silent> <A-1> :NERDTreeToggle<CR>
vnoremap <C-C> "+y
vnoremap <C-X> "+x
vnoremap <C-V> "+p
nnoremap <C-N> :vsplit<CR>
nnoremap <C-M> :split<CR>
