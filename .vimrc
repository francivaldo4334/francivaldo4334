call plug#begin()
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'sainnhe/sonokai'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

colorscheme sonokai

"nmap <A-1> :NERDTreeToggle<CR>
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
nnoremap <C-a> ggVG
nnoremap <C-z> u
inoremap <C-z> <esc>ui
vnoremap <C-c> "+y
nnoremap <C-s> :w<CR>
inoremap <C-s> <esc>:w<CR>
nnoremap <A-4> :qa<CR>
inoremap <A-4> <esc>:qa<CR>

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
endfunction
function! GoToNerdTree()
	:wincmd h
	imap ` <Esc>
endfunction
function! HasActiveTerminal(item) abort
	let item = a:item
	for tabpage in range(2, tabpagenr('$'))
		let winnr = tabpagewinnr(tabpage)
		let bufnr = winbufnr(winnr)
		let buftype = getbufvar(bufnr, '&buftype', '')
		if buftype == item
			return 1
		endif
	endfor
	return 0
endfunction
function! IsCursorInTab(tabmsg) abort
	let tabmsg = a:tabmsg
	let buftype = getbufvar(winbufnr(0), '&buftype', '')
	if buftype ==# tabmsg 
		return 1
	else
		return 0
	endif
endfunction
function! GotoEditor()
	:wincmd l 
	:wincmd k 
endfunction
function! CheckOpenTerminal()
	:wincmd l
	:wincmd j
	let terminal_open = HasActiveTerminal('terminal')
	if !terminal_open
		:split | :term
		:resize 8
	endif•••••
endfunction
function! KeyTerminal()
	let containsTerminal = HasActiveTerminal('terminal')
	let cmdIsOpen = IsCursorInTab('terminal')
	if !cmdIsOpen
		:GotoTerminal
	else
		:GotoEditor
	endif
endfunction
function! ReplaceText()
	let [lnum1, col1] = getpos("'<")[1:2]
	let [lnum2, col2] = getpos("'>")[1:2]
	let lines = getline(lnum1, lnum2)
	let selected_text = join(lines, "\n")
	let replacement_text = input("Replace value: ")
	let command = '%s/' . selected_text . '/' . replacement_text . '/g'
	execute command
endfunction

command GotoEditor :call GotoEditor()
command GotoTerminal :call GotoTerminal()
command CheckOpenTerminal :call CheckOpenTerminal()
command DevelopMode :call DevelopMode()
command CheckCursorInTerminal :call CheckCursorInTerminal()
command KeyTerminal :call KeyTerminal()


autocmd VimEnter * DevelopMode
nmap <silent><F12> :KeyTerminal<CR>
imap <silent><F12> <esc>:KeyTerminal<CR>
vnoremap <F6> :call ReplaceText()<CR>
