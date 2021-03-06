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
" Plug 'Quramy/tsuquyomi'
" Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'shougo/vimproc.vim', { 'do': 'make' }
" " Plug 'mhartington/nvim-typescript', { 'for': 'typescript' }
" " Don't lazy load as it doesn't work with remote plugins
Plug 'mhartington/nvim-typescript'
" " Plug 'HerringtonDarkholme/yats.vim', { 'for': 'typescript' }

" Python
Plug 'klen/python-mode', { 'for': 'python' }

" Haskell
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell'}
Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell'}
Plug 'eagletmt/neco-ghc', { 'for': 'haskell'}
Plug 'tomtom/tlib_vim', { 'for': 'haskell'}
Plug 'MarcWeber/vim-addon-mw-utils', { 'for': 'haskell'}
Plug 'godlygeek/tabular', { 'for': 'haskell'}

" Rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'racer-rust/vim-racer', { 'for': 'rust' }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Helpers """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdcommenter'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'easymotion/vim-easymotion'
Plug 'w0rp/ale'

Plug 'matze/vim-move'
Plug 'Yggdroot/indentline'

Plug 'mileszs/ack.vim'
" Plug 'tpope/vim-sleuth'

Plug 'junegunn/vim-easy-align', { 'for': 'markdown' }
" Plug 'suan/vim-instant-markdown', { 'for': 'markdown' }

Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-surround'

" Plug 'gilsondev/searchtasks.vim'
Plug 'qpkorr/vim-bufkill'
Plug 'scrooloose/nerdtree'
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
Plug 'hzchirs/vim-material'
" Plug 'jackiehluo/vim-material'
Plug 'iCyMind/NeoSolarized'
Plug 'nightsense/forgotten'
Plug 'jdkanani/vim-material-theme'
" Plug 'bagrat/vim-workspace'
Plug 'ryanoasis/vim-devicons'
"Plug 'lifepillar/vim-solarized8'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
if !exists("g:gui_oni")
    Plug 'mhinz/vim-startify'
	Plug 'powerline/powerline'
endif

call plug#end()

" Set colour scheme
set termguicolors
set background=dark
" set background=dark
colorscheme vim-material
" colorscheme material-theme
" colorscheme peaksea
" colorscheme NeoSolarized
" colorscheme forgotten-light
" colorscheme mayansmoke
let g:neosolarized_contrast = "high"

" Always show statusline
set laststatus=2

let mapleader = "\<Space>"

set tabstop=2
set shiftwidth=2
set tabstop=2
set noexpandtab

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

" Open NERDTree when no files are provided
if !exists("g:gui_oni")
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
endif

" Close vim when the only window is the nerd tree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

set listchars=tab:>\ ,space:\ ,trail:·
set list
" set listchars=tab:>\ ,trail:␠
" hi SpecialKey guifg=#d8a080 ctermfg=3 ctermbg=6

" File types
" " Set up highlighting and spell-checking for markdown files
au BufNewFile,BufRead *.md set filetype=markdown | set tw=80 | set fo+=t
au BufNewFile,BufRead Dockerfile.template set filetype=dockerfile
au BufNewFile,BufRead *.json setlocal expandtab
au BufNewFile,BufRead *.hs setlocal expandtab

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
set mouse=a
set rtp+=~/.local/share/nvim/plugged/typescript-tools.vim/

set foldmethod=indent

let g:tsuquyomi_completion_detail = 1
let g:tsuquyomi_disable_default_mappings = 1

" Tabs instead of spaces
set softtabstop=2
" set shiftwidth=2
set tabstop=2
set autoindent
" set noexpandtab

set backupdir=~/.config/nvim/backup//,/tmp
set directory=~/.config/nvim/swap//,/tmp

set wildignore+=*.o

let g:indentLine_setConceal = 0


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


let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']

if !exists("g:gui_oni")

	let g:indent_guides_color_change_percent=5
	au VimEnter * IndentGuidesEnable

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

	let g:SuperTabDefaultCompletionType = '<C-x><C-o>'
	inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>

	" Use deoplete.
	let g:deoplete#enable_at_startup = 1

	let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
	let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
	let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
	let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
	let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
	let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
	let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

	let g:workspace_use_devicons = 1

	let g:racer_cmd="/home/cameron/.cargo/bin/racer"
	let g:deoplete#sources#rust#racer_binary="/home/cameron/.cargo/bin/racer"
	let g:deoplete#sources#rust#rust_source_path="/home/cameron/.multirust/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src"
	set omnifunc=syntaxcomplete#Complete

	set mouse=a
endif

map <silent> tw :GhcModTypeInsert<CR>
map <silent> ts :GhcModSplitFunCase<CR>
map <silent> tq :GhcModType<CR>
map <silent> te :GhcModTypeClear<CR>


let g:haskellmode_completion_ghc = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" let g:deoplete#omt_patterns.typescript = '.'

let g:haskell_tabular = 1
vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>

let g:ctrlp_custom_ignore = {
			\ 'dir': '\v[\/]\.?(git|node_modules|build)$',
			\}

" nmap ; :Buffers<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>t :Files<CR>
" Keep the old ctrlp behaviour
" nmap <C-p> :Files<CR>
nmap <Leader>r :Tags<CR>

let g:instant_markdown_slow = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcuts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

 " Copy
 vnoremap y "+y
 nnoremap y "+y

 " Cut
 vnoremap d "+d
 nnoremap d "+d

 " Paste
 nnoremap p "+p

 " Next buffer
 nnoremap <Leader>l :bn<cr>

 " Previous buffer
 nnoremap <Leader>h :bp<cr>

 " New buffer
 nnoremap <Leader>n :enew<cr>

 " Kill buffer
 " nmap <Leader>q :bd<cr>
 " Kil buffer leaving split intact
nmap <Leader>q :BD<cr>

 " Backspace in normal mode -> insert mode
 nmap <BS> i

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

map j gj
map k gk

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

nnoremap :ve :e ~/.config/nvim/init.vim
nnoremap :vs :so ~/.config/nvim/init.vim

" Clear highlighting
nnoremap <C-h> <C-o>:noh<enter>
inoremap <C-h> <C-o>:noh<enter>

nnoremap <Tab> <C-w><C-w>
nnoremap <Leader>v <C-w>S
nnoremap <Leader>V <C-w>v

nnoremap <C-t> :10split<enter>:terminal<enter>

nnoremap <A-Up> 2<C-w>+
nnoremap <A-Down> 2<C-w>-
nnoremap <A-Left> 2<C-w><
nnoremap <A-Right> 2<C-w>>

nnoremap <Left> ^
nnoremap <Right> $

autocmd TermOpen * setlocal statusline=%{b:term_title} | nnoremap <buffer> <Leader>q :bd!<enter>
autocmd FileType quickfix setlocal nremap <Leader>q :bd<enter>

nnoremap <Leader>w :NERDTree<cr>

" gf smart file opening
augroup suffixes
	autocmd!

	let jsExts=".js,.ts,.coffee,.json"

	let associations = [
				\["javascript", jsExts],
				\["coffeescript", jsExts],
				\["typescript", jsExts]
				\]

	for ft in associations
		execute "autocmd FileType " . ft[0] . " setlocal suffixesadd=" . ft[1]
	endfor
augroup END

nnoremap - :Explore<cr>

nnoremap :W<cr> :w<cr>
nnoremap :Q<cr> :q<cr>

" Move through camelCase words
nnoremap <silent><C-Left> :<C-u>call search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%^','bW')<CR>
nnoremap <silent><C-Right> :<C-u>call search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%$','W')<CR>
inoremap <silent><C-Left> <C-o>:call search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%^','bW')<CR>
inoremap <silent><C-Right> <C-o>:call search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%$','W')<CR>

set colorcolumn=80,120

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#fnamemod=':~:.'
let g:airline#extensions#tabline#fnamecollapse = 1
