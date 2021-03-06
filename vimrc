" Be iMproved
" Required.

set nocompatible
filetype off

" Leader to comma.
let mapleader = ","

" Fix: E353: Nothing in register *
" Src: http://stackoverflow.com/questions/25684945/pasting-in-vim-on-tmux-returns-this-error-e353-nothing-in-register
set clipboard=unnamed

" Set line numbers.
" set relativenumber
set number

" Show tabline.
set showtabline=2

" Vundle runtime path, and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle.
" Required.
" Formerly known as 'gmarik/vundle'.
Bundle 'VundleVim/Vundle.vim'

" Lorem ipsum.
Bundle 'vim-scripts/loremipsum'

" Vim wiki.
" As of May 2019, not using.
"Bundle 'vim-scripts/vimwiki.git'

" Vim fugitive.
" A Git wrapper so awesome, it should be illegal.
Bundle 'tpope/vim-fugitive'

" Vim easymotion.
" Vim motions on speed.
Bundle 'Lokaltog/vim-easymotion'

" Syntastic.
" Syntax checking hacks for vim.
" Bundle 'scrooloose/syntastic'

" Search with ack (like grep) within vim.
" Seldom use as of May 2019.
Bundle 'mileszs/ack.vim'

" CTRL-P.
Bundle 'kien/ctrlp.vim'

" Provides insert mode auto-completion for quotes, parens, brackets, etc.
Bundle 'Raimondi/delimitMate'

" Improved PHP omni-completion. Based on the default phpcomplete.vim.
Bundle 'shawncplus/phpcomplete.vim'

" For text filtering and alignment.
Bundle 'godlygeek/tabular'

Bundle 'majutsushi/tagbar'
" Bundle 'SirVer/ultisnips'
" Bundle 'joonty/vdebug'

Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-endwise'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-repeat'
Bundle 'derekwyatt/vim-scala'
" Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-surround'
Bundle 'mattn/emmet-vim'

" Unicode plugin.
" Read from: https://x-team.com/blog/inserting-unicode-characters-in-vim/
Bundle 'chrisbra/unicode.vim'

Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}

Bundle 'L9'

" Scripts src: http://vim-scripts.org/vim/scripts.html
Bundle 'FuzzyFinder'

" You complete me.
Bundle "Valloric/YouCompleteMe"
"
" Error:    YouCompleteMe unavailable: No module named builtins
" Solution: Install `future` via pip: pip install future
" Src:      https://askubuntu.com/a/728339
"
" Then, the following:
"
" Error:    YouCompleteMe unavailable: No module named frozendict
"
" Not sure about builtins and future, but the following may solve other issues
" as well, including frozendict.
"
" Solution: cd ~/.vim/bundle/YouCompleteMe
"           git submodule update --init --recursive
" Src:      https://github.com/Valloric/YouCompleteMe/issues/582
"
" Fixed.
Bundle 'maralla/completor.vim'

" Gist vim and settings.
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
let g:gist_clip_command = 'pbcopy'
let g:gist_post_private = 1
let g:gist_show_privates = 1

" Vim twig.
Bundle 'lumiliet/vim-twig'

" Vim php.
Bundle 'StanAngeloff/php.vim'

" Set colors in css, sass, and sass variables
" Bundle 'gorodinskiy/vim-coloresque'
" Workaround for incorrect word caused by gorodinskiy/vim-coloresque.
" Source: https://github.com/gorodinskiy/vim-coloresque/issues/22#issuecomment-47300121
" :set isk-=-
" :set isk-=#
" :set isk-=.
" The above doesn't work.
" Source: https://github.com/gorodinskiy/vim-coloresque/pull/30/files
" :setlocal iskeyword+=-
" :setlocal iskeyword+=#
" :setlocal iskeyword+=.
" The above doesn't work, too.
" Source: https://github.com/hauleth/vim-coloresque/commit/9d8fdd25f3b161e27331c1e5e5ba04d9d169e139
" :setl isk+=-
" :setl isk+=#
" :setl isk+=.

" Vim gitgutter.
Bundle 'airblade/vim-gitgutter'

" VimAwesome: Lightline.
Bundle 'itchyny/lightline.vim'

" Vim Gundo.
" Visualize your Vim undo tree.
Bundle 'sjl/gundo.vim'

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

" Vim easy motion map: n
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" CTRL hjkl mappings to navigate between splits.
" Source: https://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Other custom settings
set encoding=utf-8 fileencoding=utf-8 termencoding=utf-8  " saving and encoding
set nobackup nowritebackup noswapfile autoread            " no backup or swap
set hlsearch incsearch ignorecase smartcase               " search
set wildmenu                                              " completion
set backspace=indent,eol,start                            " sane backspace
set ruler 						                                    " cursor position in status bar
" set scrolloff=10 					                              " window scroll allowance
set scrolloff=999 					                              " window scroll allowance
set nowrap						                                    " default: wrap

" map: nowrap, wrap, use <F9>
" function ToggleWrap()
"   if (&wrap == 1)
"     set nowrap
"   else
"     set wrap
"   endif
" endfunction
" map <F9> :call ToggleWrap()<CR>
" map! <F9> ^[:call ToggleWrap()<CR>]

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

" Vim-colors-solarized settings
" Either set t_Co or g:solarized_termcolors
" Either set syntax enable or syntax on
" set t_Co=256
let g:solarized_termcolors=256
"syntax enable
set background=dark
colorscheme solarized

" Tagbar conf
let g:tagbar_width=30
" let g:tagbar_ctags_bin
nmap <C-T> :TagbarToggle<CR>
let g:tagbar_autofocus=1
let g:tagbar_left=1
let g:tagbar_sort=0

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
" Install this: brew install reattach-to-user-namespace
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
" let g:ctrlp_use_caching = 0
" if executable('ag')
"     set grepprg=ag\ --nogroup\ --nocolor

"     let g:ctrlp_user_command = 'ag %s --color'
" else
"   let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
"   let g:ctrlp_prompt_mappings = {
"     \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
"     \ }
" endif

" Ctrl-P settings.
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_prompt_mappings = { 'PrtExit()': ['<esc>', '<c-c>', '<c-g>'] }
let g:ctrlp_working_path_mode = ''

" Ctrl-P: Ignore .vendor, .git, .svn
" let g:ctrlp_custom_ignore = '\v[\/]\.(vendor|git|svn)$'
" let g:ctrlp_custom_ignore = '\v[\/](vendor)|(\.(git|svn))$|DS_Store\|\v[\/](node_modules)\|www/core\|www/profiles\|www/sites/default/files'
let g:ctrlp_custom_ignore = '\v[\/](vendor|node_modules|www/core|www/profiles|www/sites/default/files|www/modules/contrib|www/themes/contrib|docroot/core|docroot/profiles|docroot/sites/default/files|docroot/modules/contrib|docroot/themes/contrib)|(\.(git|svn))$|DS_Store'

" Set backup file(s) of vim buffer(s).
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" Settings for vim-gitgutter.
let g:gitgutter_override_sign_column_highlight = 0
highlight SignColumn ctermbg=234

" Vim-gitgutter: Disable all mappings for now.
" let g:gitgutter_map_keys = 0

" Vim-gitgutter: performance settings
" let g:gitgutter_realtime = 0
" let g:gitgutter_eager = 0
"
" Vim-gitgutter: Turn on line highlighting.
" let g:gitgutter_highlight_lines = 1

" As of 12 Nov. 2019, Tuesday.
" vim-gitgutter: please change your map <Plug>GitGutterNextHunk to <Plug>(GitGutterNextHunk)

" Vim-gitgutter: mappings for stage, undo, preview.
nmap ghs <Plug>(GitGutterStageHunk)
" nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)

" Vim-gitgutter: Next and previous changed hunk.
nmap gn <Plug>(GitGutterNextHunk)
nmap ga <Plug>(GitGutterPrevHunk)

" au CursorMoved * call gitgutter#preview_hunk()

hi TabLineFill ctermfg=LightGreen ctermbg=DarkGreen

" Set filetypes.
autocmd BufNewFile,BufRead *.install set ft=php
autocmd BufNewFile,BufRead *.md set ft=markdown

" ctags.
" set tags+=tags;$HOME

" Gundo.
nnoremap ge :GundoToggle<CR>
nnoremap gr :GundoShow<CR>:GundoHide<CR>:GundoRenderGraph<CR>

" Discovery: for map <gp>. Originally, this is in one hunk with nerdtree.
" map <gp> :hardcopy<CR>

" Ultisnips.
" Setup by @dsdeiz.
"let g:UltiSnipsExpandTrigger="<c-j>"

" XML formatter.
function! DoFormatXML() range
	" Save the file type
	let l:origft = &ft

	" Clean the file type
	set ft=

	" Add fake initial tag (so we can process multiple top-level elements)
	exe ":let l:beforeFirstLine=" . a:firstline . "-1"
	if l:beforeFirstLine < 0
		let l:beforeFirstLine=0
	endif
	exe a:lastline . "put ='</PrettyXML>'"
	exe l:beforeFirstLine . "put ='<PrettyXML>'"
	exe ":let l:newLastLine=" . a:lastline . "+2"
	if l:newLastLine > line('$')
		let l:newLastLine=line('$')
	endif

	" Remove XML header
	exe ":" . a:firstline . "," . a:lastline . "s/<\?xml\\_.*\?>\\_s*//e"

	" Recalculate last line of the edited code
	let l:newLastLine=search('</PrettyXML>')

	" Execute external formatter
	exe ":silent " . a:firstline . "," . l:newLastLine . "!xmllint --noblanks --format --recover -"

	" Recalculate first and last lines of the edited code
	let l:newFirstLine=search('<PrettyXML>')
	let l:newLastLine=search('</PrettyXML>')
	
	" Get inner range
	let l:innerFirstLine=l:newFirstLine+1
	let l:innerLastLine=l:newLastLine-1

	" Remove extra unnecessary indentation
	exe ":silent " . l:innerFirstLine . "," . l:innerLastLine "s/^  //e"

	" Remove fake tag
	exe l:newLastLine . "d"
	exe l:newFirstLine . "d"

	" Put the cursor at the first line of the edited code
	exe ":" . l:newFirstLine

	" Restore the file type
	exe "set ft=" . l:origft
endfunction
command! -range=% FormatXML <line1>,<line2>call DoFormatXML()

nmap <silent> <leader>x :%FormatXML<CR>
vmap <silent> <leader>x :FormatXML<CR>

" Fix Python Path (for YCM)
" let g:ycm_path_to_python_interpreter="/usr/local/bin/python"
" let g:ycm_path_to_python_interpreter="/usr/local/bin/python3"
