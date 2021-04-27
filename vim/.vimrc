" execute pathogen#infect()
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" Palenight theme
Plugin 'drewtempelmeyer/palenight.vim'

" Gruvbox theme
Plugin 'morhetz/gruvbox'

" CtrlP for fuzzy file search
Plugin 'ctrlpvim/ctrlp.vim'

" pipenv support
" Plugin 'plytophogy/vim-virtualenv'
" Plugin 'PieterjanMontens/vim-pipenv'

" File tree browser
Plugin 'scrooloose/nerdtree'

" Git integration
Plugin 'tpope/vim-fugitive'

" Powererline status bar
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}

call vundle#end()
filetype plugin indent on



" New panes go on the bottom or the right
set splitbelow
set splitright


" Move more easily between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable code folding with spacebar
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin on
syntax on
set modelines=0
set tabstop=4
set noexpandtab
set shiftwidth=4
set softtabstop=4
set encoding=utf-8
set colorcolumn=80
set autoindent
set smartindent
set backspace=indent,eol,start
set laststatus=2
" Use UTF-8
set encoding=utf-8
" set relative line numbers
set relativenumber number


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python
" Set up PEP8 rules
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.py set tabstop=4
au BufNewFile,BufRead *.py set softtabstop=4
au BufNewFile,BufRead *.py set shiftwidth=4
au BufNewFile,BufRead *.py set textwidth=79
au BufNewFile,BufRead *.py set expandtab
au BufNewFile,BufRead *.py set autoindent
au BufNewFile,BufRead *.py set fileformat=unix


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Markdown
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.md set textwidth=79


" set Vim-specific sequences for RGB colors
" These two lines fix color in simple-terminal.
" https://stackoverflow.com/questions/61081231/st-vim-no-colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

if has("gui_running")
    set guifont=Droid\ Sans\ Mono\ 11 
    colorscheme spring-night
else
	set termguicolors
    set background=dark
"    colorscheme palenight
    colorscheme gruvbox
"	let ayucolor="mirage"
"    colorscheme ayu
endif


" configure status bar
" see https://github.com/itchyny/lightline.vim
let g:lightline = { 
	\ 'colorscheme': 'palenight',
\ }
set noshowmode


" Ignore files in .gitignore for Ctrl-P
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']


" Run ctags when saving .go files
autocmd BufWritePost *.go let msg=system('ctags -R') | if msg!="" | echo msg | endif


" Taken from arch wiki
" https://wiki.archlinux.org/index.php/St
if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also https://sunaku.github.io/vim-256color-bce.html
    set t_ut=
endif
