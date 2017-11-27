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
" Visual
Plug 'vim-airline/vim-airline'                          " powerline
Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar'                                " class/function overview
Plug 'airblade/vim-gitgutter'                           " show git diff in the 'gutter'
Plug 'Yggdroot/indentLine'                              " show a line at indents
Plug 'morhetz/gruvbox'					" color theme

" Writing efficiency
Plug 'bronson/vim-trailing-whitespace'                  " show and remove trailing whitespace
Plug 'Raimondi/delimitMate'                             " delimiters
Plug 'tpope/vim-commentary'                             " comment/uncomment

" Vim enhancement
" Plug 'Shougo/vimproc.vim', {'do': 'make'}             " async exec library for vim


" Misc
Plug 'xolox/vim-misc'                                  " required for vim-notes
Plug 'xolox/vim-notes'                                 " notes

" Language
Plug 'sheerun/vim-polyglot'                            " solid language pack
Plug 'scrooloose/syntastic'                            " syntax check
"Plug 'lervag/vimtex'        " requires vim with client-server, and latexmk (included in MacTex)
"
"
"
"
" Languages
" Latex
"
" Test these
"Plug 'tpope/vim-fugitive'                              " git wrapper
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
"junegunn/fzf
"tpope/vim-unimpaired

call plug#end()



"# =================== Plugin specific =====================
" config and keymappings
"
"## Gruvebox
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'soft' " does it work?

"## NERDTree
noremap <F3> :NERDTreeToggle<CR>

"## Airline
let g:airline_powerline_fonts = 1
"might want to disable airline.tagbar extention for speed

"## Notes
:let g:notes_directories = ['~/Documents/Notes']
:let g:notes_suffix = '.md'

"## Whitespace
nmap <Leader>fw :FixWhitespace<CR>

"## Syntastic
nmap <Leader>sm :SyntasticToggleMode<CR>

"## Tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

"## Vimtex
let g:vimtex_fold_enabled = 1
let g:vimtex_indent_enabled = 1

"## Indentline
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '@'    "'┆'
let g:indentLine_faster = 1

"# =================== Visual =====================
"
syntax on
set number
set relativenumber

"# =================== Keymappings =====================
"
" NOTE! Set plugin specific keymappings in the 'Plugins specific'-section
"
"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Automatically jump to end of pasted text
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

"" Copy/paste
set clipboard=unnamed,unnamedplus
"if has('macunix')
""  vmap <C-x> :!pbcopy<CR>
""  vmap <Leader> :w !pbcopy<CR><CR>
""  vmap <Leader>p :r !pbcopy<CR>
"endif
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

"# =================== Behavior =====================
"
"
set smartindent     "will look for { and indent accordingly
set backspace=indent,eol,start				" fix backspace indent

" Tabs
"
set tabstop=4		"stop at next column mod 4
set expandtab 		"convert <Tab> to spaces

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

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

set ttyfast

set title " does not work

"# =================== .vimrc modelines =====================

" Fold with ATX style headers - "# is H1, "## is H2, and so on
" vim:fdm=expr:fdl=0
" vim:fde=getline(v\:lnum)=~'^"#'?'>'.(matchend(getline(v\:lnum),'"#*')-1)\:'='
