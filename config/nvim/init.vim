"Install vim-plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

let termguicolors=1

" Theme
Plug 'mhinz/vim-startify'
Plug 'morhetz/gruvbox'
" Plug 'vim-scripts/Guardian'

Plug 'xolox/vim-misc'
Plug 'xolox/vim-colorscheme-switcher'
" Tomorrow themes installed manually
" Plug 'chriskempson/tomorrow-theme'
"Plug 'danilo-augusto/vim-afterglow'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'squarefrog/tomorrow-night.vim'
" Plug 'chriskempson/base16-vim'
Plug 'Soares/base16.nvim'
Plug 'trusktr/seti.vim'

" Language support
Plug 'itchyny/vim-haskell-indent', { 'for': 'haskell' }
" Plug 'eagletmt/ghcmod-vim'
Plug 'lukerandall/haskellmode-vim', { 'for': 'haskell' }
" Plug 'rust-lang/rust.vim'
Plug 'kchmck/vim-coffee-script'
" Typescript support
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'
Plug 'shougo/vimproc.vim', { 'do': 'make' }
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer --system-libclang --omnisharp-completer' }

" Plug 'clausreinke/typescript-tools.vim', { 'do': 'npm install' }
" Plug 'Quramy/tsuquyomi'

" Completion
Plug 'ervandew/supertab'
" Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
" Plug 'carlitux/deoplete-ternjs'
" Plug 'mhartington/nvim-typescript'
" Plug 'sebastianmarkow/deoplete-rust'

" Documentation
" Plug 'heavenshell/vim-jsdoc'

" Linting
" Plug 'neomake/neomake'
" Plug 'vim-syntastic/syntastic'

" Git
Plug 'tpope/vim-git'
" Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Commenting
Plug 'scrooloose/nerdcommenter'

" Project view
" Plug 'scrooloose/nerdtree'
" Plug 'scrooloose/nerdtree-git-plugin'

" Fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'

" Markdown
" Currently doesn't work with nvim - keep checking
"Plug 'suan/vim-instant-markdown'

" Other
" Plug 'ntpeters/vim-better-whitespace'
Plug 'matze/vim-move'
Plug 'Yggdroot/indentline'
"Plug 'tpope/vim-sleuth'
" Plug 'Shougo/vimproc.vim'
" Plug 'conormcd/matchindent.vim'
" Plug 'CameronDiver/matchindent.vim'
", { 'branch': 'allow-tabstop-config' }

Plug '~/development/matchindent.vim'

" Done with plugins
call plug#end()

set backupdir=~/.config/nvim/backup//,/tmp
set directory=~/.config/nvim/swap//,/tmp

set wildignore+=*.o

let g:indentLine_setConceal = 0

" Key mapping
" General
let mapleader = "\<Space>"
nnoremap <cr> :nohlsearch<cr><cr>

" Save
nnoremap <C-s> :w<cr>
inoremap <C-s> <esc>:w<cr>a
vnoremap <C-s> <esc>:w<cr>v

" Save and quit
nnoremap <C-q> :x<cr>
nnoremap <C-q> <esc>:x<cr>
vnoremap <C-q> <esc>:x<cr>

" Cut
vnoremap <C-x> "+d

" Copy
vnoremap <C-c> "+y

" Paste
nnoremap <C-v> "+p$
vnoremap <C-v> "+p$
inoremap <C-v> <esc>"+pA

" Undo and Redo
inoremap <C-u> <esc>ui
inoremap <C-r> <esc><C-r>A

" Next buffer
nnoremap <Leader>l :bn<cr>

" Previous buffer
nnoremap <Leader>h :bp<cr>

" Kill buffer
nmap <Leader>q :bd<cr>

" Backspace in normal mode -> insert mode
nmap <BS> i

nmap <cr> a<cr>

" jj as Esc
imap jj <Esc>


" Commenting
nmap <Leader>/ <Plug>NERDCommenterToggle
imap <C-/> <esc><Plug>NERDCommenterToggle<cr>ki
vmap <Leader>/ <Plug>NERDCommenterToggle

" Documenting
nnoremap <Leader>d :JsDoc<CR>

" Project view
nnoremap <Leader>n :NERDTreeToggle<CR>

" Reload File
nnoremap <Leader>r :e<CR>

" Wrapped line handling
imap <silent> <Up> gk
imap <silent> <Up> <C-o>gk
map <silent> <Down> gj
imap <silent> <Down> <C-o>gj
map <silent> <home> g<home>
imap <silent> <home> <C-o>g<home>
map <silent> <End> g<End>
imap <silent> <End> <C-o>g<End>

nmap L $
nmap H ^

" Theme
set background=dark
let g:gruvbox_italic=1
" let g:gruvbox_contrast_dark='neutral'
let g:airline_theme='gruvbox'
" let g:airline_theme='tomorrow'

"let g:airline_theme='afterglow'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=2
let g:airline#extensions#tabline#fnamemod=':t'
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#tabline#left_alt_sep='|'
let g:airline#extensions#tabline#right_sep=' '
let g:airline#extensions#tabline#right_alt_sep='|'
let g:airline#extensions#whitespace#mixed_indent_algo=1
let g:airline_left_sep=' '
let g:airline_left_alt_sep='|'
let g:airline_right_sep=' '
let g:airline_right_alt_sep='|'
colorscheme gruvbox
" let base16colorspace=256
" colorscheme monokai
"colorscheme afterglow
" colorscheme new-railscasts
" colorscheme seti

let g:matchindent_tabsize=2

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" Linting
let g:neomake_cpp_enabled_makers = ['clang']
let g:neomake_cpp_clang_maker = {
	\ 'exe': 'clang++',
	\ 'args': ['-Wall', '-Wextra', 'std=c++11', '-Weverything', '-pedantic', '-Wno-sign-conversion']
	\}
let g:neomake_open_list=0
" autocmd! BufWritePost * Neomake

" Stop tab switching being so fucking slow
let g:gitgutter_eager=0

" Commenting
let g:NERDSpaceDelims=1
let g:NERDCompactSexyComs=1
let g:NERDDefaultAlign='left'
let g:NERDCommentEmptyLines=1
let g:NERDTrimTrailingWhitespace=1

" Documentation
" JsDoc
let g:jsdoc_allow_input_prompt=1
" The following is not as useful as it seems it will be (no auto-wrap for
" example)
" let g:jsdoc_input_description=1

" Other
" autocmd BufWritePre * StripWhitespace
autocmd BufWritePre * :%s/\s\+$//e
let g:indentLine_setColors=0
"autocmd BufReadPost * :DetectIndent

" Re-load
autocmd BufEnter,FocusGained * checktime

" For vim-move
let g:move_key_modifier='C'

" Tab indent guide
set listchars=tab:\|\ ,trail:␠,nbsp:⎵
set list

" File types
" Set up highlighting and spell-checking for markdown files
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead Dockerfile.template set filetype=dockerfile

autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>
autocmd FileType markdown set tw=79 | set fo+=t | setlocal spell

" General
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
set hidden		    " Enable hidden buffers
set noshowmode		    " Turn off silly status line
set mouse=
set relativenumber

" Tabs instead of spaces
set softtabstop=2
set shiftwidth=2
set tabstop=2
set autoindent
set noexpandtab

function! Indent_2_spaces()
    setl expandtab
    setl autoindent
    setl shiftwidth=2
    setl tabstop=2
    setl softtabstop=2
endfunction

let g:haddock_browser="/usr/bin/firefox"

au FileType haskell call Indent_2_spaces()

"autocmd BufWritePost *.hs call GhcModCheck()
" au BufWritePost * call SyntasticCheck()
"au FileType *.cabal call Indent_2_spaces()
au BufNewFile,BufRead *.do call Indent_2_spaces()

set rtp+=~/.local/share/nvim/plugged/typescript-tools.vim/

highlight ColorColumn ctermbg=magenta
" set colorcolumn=81
call matchadd('ColorColumn', '\%120v', 100)

set tabstop=2

if !(exists("g:ycm_semantic_triggers"))
	let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']
let g:tsuquyomi_completion_detail = 1

set foldmethod=indent
" set foldmethod=syntax
