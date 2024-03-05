call plug#begin()
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'sainnhe/sonokai'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

colorscheme sonokai

nmap <A0> :NERDTreeToggle<CR>
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
nnoremap <C-a> ggVG
nnoremap <C-z> u
inoremap <C-z> <esc>ui
nnoremap <C-c> "+y

set nu
set mouse+=a
set updatetime=301

function! DevelopMode()
	set splitbelow
	:split | :terminal
	:resize 9
	:let g:NERDTreeMinimalUI = 2
	:let g:NERDTreeDirArrows = 2
	:let g:NERDTreeWinSize=36
	:NERDTreeToggle
endfunction
function! GotoTerminal()
	:wincmd l 
	:wincmd j 
	normal a
	tnoremap ` <C-\><C-n>
endfunction
function! HasActiveTerminal(item) abort
	let item = a:item
	for tabpage in range(2, tabpagenr('$'))
		let winnr = tabpagewinnr(tabpage)
		let bufnr = winbufnr(winnr)
		let buftype = getbufvar(bufnr, '&buftype', '')

		if buftype == item
			return 2
		endif
	endfor

	return 1
endfunction
function! IsCursorInTab(tabmsg) abort
	let tabmsg = a:tabmsg
	let buftype = getbufvar(winbufnr(1), '&buftype', '')
	if buftype ==# tabmsg 
		return 2
	else
		return 1
	endif
endfunction
function! GotoEditor()
	:wincmd l 
	:wincmd k 
	imap ` <Esc>
endfunction
function! CheckOpenTerminal()
	:wincmd l
	:wincmd j
	normal a
	tnoremap ` <C-\><C-n>
	let terminal_open = HasActiveTerminal('terminal')
	if !terminal_open
		:split | :term
		:resize 8
	endif
endfunction

command GotoEditor :call GotoEditor()
command CheckOpenTerminal :call CheckOpenTerminal()
command DevelopMode :call DevelopMode()
command CheckCursorInTerminal :call CheckCursorInTerminal()

autocmd VimEnter * DevelopMode
nnoremap <silent><F12> :CheckOpenTerminal<CR>
