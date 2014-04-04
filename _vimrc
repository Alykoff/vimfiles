"behave mswin
"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
" Turn off filetype plugins before bundles init
set nocompatible
filetype off

" Убрать toolbar
set guioptions-=T
 
" Убрать меню
"set guioptions-=m
 
" Auto installing NeoNeoBundle
"let iCanHazNeoBundle=1
let vundle_readme=expand('%HOMEPATH%/.vim/bundle/vundle/README.md')
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
 
"--------------------------------------------------
" Bundles
 
" Let NeoNeoBundle manage NeoNeoBundle
"NeoBundle 'Shougo/neobundle.vim'
 
" plugin for fuzzy file search, most recent files list
" and much more
Bundle 'Shougo/unite.vim'
 
" Default snippets
Bundle 'honza/vim-snippets'
 
" Colorscheme solarazied for vim
Bundle 'altercation/vim-colors-solarized'
 
" Great file system explorer, it appears when you open dir in vim
" Allow modification of dir, and may other things
" Must have
Bundle 'scrooloose/nerdtree'
 
" Add smart commands for comments like:
" gcc - Toggle comment for the current line
" gc - Toggle comments for selected region or number of strings
" Very usefull
Bundle 'tomtom/tcomment_vim'
 
" HTML5 + inline SVG omnicomplete funtion, indent and syntax for Vim.
Bundle 'othree/html5.vim'
 
" Nice statusline/ruler for vim
Bundle 'bling/vim-airline'
 
" Improve javascritp syntax higlighting, needed for good folding,
" and good-looking javascritp code
Bundle 'jelera/vim-javascript-syntax'
 
" HTML5 + inline SVG omnicomplete funtion, indent and syntax for Vim.
Bundle 'othree/html5.vim'
 
" Highlights the matching HTML tag when the cursor
" is positioned on a tag.
Bundle 'gregsexton/MatchTag'
 
" Add Support css3 property
Bundle 'hail2u/vim-css3-syntax'
 
" Smart indent for javascript
" http://www.vim.org/scripts/script.php?script_id=3081
Bundle 'lukaszb/vim-web-indent'
 
" Nice statusline/ruler for vim
Bundle 'bling/vim-airline'
 
 
" Improve javascritp syntax higlighting, needed for good folding,
" and good-looking javascritp code
Bundle 'jelera/vim-javascript-syntax'
 
" Code complete
Bundle 'Shougo/neocomplcache.vim'
 
 
" Enable Indent in plugins
filetype plugin indent on
" Enable syntax highlighting
syntax on
 
set guifont=DejaVu\ Sans\ Mono:h12
 
" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
"NeoBundleCheck
 
" from https://github.com/L0stSoul/vim-config/blob/master/.vimrc
 
"-------------------------
" neocomplcache
 
" Enable NeocomplCache at startup
let g:neocomplcache_enable_at_startup = 1
 
" Max items in code-complete
let g:neocomplcache_max_list = 10
 
" Max width of code-complete window
let g:neocomplcache_max_keyword_width = 80
 
" Code complete is ignoring case until no Uppercase letter is in input
let g:neocomplcache_enable_smart_case = 1
 
" Auto select first item in code-complete
let g:neocomplcache_enable_auto_select = 1
 
" Disable auto popup
let g:neocomplcache_disable_auto_complete = 1
 
" Smart tab Behavior
function! CleverTab()
" If autocomplete window visible then select next item in there
	if pumvisible()
		return "\<C-n>"
	endif
" If it's begining of the string then return just tab pressed
	let substr = strpart(getline('.'), 0, col('.') - 1)
	let substr = matchstr(substr, '[^ \t]*$')
	if strlen(substr) == 0
" nothing to match on empty string
		return "\<Tab>"
	else
" If not begining of the string, and autocomplete popup is not visible
" Open this popup
		return "\<C-x>\<C-u>"
	endif
endfunction
inoremap <expr><TAB> CleverTab()
 
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
 
" For cursor moving in insert mode
inoremap <expr><Left> neocomplcache#close_popup() . "\<Left>"
inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
inoremap <expr><Up> neocomplcache#close_popup() . "\<Up>"
inoremap <expr><Down> neocomplcache#close_popup() . "\<Down>"
 
" disable preview in code complete
set completeopt-=preview
 
 
 
"--------------------------------------------------
" Colorscheme
 
" Use solarized colorscheme
colorscheme solarized "desert
 
" Setting up light color scheme
if has('gui_running')
	set background=light
else
	set background=dark
endif
 
" set highlighting for colorcolumn
highlight ColorColumn ctermbg=lightGrey
 
" Auto reload changed files
set autoread
 
" Indicates fast terminal connection
set ttyfast
 
" Set character encoding to use in vim
set encoding=utf-8
 
" Let vim know what encoding we use in our terminal
set termencoding=utf-8
 
" Which EOl used. For us it's unix
" Not works with modifiable=no
if &modifiable
	set fileformat=unix
endif
 
" Use 256 colors in vim
" vim-airline not work without it
set t_Co=256
 
"--------------------------------------------------
" Display options
 
 
" Hide showmode
" Showmode is useless with airline
set noshowmode
 
"-------------------------
" vim-airline
 
" Colorscheme for airline
let g:airline_theme='understated'
 
" Set custom left separator
let g:airline_left_sep = '<'
 
" Set custom right separator
let g:airline_right_sep = '>'
 
" Enable airline for tab-bar
let g:airline#extensions#tabline#enabled = 1
 
" Don't display buffers in tab-bar with single tab
let g:airline#extensions#tabline#show_buffers = 0
 
" Display only filename in tab
let g:airline#extensions#tabline#fnamemod = ':t'
 
" Don't display encoding
let g:airline_section_y = ''
 
" Don't display filetype
let g:airline_section_x = ''
 
"-------------------------
 
" Show file name in window title
set title
 
" Mute error bell
set novisualbell
 
" Setting up how to display whitespace characters
"set listchars=tab:?\ ,trail:·,extends:?,precedes:?,nbsp:~
 
" Enable display whitespace characters
"set list
 
" Numbers of rows to keep to the left and to the right off the screen
set scrolloff=10
 
" Numbers of columns to keep to the left and to the right off the screen
set sidescrolloff=10
 
" Indicate that last window have a statusline too
set laststatus=2
 
" Display command which you typing and other command related stuff
set showcmd
 
" To save, ctrl-s.
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a
 
" Display Line numbers
set number
 
" Highlight line with cursor
set cursorline
 
" maximum text length, vim automatically breaks longer lines
set textwidth=100
 
" higlight column right after max textwidth
set colorcolumn=+1
 
" The cursor should stay where you leave it, instead of moving to the first non
" blank of the line
set nostartofline
 
"--------------------------------------------------
" Tab options
 
" Copy indent from previous line
set autoindent
 
" Enable smart indent. it add additional indents whe necessary
set smartindent
 
" Replace tabs with spaces
set expandtab
 
" Whe you hit tab at start of line, indent added according to shiftwidth value
set smarttab
 
" number of spaces to use for each step of indent
set shiftwidth=4
 
" Number of spaces that a Tab in the file counts for
set tabstop=4
 
" Same but for editing operation (not shure what exactly does it means)
" but in most cases tabstop and softtabstop better be the same
set softtabstop=4
 
" Round indent to multiple of 'shiftwidth'.
" Indentation always be multiple of shiftwidth
" Applies to < and > command
set shiftround
 
"--------------------------------------------------
" Wildmenu
 
" Extended autocmpletion for commands
set wildmenu
 
" Autocmpletion hotkey
set wildcharm=<TAB>
 
"--------------------------------------------------
" Diff Options
 
" Display filler
set diffopt=filler
 
" Open diff in horizontal buffer
set diffopt+=horizontal
 
" Ignore changes in whitespaces characters
set diffopt+=iwhite
 
" -------------------------------------------------
cd C:\work

