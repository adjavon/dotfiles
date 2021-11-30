set nocompatible " required
syntax on
set encoding=UTF-8 "required for powerline
filetype off "required

" using vundle for plugins
" set runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

" My Bundles
Plugin 'scrooloose/nerdtree'
Plugin 'dense-analysis/ale'
Plugin 'majutsushi/tagbar'
Plugin 'Townk/vim-autoclose'
Plugin 'ryanoasis/vim-devicons'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'reedes/vim-thematic'

" tmux
Plugin 'edkolev/tmuxline.vim'
Plugin 'benmills/vimux'
Plugin 'christoomey/vim-tmux-navigator'

" More cool plugins
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'lervag/vimtex'
Plugin 'jceb/vim-orgmode'
Plugin 'vim-scripts/utl.vim'
Plugin 'arcticicestudio/nord-vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

call vundle#end()
filetype plugin indent on "required

set t_Co=256
colorscheme nord

" Spell check in british english
set spelllang=en_gb

" Cutoff at 79 characters
set tw=79

" Tabs and such
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

" Automatic indenting
set ai
set si

" Line numbers
set number

" Highlight the current line
set cursorline

" Splits and navigation
set splitbelow
set splitright
noremap <C-J> <C-W><C-J>
noremap <C-K> <C-W><C-K>
noremap <C-L> <C-W><C-L>
noremap <C-H> <C-W><C-H>

" NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Theme
let g:thematic#theme_name = 'vim-one'
" Using Limelight with this theme
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Vim-Airline Configuration
let airline#extensions#tabline#enabled = 1
" let g:airline#extensions#whitespace#enabled = 0
" let g:airline#extensions#tmuxline#enabled = 0
let g:airline_powerline_fonts = 1
let g:airline_theme = "nord"
" let g:buffeline_echo = 0 "don't show command bar

" Working with tmux
" let g:VimuxUseNearest = 0
let g:VimuxOrientation = "h"
map <leader>vp :VimuxPromptCommand<CR>
map <leader>vl :VimuxRunLastCommand<CR>
let g:VimuxHeight = "35"

" Set Skim as default PDF reader for vimtex
"let g:vimtex_view_general_viewer = 'open'
"let g:vimtex_view_general_options = '-a Skim'
"let g:vimtex_view_method = 'skim'


" Markdown folding
let g:markdown_folding = 1
let g:markdown_fenced_languages = ['vim', 'yaml', 'python', 'bash=sh', 'sql', 'git', 'make', 'html', 'css', 'javascript', 'js=javascript', 'json=javascript', 'xml']
syntax enable
setlocal foldlevel=99
au FileType markdown setlocal tw=0
set backspace=indent,eol,start

au FileType tex setlocal tw=0

" ALE Configuration of linters
let g:ale_sign_error                  = '✘'
let g:ale_sign_warning                = '⚠'
highlight ALEErrorSign ctermbg        =NONE ctermfg=red
highlight ALEWarningSign ctermbg      =NONE ctermfg=yellow
let g:ale_linters_explicit            = 1
let g:ale_lint_on_text_changed        = 'normal'
" let g:ale_lint_on_text_changed        = 'never'
let g:ale_lint_on_enter               = 0
let g:ale_lint_on_save                = 1
let g:ale_fix_on_save                 = 1
let g:ale_echo_msg_format = '%linter%: %s'

let g:ale_linters = {
\  'markdown': ['markdownlint', 'writegood', 'alex', 'proselint'],
\  'json': ['jsonlint'],
\  'python': ['flake8', 'mypy', 'pylint', 'alex'],
\  'yaml': ['yamllint', 'alex'],
\   '*': ['alex', 'writegood', 'proselint'],
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'json': ['jq'],
\   'python': ['isort'],
\}

" Set Limelight by default
autocmd VimEnter * Limelight

" Case insensitive search
set ignorecase
set smartcase

" Allow italics to show in the terminal bfor nord
let g:nord_italic = 1

" Set conceal levels
set conceallevel=2
" And don't let vim-markdown conceal code blocks
let g:vim_markdown_conceal_code_blocks = 0
