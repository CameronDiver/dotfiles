set nocompatible
set t_Co=256

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Language support """"""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Coffee-script
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }

" Typescript
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'Quramy/tsuquyomi', { 'for': 'typescript' }
" Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'shougo/vimproc.vim', { 'do': 'make', 'for': 'typescript' }
" Plug 'mhartington/nvim-typescript', { 'for': 'typescript' }

" Python
Plug 'klen/python-mode', { 'for': 'python' }

" Haskell
Plug 'neovimhaskell/haskell-vim', { 'for': 'Haskell'}
Plug 'eagletmt/ghcmod-vim', { 'for': 'Haskell'}
Plug 'eagletmt/neco-ghc', { 'for': 'Haskell'}
Plug 'tomtom/tlib_vim', { 'for': 'Haskell'}
Plug 'MarcWeber/vim-addon-mw-utils', { 'for': 'Haskell'}
Plug 'godlygeek/tabular', { 'for': 'Haskell'}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Helpers """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Shougo/deoplete.nvim'

Plug 'w0rp/ale'

Plug 'matze/vim-move'
Plug 'Yggdroot/indentline'

Plug 'mileszs/ack.vim'

Plug 'junegunn/vim-easy-align', { 'for': 'markdown' }
Plug 'suan/vim-instant-markdown', { 'for': 'markdown' }

Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-surround'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Git """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Looks """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Plug 'trusktr/seti.vim'
" Plug 'chriskempson/base16-vim'
Plug 'flazz/vim-colorschemes'
Plug 'bagrat/vim-workspace'
Plug 'ryanoasis/vim-devicons'
" Plug 'lifepillar/vim-solarized8'

call plug#end()

" Always show statusline
set laststatus=2

let mapleader = "\<Space>"
nnoremap <cr> :nohlsearch<cr><cr>

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
" set esckeys                 " Cursor keys in insert mode.
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

" let g:tsuquyomi_completion_detail = 1

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
set background=dark
colorscheme flatlandia

set foldlevelstart=99
" Somehow this macro keeps getting set to something really weird,
" cancel it
let @w=''


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Don't hide JSON elements
let g:indentLine_setConceal = 0

" Comment toggling shortcuts
nmap <Leader>/ <Plug>NERDCommenterToggle
imap <C-/> <esc><Plug>NERDCommenterToggle<cr>ki
vmap <Leader>/ <Plug>NERDCommenterToggle

" Colors
set t_Co=256

let g:matchindent_tabsize=2

let g:gitgutter_eager=0
let g:gitgutter_map_keys = 0

let g:move_key_modifier='C'

" Setup easy align
au FileType markdown vmap <Leader>a :EasyAlign*<Bar><Enter>

let g:indent_guides_color_change_percent=30
au VimEnter * IndentGuidesEnable

let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']

" Left hand side, filename, modified status, type
set statusline=%f\ %y
set statusline+=\ %m\ %=
" Also add the current git branch
set statusline+=%{fugitive#statusline()}
" Right hand side: ALE message, line number, total
set statusline+=\ Line:\ %l/%L\ Col:\ %c\ -
set statusline+=\ Ale:\ %{ALEGetStatusLine()}\ |

hi StatusLine ctermbg=0 guibg=#515151

" au InsertEnter * hi StatusLine ctermbg=5 guibg=DarkOliveGreen
" au InsertEnter * hi StatusLine ctermbg=5 guibg=#6681AA
au InsertEnter * hi StatusLine ctermbg=5 guibg=#5724B1
au InsertLeave * hi StatusLine ctermbg=0 guibg=#515151

map <silent> tw :GhcModTypeInsert<CR>
map <silent> ts :GhcModSplitFunCase<CR>
map <silent> tq :GhcModType<CR>
map <silent> te :GhcModTypeClear<CR>

let g:SuperTabDefaultCompletionType = '<C-x><C-o>'
inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>

let g:haskellmode_completion_ghc = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" let g:deoplete#omt_patterns.typescript = '.'

let g:haskell_tabular = 1
vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>

nmap <Leader>t :NERDTreeToggle<CR>

" Use deoplete.
let g:deoplete#enable_at_startup = 1

let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

let g:ctrlp_custom_ignore = {
			\ 'dir': '\v[\/]\.?(git|node_modules|build)$',
			\}

let g:instant_markdown_slow = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcuts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
 " nnoremap <C-v> "+p$
 " vnoremap <C-v> "+p$
 " inoremap <C-v> <esc>"+pA

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

" Disable arrow keys in normal mode so I eventually learn to use
" h,j,k,l
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Fix nvim terminal
if has('nvim')
	tnoremap <C-[> <C-\><C-n>
endif
