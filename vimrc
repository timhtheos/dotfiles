set nocompatible              " be iMproved, required
filetype off                  " required

" Leader to comma ,
let mapleader = ","

" Vundle runtime path, and initialize
"set rtp+=/Users/timothy/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

" lorem ipsum
Bundle 'vim-scripts/loremipsum'

" vimwiki
Bundle 'vim-scripts/vimwiki.git'

" from Github
Bundle 'tpope/vim-fugitive'
"Bundle 'sjl/splice' " alt to fugitive; previously called threesome
Bundle 'Lokaltog/vim-easymotion'
"Bundle 'tpope/vim-rails.git'     " temp disabled
"Bundle 'Valloric/YouCompleteMe'

Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'

Bundle 'mileszs/ack.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'Raimondi/delimitMate'
Bundle 'trapd00r/neverland-vim-theme'
Bundle 'shawncplus/phpcomplete.vim'
Bundle 'godlygeek/tabular'
Bundle 'majutsushi/tagbar'
Bundle 'SirVer/ultisnips'
Bundle 'joonty/vdebug'
"Bundle 'bling/vim-airline'     " misalignment with powerline
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-commentary'
Bundle 'dsdeiz/vim-drupal-snippets'
Bundle 'tpope/vim-endwise'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-repeat'
Bundle 'derekwyatt/vim-scala'
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-surround'
Bundle 'mattn/emmet-vim'

Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}

Bundle 'L9'
" scripts from http://vim-scripts.org/vim/scripts.html
Bundle 'FuzzyFinder'

" YouCompleteMe
Bundle "Valloric/YouCompleteMe"

" Powerline
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" The above is disabled by July 10, 2015, Fri at 4 AM in favor of Vim Airline

" gist-vim
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
let g:gist_clip_command = 'pbcopy'
let g:gist_post_private = 1
let g:gist_show_privates = 1

" geeknote
Bundle 'VitaliyRodnenko/geeknote'

call vundle#end()

" filetype plugin indent on     " required
" To ignore plugin indent changes, instead use:
filetype plugin on " I enabled this due to vimwiki, 
" otherwise, the above (filetype plugin indent on)
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.
" Put your stuff after this line


"""""""
" Vundle custom settings

" start nertTree automatically when there's no file defined
"autocmd vimenter * if !argc() | NERDTree | endif

" nerdtree ctrl n
map <C-n> :NERDTreeToggle<CR>

" vim-easymotion s jk
nmap s <Plug>(easymotion-s)
"let g:EasyMotion_smartcase = 1
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" vim-easymotion n
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)


"""""""
" Other custom settings
set encoding=utf-8 fileencoding=utf-8 termencoding=utf-8  " saving and encoding
set nobackup nowritebackup noswapfile autoread            " no backup or swap
set hlsearch incsearch ignorecase smartcase               " search
set wildmenu                                              " completion
set backspace=indent,eol,start                            " sane backspace
set ruler 						  " cursor position in status bar
set number 						  " cursor absolute line #
set scrolloff=10 					  " window scroll allowance

" wrap
set nowrap						  " default: wrap

" map: nowrap, wrap, use <F9>
function ToggleWrap()
	if (&wrap == 1)
		set nowrap
	else
		set wrap
	endif
endfunction
map <F9> :call ToggleWrap()<CR>
map! <F9> ^[:call ToggleWrap()<CR>]

" appearance
syntax on
set background=dark
set t_Co=256 " 256 colors in terminal

" indent
let g:indent_guides_auto_colors = 1

" main bg color
"highlight Normal ctermfg=grey ctermbg=darkblue

" line number bg
highlight LineNr ctermbg=grey ctermfg=black

" cursorline and cursorcolumn
" these 2 lines seems to remove the white underline in cursorline
hi CursorLine cterm=NONE ctermbg=darkred guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
" map: show/hide cursorline/cursorcolumn
:nnoremap H :set cursorline! cursorcolumn!<CR>

" ctermbg 235
highlight ColorColumn ctermbg=blue guibg=#2c2d27
highlight CursorLine ctermbg=grey guibg=#2c2d27
highlight CursorColumn ctermbg=white guibg=#2c2d27

" set line marker on the 72nd, and bgcolor starting 81st (same color)
let &colorcolumn="73,".join(range(81,81),",")

" this is for tab to use spaces, herein 2 spaces
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

" fzf as vim plugin
set rtp+=~/.fzf

" Powerline conf
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

" tagbar conf
let g:tagbar_width=30
" let g:tagbar_ctags_bin
nmap <F8> :TagbarToggle<CR>

" Indent Guides
let g:indent_guides_enable_on_vim_startup = 1

" Escape key map
":inoremap <esc> <Nop>
":unmap <esc>
":unmap! <esc>
"inoremap jk <esc>l
"inoremap jk <C-c>l
inoremap jk <esc>
" below taken from http://vim.wikia.com/wiki/Prevent_escape_from_moving_the_cursor_one_character_to_the_left
let CursorColumnI = 0 "the cursor column position in INSERT
autocmd InsertEnter * let CursorColumnI = col('.')
autocmd CursorMovedI * let CursorColumnI = col('.')
autocmd InsertLeave * if col('.') != CursorColumnI | call cursor(0, col('.')+1) | endif

" Disable arrow keys
" ESC key cannot be disabled though
" see http://stackoverflow.com/questions/8488232/how-to-disable-esc-and-cursor-keys-in-vim
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
nnoremap <Left>  <NOP>
nnoremap <Right> <NOP>
nnoremap <Up>    <NOP>
nnoremap <Down>  <NOP>
