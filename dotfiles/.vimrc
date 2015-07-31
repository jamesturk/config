""" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'fatih/vim-go'
Plugin 'kien/ctrlp.vim'
Plugin 'klen/python-mode'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'int3/vim-extradite'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/html5.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
call vundle#end()
filetype plugin indent on

""" map ;; to <Esc>
imap ;; <Esc>

""" tab settings, 4 space tabs, always.
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent

""" modeline
set showcmd    " show partial command in visual mode
set showmode   " show mode on last line
set ruler      " line & column number of cursor

""" other settings
set title        " set title of window
set number       " show line numbers
set hidden       " allow editing multiple buffers
set scrolloff=5  " keep 5 lines visible above/below cursor
set splitbelow   " make window splits flow more naturally
set splitright
set ignorecase   " ignore case in search
set smartcase    " ...unless we specify capital letters
set incsearch    " highlight as we search
set autochdir    " set pwd to local file, so edit paths are relative
set wildmenu     " nice autocomplete menu
set list         " show whitespace
set listchars=tab:»\ ,trail:\ 
autocmd filetype go set listchars=tab:\ \ ,trail:\ 
set virtualedit=block     " allow editing in virtual space in block mode
"set directory=~/.vimtmp   " keep all tempfiles in same dir
" work with X11 clipboard(?)
set clipboard=unnamedplus
set colorcolumn=100

let g:pymode_options_max_line_length = 99
let g:pymode_folding = 0
let g:pymode_doc = 0
let g:pymode_virtualenv = 0
let g:pymode_lint_on_write = 0
let g:pymode_rope = 0

"let g:notes_directories = ['~/Dropbox/notes']
let g:notes_suffix = '.txt'

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

""" color scheme
set t_Co=256
colorscheme busybee
syntax on            " use syntax color highlighting
filetype plugin indent on
highlight ColorColumn ctermbg=237

""" autocompletion
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd BufRead,BufNewFile *.json setfiletype json
autocmd BufRead,BufNewFile *.{md,markdown} setfiletype markdown
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2
"autocmd FileType python set complete+=k/home/james/.vim/pydiction/pydiction iskeyword+=.
"autocmd FileType python highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"autocmd FileType python match OverLength /\%80v.\+/

""" config for plugins
" ctrlp only autocompletes things in git if we're in a .git dir
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files']
" python specific settings, highlight everything & use slow sync
let python_highlight_all=1
let python_slow_sync=1
let g:used_javascript_libs = 'angularjs'

""" custom commands

" removes trailing spaces
function! TrimSpace()
  %s/\s*$//
  ''
:endfunction
command! -bar -nargs=0 TrimSpace call TrimSpace()

""" translation stuff from https://github.com/rory/django-template-i18n-lint/
" select some text in visual mode, then call the e macro on it (e.g. press
" @e), and it'll wrap that text in {% blocktrans %}/{% endblocktrans %}
let @e = "`>a{% endblocktrans %}gv`<i{% blocktrans %}"

" select some text in visual mode, then call the w macro on it (e.g. press
" @w), and it'll wrap that text in {% trans '' %}
let @w = "`>a' %}gv`<i{% trans 'l"
