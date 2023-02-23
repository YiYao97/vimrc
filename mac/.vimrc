call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dense-analysis/ale'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'luochen1990/rainbow'
Plug 'sainnhe/sonokai'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'maralla/completor.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mhinz/vim-signify', {'tag': 'legacy'}
Plug 'preservim/tagbar'
Plug 'preservim/nerdcommenter'
Plug 'alpertuna/vim-header'
Plug 'zhuzhzh/verilog_emacsauto.vim', {'for': ['verilog', 'systemverilog'] }
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

set updatetime=100
set tags=./.tags;,.tags

autocmd FileType make set noexpandtab

inoremap jj <Esc>

let g:rainbow_active = 1
let g:rainbow_conf = {
\   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\   'ctermfgs': ['white', 'blue', 'yellow', 'cyan'],
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
let g:ale_verilog_verilator_options = 'y"~/Documents/GitHub/chewy-hams/vsrc/"'

let g:UltiSnipsExpandTrigger="<enter>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

let g:NERDTreeGitStatusUseNerdFonts = 1

nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
let g:NERDTreeDirArrowExpandable = "\uf105"
let g:NERDTreeDirArrowCollapsible = "\uf107"
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

au FileType verilog let b:AutoPairs = AutoPairsDefine({'\v(^|\W)\zsbegin': 'end//n]'}, ["'", '`'])

" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

let g:VerilogModeFile = "/opt/homebrew/share/emacs/site-lisp/verilog-mode.el"

let g:header_auto_update_header = 1
let g:header_field_author = 'yi'
nmap <F8> :TagbarToggle<CR>
set guifont=MesloLGM\ Nerd\ Font\ Mono\ Regular\ 10
set t_RV=
