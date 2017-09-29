" Pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on

" " Theme

set background=dark

set termguicolors
let g:gruvbox_italics=1
let g:gruvbox_contrast_dark='soft'
let g:airline_theme='gruvbox'
set laststatus=2
" colorscheme gruvbox

set t_Co=256
"set paste

" " General
set number            " Show line numbers
set linebreak            " Break lines at word (requires Wrap lines)
set showbreak=+++        " Wrap-broken line prefix
set textwidth=100        " Line wrap (number of cols)
set showmatch            " Highlight matching brace
set visualbell            " Use visual bell (no beeping)
set cursorline            " highlight current line

set hlsearch            " Highlight all search results
set smartcase            " Enable smart-case search
set ignorecase            " Always case-insensitive
set incsearch            " Searches for strings incrementally
"
set autoindent            " Auto-indent new lines
set smartindent            " Enable smart-indent
" set smarttab            " Enable smart-tabs
set cindent
"   "
  " Advanced
set ruler            " Show row and column ruler information
"

"Stop the underline on a line
set cursorline
" Click places
set mouse=a

set undolevels=1000        " Number of undo levels
set backspace=indent,eol,start    " Backspace behaviour

imap jj <Esc>
:nmap j gj
:nmap <Down> gj
:nmap k gk
:nmap <Up> gk

" Add emacs-like bindings for the command line
:cnoremap <C-a> <Home>
:cnoremap <C-b> <Left>
:cnoremap <C-f> <Right>
:cnoremap <C-d> <Delete>
:cnoremap <M-b> <S-Left>
:cnoremap <M-f> <S-Right>
:cnoremap <M-d> <S-Right><Delete>
:cnoremap <Esc>b <S-Left>
:cnoremap <Esc>f <S-Right>
:cnoremap <Esc>d <S-Right><Delete>
:cnoremap <C-g> <C-c>

" Emacs style highlight-as-you-type search
:set incsearch
" Only match case when capital letters are used
:set infercase
:set ignorecase
:set smartcase

" better tab completion
set wildmode=longest,list,full
set wildmenu


" Set syntax highlighting for new file types
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead Dockerfile.template set filetype=dockerfile


" switch solarized themes
" call togglebg#map("<F4>")


" enable ctrlp.vim
let g:ctrlp_map= '<c-p>'
let g:ctrlp_custom_ignore = {
	\ 'file': '\.o'
	\}

" start of default statusline
set statusline=%f\ %h%w%m%r\

" set statusline+=%{fugitive#statusline()}

" Syntastic statusline
set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" end of default statusline (with ruler)
set statusline+=%=%(%l,%c%V\ %=\ %P%)


let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_disabled_filetypes = ['sass']
let g:syntastic_aggregrate_errors=1
let g:syntastic_coffee_checks=['coffeelint']

set softtabstop=2
set shiftwidth=2
set tabstop=2
set noexpandtab

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

vnoremap <C-c> :"*y

"au TextChangedI *.coffee :CoffeeLint
"au TextChangedI * :SyntasticCheck
au BufWritePre * :FixWhitespace

"au BufWritePre *.coffee :CoffeeLint

let g:javascript_plugin_jsdoc = 1

" if the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
command -nargs=0 -bar Update if &modified
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif
nnoremap <silent> <C-S> :<C-u>Update<CR>

inoremap <C-s> <C-o>:w<CR>


" uncomment this to have the same transparency as the terminal
"hi Normal guibg=NONE ctermbg=NONE
"
function! Indent_2_spaces()
    setl expandtab
    setl autoindent
    setl shiftwidth=2
    setl tabstop=2
    setl softtabstop=2
endfunction

au FileType haskell call Indent_2_spaces()
"au FileType *.cabal call Indent_2_spaces()
au BufNewFile,BufRead *.do call Indent_2_spaces()
