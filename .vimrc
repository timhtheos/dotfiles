"
" Herein I use Vundle, vundle settings, and my personal settings
"

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" alternatively, pass a path where Vundle should install bundles
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

" from Github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
" temp disabled: Bundle 'tpope/vim-rails.git'

Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
" Bundle 'Lokaltog/vim-easymotion'

" from Arnold's list
Bundle 'mileszs/ack.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'Raimondi/delimitMate'
" Bundle 'tpope/vim-fugitive'
" nerdtree already in the list above
Bundle 'trapd00r/neverland-vim-theme'
Bundle 'shawncplus/phpcomplete.vim'
" syntastic already in the list above
Bundle 'godlygeek/tabular'
Bundle 'majutsushi/tagbar'
Bundle 'SirVer/ultisnips'
Bundle 'joonty/vdebug'
Bundle 'bling/vim-airline'
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

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" scripts from http://vim-scripts.org/vim/scripts.html
Bundle 'L9'
Bundle 'FuzzyFinder'
" scripts not on GitHub
"Bundle 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Bundle 'file:///home/gmarik/path/to/plugin'
" ...

filetype plugin indent on     " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.
" Put your stuff after this line

"""""""""""""""""""""""""""""""""""
" Vundle custom settings //tae
"

" start nertTree automatically when vim is started when there is no file specified
autocmd vimenter * if !argc() | NERDTree | endif

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


""""""""""""""""""""""""""""""""""
" Custom settings //tae
"

" most from https://github.com/justinforce/dotfiles/blob/master/files/vim/vimrc
set encoding=utf-8 fileencoding=utf-8 termencoding=utf-8  " saving and encoding
set nobackup nowritebackup noswapfile autoread            " no backup or swap
set hlsearch incsearch ignorecase smartcase               " search
set wildmenu                                              " completion
set backspace=indent,eol,start                            " sane backspace
set ruler 						                                    " cursor position in status bar
set number 						                                    " cursor absolute line #
set scrolloff=10 					                                " window scroll allowance
" show a vertical line at the 79th character, seens not working
"set textwidth=20
"set cursorline 						                              " highlight the current line
"set cursorcolumn 					                              " highlight the current line
"set laststatus=1 					                              " always show status bar

" wrap
set nowrap						                                    " wrap
"set wrap 						                                    " wrap, default i think
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
"set guifont=Ubuntu\ Mono\ 11

" indent
let g:indent_guides_auto_colors = 1
"hi IndentGuidesOdd ctermbg=blue
"hi IndentGuidesEven ctermbg=darkgrey

" main background color
"highlight Normal ctermfg=grey ctermbg=darkblue

" line number background
"highlight LineNr ctermbg=darkgrey
"highlight LineNr ctermbg=grey ctermfg=darkgrey
highlight LineNr ctermbg=grey ctermfg=black

" cursorline and cursorcolumn
" these 2 lines seems to remove the white underline in cursorline
"hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi CursorLine cterm=NONE ctermbg=darkred guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
" map: show/hide cursorline/cursorcolumn
:nnoremap H :set cursorline! cursorcolumn!<CR>

" ctermbg 235
highlight ColorColumn ctermbg=blue guibg=#2c2d27
highlight CursorLine ctermbg=grey guibg=#2c2d27
highlight CursorColumn ctermbg=white guibg=#2c2d27

" set line marker on the 72nd, and bgcolor starting 81st (same color)
let &colorcolumn="72,".join(range(81,999),",")

" this is for tab to use spaces, herein 2 spaces
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
