call plug#begin()
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'sainnhe/sonokai'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

colorscheme sonokai

nmap <A-1> :NERDTreeToggle<CR>
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
nnoremap <C-a> ggVG
nnoremap <C-z> u
inoremap <C-z> <esc>ui

set nu
set mouse+=a
set updatetime=300

function! DevelopMode()
	set splitbelow
	:split | :terminal
	:resize 8
	:let g:NERDTreeMinimalUI = 1
	:let g:NERDTreeDirArrows = 1
	:let g:NERDTreeWinSize=35
	:NERDTreeToggle
endfunction
function! GotoTerminal()
	:wincmd l 
	:wincmd j 
	normal a
	tnoremap ` <C-\><C-n>
endfunction
function! CheckOpenTerminal()
	:wincmd l
	:wincmd j
	normal a
	tnoremap ` <C-\><C-n>
	let terminal_open = bufexists('*term://*')
	if !terminal_open
		:split | :term
		:resize 8
	endif
endfunction

command DevelopMode :call DevelopMode()
command CheckOpenTerminal :call CheckOpenTerminal()

autocmd VimEnter * DevelopMode
nnoremap <silent><F12> :CheckOpenTerminal<CR>

