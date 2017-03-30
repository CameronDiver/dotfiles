"
"Source plugins
source $HOME/.config/nvim/plugins.vim

let mapleader = "\<Space>"
nnoremap <cr> :nohlsearch<cr><cr>

source $HOME/.config/nvim/pluginConf.vim
source $HOME/.config/nvim/shortcuts.vim

" Commenting
let g:NERDSpaceDelims=1
let g:NERDCompactSexyComs=1
let g:NERDDefaultAlign='left'
let g:NERDCommentEmptyLines=1
let g:NERDTrimTrailingWhitespace=1

" Strip whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Re-load
autocmd BufEnter,FocusGained * checktime

set listchars=tab:>\ ,space:·,trail:␠
" set listchars=tab:>\ ,trail:␠
" set list
" hi SpecialKey guifg=#d8a080 ctermfg=3 ctermbg=6

" File types
" " Set up highlighting and spell-checking for markdown files
au BufNewFile,BufRead *.md set filetype=markdown | set tw=80 | set fo+=t
au BufNewFile,BufRead Dockerfile.template set filetype=dockerfile

set whichwrap+=<,>,h,l,[,]  " Move from one line to the next
set showcmd                 " Show (partial) command in status line.
set showmatch               " Show matching brackets.
set showmode                " Show current mode.
set ruler                   " Show the line and column numbers of the cursor.
set number                  " Show the line numbers on the left side.
set formatoptions+=o        " Continue comment marker in new lines.
set textwidth=0             " Hard-wrap long lines as you type them.
set noerrorbells            " No beeps.
set modeline                " Enable modeline.
set esckeys                 " Cursor keys in insert mode.
set linespace=0             " Set line-spacing to minimum.
set nojoinspaces            " Prevents inserting two spaces after punctuation on a join (J)
set splitbelow              " Horizontal split below current.
set splitright              " Vertical split to right of current.
set ignorecase              " Make searching case insensitive
set smartcase               " ... unless the query has capital letters.
set gdefault                " Use 'g' flag by default with :s/foo/bar/.
set magic		    " Use 'magic' patterns (extended regular expressions).
set undofile		    " Persistant undo
set relativenumber
set hidden

set rtp+=~/.local/share/nvim/plugged/typescript-tools.vim/

set foldmethod=indent

if !(exists("g:ycm_semantic_triggers"))
	let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']
let g:ycm_semantic_triggers['haskell'] = ['.']
let g:tsuquyomi_completion_detail = 1


" Tabs instead of spaces
set softtabstop=2
set shiftwidth=2
set tabstop=2
set autoindent
set noexpandtab

set backupdir=~/.config/nvim/backup//,/tmp
set directory=~/.config/nvim/swap//,/tmp

set wildignore+=*.o

let g:indentLine_setConceal = 0

set termguicolors
" let base16colorspace=256
" colorscheme base16-default-dark
" colorscheme Tomorrow-Night
" colorscheme badwolf
set background=dark
" colorscheme solarized8_dark
" colorscheme base16-default-dark
" colorscheme flatlandia
colorscheme flatlandia
let g:airline_theme='base16_default'
