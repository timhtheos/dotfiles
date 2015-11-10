" Be iMproved
" required
set nocompatible
filetype off

" Leader to comma
let mapleader = ","

" Set line numbers
set number
set relativenumber

" Vundle runtime path, and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle
" required
Bundle 'gmarik/vundle'

" lorem ipsum
Bundle 'vim-scripts/loremipsum'

" Vim wiki
Bundle 'vim-scripts/vimwiki.git'

" From Github
Bundle 'tpope/vim-fugitive'
"Bundle 'sjl/splice' " alt to fugitive; previously called threesome
Bundle 'Lokaltog/vim-easymotion'

Bundle 'scrooloose/nerdtree'
"Bundle 'scrooloose/syntastic'

Bundle 'mileszs/ack.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'Raimondi/delimitMate'
Bundle 'shawncplus/phpcomplete.vim'
Bundle 'godlygeek/tabular'
Bundle 'majutsushi/tagbar'
Bundle 'SirVer/ultisnips'
Bundle 'joonty/vdebug'

" Misaligned with powerline
"Bundle 'bling/vim-airline'

Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-commentary'
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

" Scripts src: http://vim-scripts.org/vim/scripts.html
Bundle 'FuzzyFinder'

" You complete me 
Bundle "Valloric/YouCompleteMe"

" Powerline
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" Gist vim
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
let g:gist_clip_command = 'pbcopy'
let g:gist_post_private = 1
let g:gist_show_privates = 1

" Vim Notes
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-notes'

" Vim twig
Bundle 'evidens/vim-twig'

" Set colors in css, sass, and sass variables
Bundle 'gorodinskiy/vim-coloresque'

" Vim gitgutter
Bundle 'vim-gitgutter'

" End vundle plugins
call vundle#end()

" Filetype plugin indent on
" required
" To ignore plugin indent changes, instead use:
" Enabled for vimwiki
filetype plugin on
" Otherwise, the above (filetype plugin indent on)

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

"""
" Vundle custom settings

" Start nertTree automatically when there's no file defined
"autocmd vimenter * if !argc() | NERDTree | endif

" Nerdtree map: ctrl n
map <C-n> :NERDTreeToggle<CR>

" Vim easy motion map: s jk
nmap s <Plug>(easymotion-s)
"let g:EasyMotion_smartcase = 1
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Vim easy motion map: n
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" Other custom settings
set encoding=utf-8 fileencoding=utf-8 termencoding=utf-8  " saving and encoding
set nobackup nowritebackup noswapfile autoread            " no backup or swap
set hlsearch incsearch ignorecase smartcase               " search
set wildmenu                                              " completion
set backspace=indent,eol,start                            " sane backspace
set ruler 						                                    " cursor position in status bar
set scrolloff=10 					                                " window scroll allowance
set nowrap						                                    " default: wrap

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

" Set cursorlines, cursorcolumns
set cursorline
"set cursorcolumn

" set line marker on the 72nd, and bgcolor starting 81st (same color)
let &colorcolumn="73,".join(range(81,81),",")

" Indentions and spacings
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

" FZF as vim plugin
set rtp+=~/.fzf

" Powerline conf
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

" Vim-colors-solarized settings
" or: set t_Co=256
let g:solarized_termcolors=256
" or: syntax on
syntax enable
colorscheme solarized
set background=dark

" Tagbar conf
let g:tagbar_width=30
" let g:tagbar_ctags_bin
nmap <F8> :TagbarToggle<CR>

" Indent Guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd ctermbg=none
hi IndentGuidesEven ctermbg=235

" Escape keys: jk and JK
inoremap jk <esc>
inoremap JK <esc>

" Do not move cursor position 1 character to the left from Insert mode to
" Normal mode
" Source: http://vim.wikia.com/wiki/Prevent_escape_from_moving_the_cursor_one_character_to_the_left
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

" Set cursor to blinking upright bar cursor in INSERT mode,
" And, a blinking block in NORMAL mode
" Source: https://www.reddit.com/r/vim/comments/2of45a/terminal_vim_changing_cursor_shape_on_linux/
if &term == 'xterm-256color' || &term == 'screen-256color'
  let &t_SI = "\<Esc>[5 q"
  let &t_EI = "\<Esc>[1 q"
endif
if exists('$TMUX')
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
endif

" Set paste-mode automatic when pasting
" There will be no need to :set paste when pasting multiple lines.
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
return ""
endfunction

" Yank to clipboard
" Source: http://superuser.com/a/901526
if has('clipboard')
  if has('unnamedplus')
    " When possible use + register for copy-paste
    set clipboard=unnamed,unnamedplus
  else
    " On mac and Windows, use * register for copy-paste
    set clipboard=unnamed
  endif
endif

" Set spell checker, lang
set spell
windo set spelllang=en_gb,en_us

" Make Ctrl-P plugin a lot faster for git repositories
let g:ctrlp_use_caching = 0
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor

    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
    \ }
endif

" Ctrl-P settings
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_prompt_mappings = { 'PrtExit()': ['<esc>', '<c-c>', '<c-g>'] }
let g:ctrlp_working_path_mode = ''

" Ctrl-P: Ignore .vendor, .git, .svn
"let g:ctrlp_custom_ignore = '\v[\/]\.(vendor|git|svn)$'
let g:ctrlp_custom_ignore = '\v[\/](vendor)|(\.(git|svn))$'

" Set backup file(s) of vim buffer(s)
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" Settings for vim-gitgutter
let g:gitgutter_override_sign_column_highlight = 0
highlight SignColumn ctermbg=234

" Vim-gitgutter: Disable all mappings for now
let g:gitgutter_map_keys = 0

" Vim-gitgutter: performance settings
"let g:gitgutter_realtime = 0
"let g:gitgutter_eager = 0
