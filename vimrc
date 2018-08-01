"===================================================
" Vim config for Tormod Alf Try Tufteland
"
" TODO:
" - make non-clipboard compatible
" - make linux compatible
" - make ssh friendly
"
"# =================== asdf =====================

let mapleader=' '       "need to be set before other keymapping
let maplocalleader=' '

set shell=/bin/bash

"# =================== Plugins =====================
"
" REQUIRES powline-fonts installed

let vimplug_exists=expand('~/.vim/autoload/plug.vim')
if !filereadable(vimplug_exists)
  echo 'Installing Vim-Plug...'
  echo ''
  silent !\curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.vim/plugged')

" Update with :PlugUpdate [name], or force with :PlugUpdate! [name]

" Visual
Plug 'vim-airline/vim-airline'                          " powerline
Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar'                                " class/function overview
Plug 'airblade/vim-gitgutter'                           " show git diff in the 'gutter'
Plug 'Yggdroot/indentLine'                              " show a line at indents
Plug 'morhetz/gruvbox'					                " color theme; REQUIRES powerline fonts

" Writing efficiency
Plug 'bronson/vim-trailing-whitespace'                  " show and remove trailing whitespace
Plug 'Raimondi/delimitMate'                             " delimiters
Plug 'tpope/vim-commentary'                             " comment/uncomment
" Plug 'ervandew/supertab'                                " fix tab completion
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' } " autocompleter; require CMake and xcode dev tools
" Plug 'SirVer/ultisnips'                                 " snippets engine
" Plug 'honza/vim-snippets'                               " snippets
" Plug 'wikitopian/hardmode'
" Plug 'tpope/vim-surround'

" Vim enhancement
" Plug 'Shougo/vimproc.vim', {'do': 'make'}             " async exec library for vim

" Misc
" Plug 'xolox/vim-misc'                                  " required for vim-notes
"Plug 'xolox/vim-notes'                                 " notes
" Plug 'vimwiki/vimwiki'
Plug 'lervag/wiki'
" Plug 'gioele/vim-autoswap'

" Language
" Plug 'sheerun/vim-polyglot'                            " solid language pack
" Plug 'scrooloose/syntastic'                            " syntax check
"
" Plug 'w0rp/ale'
Plug 'lervag/vimtex'                                   " requires vim with client-server(for callback), and latexmk (included in MacTex)
Plug 'fatih/vim-go'                                     " golang
Plug 'python-mode/python-mode'
"
" Test these
Plug 'rhysd/vim-grammarous'
"Plug 'tpope/vim-fugitive'                              " git wrapper
"junegunn/fzf
"tpope/vim-unimpaired
"tpope/vim-repeat
"terryma/vim-multiple-cursors

call plug#end()



"# =================== Plugin specific =====================
" config and keymappings
"
"## Airline
let g:airline_powerline_fonts = 1
"might want to disable airline.tagbar extention for speed

"## Autoswap
set title titlestring=
"

"## Gruvebox
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'soft' " does it work?
set background=dark

"## Hardmode
" autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>

"## Indentline
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '|'    "'┆'
let g:indentLine_faster = 1

"## NERDTree
noremap <F3> :NERDTreeToggle<CR>

"## Notes
:let g:notes_directories = ['~/Documents/Notes']
:let g:notes_suffix = '.md'


"## Supertab
"
let g:SuperTabDefaultCompletionType = '<C-n>'

"## Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'

nmap <Leader>st :SyntasticToggleMode<CR>
" map :SyntasticCheck

"## Tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

"## UltiSnips
" let g:UltiSnipsExpandTrigger = "<tab>"
" let g:UltiSnipsJumpForwardTrigger = "<tab>"
" let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" let g:UltiSnipsExpandTrigger = "<C-l>"
" let g:UltiSnipsJumpForwardTrigger = "<C-j>"
" let g:UltiSnipsJumpBackwardTrigger = "<C-k>"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"## Vimtex
"
let g:vimtex_fold_enabled = 1
let g:vimtex_indent_enabled = 1
let g:polyglot_disabled = ['latex'] " otherwise vim-tex will not work properply

let g:vimtex_view_method = 'skim'   " Set MacVim in Skim -> Pref -> Sync PDF-TeX Sync support
" Forward search: \lv
" Backward search: Command-Shift-Click on point in PDF in Skim


let g:vimtex_quickfix_open_on_warning = 0

" let g:vimtex_quickfix_latexlog = {
"       \ 'overfull' : 0,
"       \ 'underfull' : 0,
"       \ 'packages' : {
"       \   'default' : 0,
"       \ },
"       \}
" :VimtexCountWords
" :VimtexCompileOutput
" :VimtexErrors
" :VimtexClean " clean *.aux, *.out etc.

"## vim-go
let g:go_fmt_command = "goimports"          " also manage imports on save

let godoc=expand('$GOPATH/bin/gogetdoc')
if !filereadable(godoc)
    :GoInstallBinaries
endif

"## Whitespace
nmap <Leader>fw :FixWhitespace<CR>

"## Wiki
let g:wiki_root = '~/Documents/wiki'
"command OpenWiki <Plug>wiki-index

" Languages
"

"## YouCompleteMe
"
" let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_key_list_select_completion = ['<C-n>']
let g:ycm_key_list_previous_completion = ['<C-p>']
let g:ycm_key_list_select_completion=[]
" let g:ycm_key_list_previous_completion=[]

"# =================== Basic =====================
"
" Encoding
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  set fileencoding=utf-8
  set fileencodings=utf-8
endif

" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo') && !isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

set ttyfast

set title " does not work

"# =================== Behavior =====================
"
"

set nocompatible " if .vimrc is not in ~/, this is needed

" Only do this part when compiled with support for autocommands.
if has("autocmd")
    " Use filetype detection and file-based automatic indenting.
    filetype plugin indent on

    " Use actual tab chars in Makefiles.
    autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
endif
"
"set smartindent                             "will look for { and indent accordingly
set backspace=indent,eol,start				" allow backspace in insert mode

" Tabs
"
set tabstop=4		" The with of a <Tab> is set to 4
set shiftwidth=4    " Indents will have a width of 4.
set softtabstop=4   " Sets the number of columns for a TAB.
set expandtab 		"convert <Tab> to spaces

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" Remember folds
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" ---- Search
"
set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" Div

set updatetime=250

" Delay to normal mode
set timeoutlen=1000 ttimeoutlen=0

"# =================== Keymappings =====================
"
" NOTE! Set plugin specific keymappings in the 'Plugins specific'-section
"
" First things first
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
vnoremap <up> <nop>
vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" Insert Markdown codeblock
nnoremap <leader>cb O```bash<Esc>jo```<Esc>ki
"
" vimrc, fast edit
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" vimrc, source
nnoremap <leader>sv :source $MYVIMRC<cr>

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

""div
"nnoremap 0 H
"nnoremap $ L

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Automatically jump to end of pasted text
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

"" Copy/paste
if has("clipboard")
    set mouse=a " ability to scroll, and mouse highlight symlinks to VISUAL
    set clipboard=unnamed " copy to the system clipboard

    if has("unnamedplus") " X11 support
        set clipboard+=unnamedplus
    endif
else
    if has('macunix')
        vmap <Leader>d :!pbcopy<CR>
        vmap <Leader>y :w !pbcopy<CR><CR>
        vmap <Leader>p :r !pbpaste<CR><CR>
    endif
endif
"
" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

"# =================== Visual =====================
"
syntax on
set number
" set relativenumber
set guifont=Noto\ Mono\ for\ Powerline:h12 " Monaco:h12


" Thin cursor in insert mode (iTerm2 + OS X)
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Enable italics
highlight Comment cterm=italic

" Hide scrollbars in MacVim
set guioptions=

"## Folds
set foldmethod=indent   "fold based on indent
set foldnestmax=1       "deepest fold is 3 levels

"# =================== .vimrc modelines =====================

" Fold with ATX style headers - "# is H1, "## is H2, and so on
" vim:fdm=expr:fdl=0
" vim:fde=getline(v\:lnum)=~'^"#'?'>'.(matchend(getline(v\:lnum),'"#*')-1)\:'='
