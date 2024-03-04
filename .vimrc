NU nano 6.2                                                                           /home/devolper11/.config/nvim/init.vim                                                                                    
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'ryanoasis/vim-devicons'
Plug 'sainnhe/sonokai'
Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'npm ci'}
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
set encoding=UTF-8
set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4
set autoindent noexpandtab tabstop=4 shiftwidth=4
