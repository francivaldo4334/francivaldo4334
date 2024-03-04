
  "============================================================
  " Plugins
  "============================================================
  call plug#begin()
    Plug 'preservim/nerdtree'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ryanoasis/vim-devicons'
    Plug 'sheerun/vim-polyglot'
    Plug 'ryanoasis/vim-devicons'
    Plug 'sainnhe/sonokai'
    Plug 'honza/vim-snippets'
    Plug 'jiangmiao/auto-pairs'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    
  call plug#end()

  "============================================================
  " General
  "============================================================

  " Editing
  set tabstop=2        " The width of a TAB is set to 4.
  set shiftwidth=2     " Indents will have a width of 4.
  set softtabstop=2    " Sets the number of columns for a TAB.
  set expandtab        " Expand TABs to spaces.
  set nowrap           " do not automatically wrap on load
  set formatoptions-=t " do not automatically wrap text when typing
  set nu               " Sets linenumbers
  set noequalalways    " This will cause vim to size each new split relative the current split
  set list             " Hide invisible characters
  set mouse+=a         " Add mouse support
  colorscheme sonokai
  inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  nnoremap <C-a> ggVG
  nnoremap <C-c> "+y<CR>
  "============================================================
  " COC is an intellisense engine for Vim/Neovim.
  "============================================================

  " Give more space for displaying messages.
  set cmdheight=2

  " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
  " delays and poor user experience.
  set updatetime=300

  " Don't pass messages to |ins-completion-menu|.
  set shortmess+=c

  " Always show the signcolumn, otherwise it would shift the text each time
  " diagnostics appear/become resolved.
  set signcolumn=yes

  "============================================================
  " Set Developmode (like VSCode)
  "============================================================

  function! DevelopMode()
    set splitbelow
    :split | :terminal
    :resize 8
    :let g:NERDTreeMinimalUI = 1
    :let g:NERDTreeDirArrows = 1
    :let g:NERDTreeWinSize=35
    :NERDTreeToggle
  endfunction

  function! NewTab()
    :tabnew NewTab
    :DevelopMode
  endfunction

  function! GotoTerminal()
    :wincmd l 
    :wincmd j 
    normal a
    tnoremap ` <C-\><C-n>
  endfunction

  function! GotoEditor()
    :wincmd l 
    :wincmd k 
    imap ` <Esc>
  endfunction

  function! GotoFiletree()
    :wincmd h 
    imap ` <Esc>
  endfunction

  function! ExitNeovim()
    :qa!
  endfunction

  command DevelopMode  :call DevelopMode()
  command GotoTerminal :call GotoTerminal()
  command GotoFiletree :call GotoFiletree()
  command GotoEditor   :call GotoEditor()
  command ExitNeovim   :call ExitNeovim()
command NewTab       :call NewTab()
command ExitTerminal :call ExitTerminal()

nnoremap <F1> :tabnext<enter>
nnoremap <F5> :DevelopMode<enter>
nnoremap <C-n> :NewTab<enter>
nnoremap <A-1> :GotoFiletree<enter>
nnoremap <F12> :GotoTerminal<enter>
nnoremap <F11> :GotoEditor<enter>
nnoremap <F9> :ExitNeovim<enter>

nnoremap <A-n> :NewTab<enter>
nnoremap <A-h> :GotoFiletree<enter>
nnoremap <A-j> :GotoTerminal<enter>
nnoremap <A-k> :GotoEditor<enter>
nnoremap <A-l> :tabnext<enter>

" Hide root path name
augroup nerdtreehidecwd
        autocmd!
        autocmd FileType nerdtree syntax match NERDTreeHideCWD #^[</].*$# conceal
augroup endremap <A-1> :GotoFiletree<enter>
nnoremap <F12> :GotoTerminal<enter>
nnoremap <F11> :GotoEditor<enter>
nnoremap <F9> :ExitNeovim<enter>

nnoremap <A-n> :NewTab<enter>
nnoremap <A-h> :GotoFiletree<enter>
nnoremap <A-j> :GotoTerminal<enter>
nnoremap <A-k> :GotoEditor<enter>
nnoremap <A-l> :tabnext<enter>

" Hide root path name
augroup nerdtreehidecwd
        autocmd!
        autocmd FileType nerdtree syntax match NERDTreeHideCWD #^[</].*$# conceal
augroup end
