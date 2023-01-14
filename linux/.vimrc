call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ycm-core/YouCompleteMe'
Plug 'dense-analysis/ale'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'preservim/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'luochen1990/rainbow'
Plug 'sainnhe/sonokai'
call plug#end()

set belloff=all

set t_Co=256
set background=dark
colorscheme sonokai

set noundofile
set nobackup
set noswapfile

set number
syntax on
set hlsearch
set laststatus=2
set encoding=utf-8
set cursorline

set tabstop=4
set expandtab
set shiftwidth=4
set autoindent
set backspace=2

set list
set listchars=tab:>-,trail:-

autocmd FileType make set noexpandtab

let g:rainbow_active = 1
let g:rainbow_conf = {
\   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\   'ctermfgs': ['Yellow', 'Magenta', 'Lightblue'],
\   'separately': {
\       'verilog': {
\           'parentheses': [
\               'start=/(/ end=/)/ fold',
\               'start=/\[/ end=/\]/ fold',
\               'start=/{/ end=/}/ fold',
\               'start=/\<begin\>/ end=/\<end\>/',
\               'start=/\<fork\>/ end=/\<join\>/',
\               ],
\           'after': [
\               'syn clear verilogLabel',
\               ],
\       },
\       'nerdtree': 0,
\   }
\}

let g:airline_powerline_fonts = 1
let g:airline_theme = 'sonokai'
let g:airline#extensions#tabline#enabled = 1

let g:ale_sign_column_always = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
let g:airline#extensions#ale#enabled = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_linters = {'verilog': ['verilator'],}
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_verilog_verilator_options = 'y"/home/yi/chewy-hams/vsrc/"'

let g:UltiSnipsExpandTrigger="<enter>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

let g:NERDTreeGitStatusUseNerdFonts = 1

nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
let g:NERDTreeDirArrowExpandable = "\uf105"
let g:NERDTreeDirArrowCollapsible = "\uf107"
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

au FileType verilog let b:AutoPairs = AutoPairsDefine({'\v(^|\W)\zsbegin': 'end//n]'}, ["'"])

set guifont=MesloLGM\ Nerd\ Font\ Mono\ Regular\ 10
set t_RV=
