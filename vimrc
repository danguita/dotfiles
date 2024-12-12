call plug#begin('~/.vim/plugged')

Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter', { 'on':  '<plug>NERDCommenterToggle' }
Plug 'godlygeek/tabular', { 'on': 'Tabularize' }
Plug 'michaeljsmith/vim-indent-object'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive' | Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-projectionist'
Plug 'bronson/vim-trailing-whitespace'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'editorconfig/editorconfig-vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" avante.nvim
Plug 'stevearc/dressing.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'yetone/avante.nvim', { 'branch': 'main', 'do': 'make' }

" Add plugins to &runtimepath
call plug#end()

" Setup
set number
set ruler
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set list
set backspace=indent,eol,start
set laststatus=2

" Chars
set listchars=""
set listchars=tab:\ \
set listchars+=trail:.
set listchars+=extends:>
set listchars+=precedes:<

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase

" Colors
colorscheme default
if has('nvim')
  colorscheme vim
endif
set background=dark

" Backup
set nobackup

" Mouse reporting
set mouse=a

" Fast redraw
set lazyredraw
set ttyfast

" Folding
set foldlevel=0
set foldmethod=manual

" Show break line symbol
" http://www.bestofvim.com/tip/better-line-wraps/
set showbreak=↪

" Split separator character
set fillchars+=vert:│

" Wrap to 80 characters
set textwidth=80

" Avoid word wrapping
set formatoptions-=t

" Use system's clipboard
set clipboard=unnamedplus

" Don't give |ins-completion-menu| messages
set shortmess+=c

" Always show signcolumns
set signcolumn=yes

" Leader key
let mapleader = ","

" Reselect visual block after indent/outdent
" http://vimbits.com/bits/20
vnoremap < <gv
vnoremap > >gv

" Use <Tab> as <Esc>
nnoremap <Tab> <Esc>
vnoremap <Tab> <Esc>gV
onoremap <Tab> <Esc>

" Use jk as <Esc> (INSERT mode)
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
inoremap jk <Esc>

" Easy switching between tabs
" http://syskall.com/my-biggest-vim-productivity-boost/
map <C-L> :tabn<CR>
map <C-H> :tabp<CR>

" Remap <C-@> as <C-space> to help terminals interpret it correctly
inoremap <C-@> <C-x><C-o>

" NERDTree toggle
map <Leader>n :NERDTreeToggle<CR> :NERDTreeMirror<CR>

" NERDCommenter toggle
map <Leader>/ <plug>NERDCommenterToggle<CR>

" Tagbar toggle
map <Leader>rt :TagbarToggle<CR>

" ALEFix toggle
map <Leader>f :ALEFix<CR>

" Fugitive
nmap <Leader>gb :Git blame<CR>
nmap <Leader>gs :Git status<CR>
nmap <Leader>gd :Git diff<CR>
nmap <Leader>gl :Git log<CR>
nmap <Leader>gc :Git commit<CR>
nmap <Leader>gp :Git push<CR>

" format the entire file
nnoremap <leader>fef :normal! gg=G``<CR>

" Bubble single lines
nmap <C-k> [e
nmap <C-j> ]e

" Bubble multiple lines
vmap <C-k> [egv
vmap <C-j> ]egv

" Open file finder
nnoremap <Leader>p :FZF<CR>

" Open file finder for current buffers
nnoremap <Leader>; :Buffers<CR>

" ALE
" https://github.com/dense-analysis/ale
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 0
let g:ale_lint_delay = 100
let g:ale_linters = { 'javascript': ['eslint'], 'typescript': ['eslint'], 'typescriptreact': ['eslint'], 'ruby': ['rubocop'], 'elixir': ['elixir-ls'], 'haskell': ['hlint'] }
let g:ale_fixers = { 'javascript': ['prettier'], 'typescript': ['prettier'], 'typescriptreact': ['prettier'], 'ruby': ['rubocop'], 'elixir': ['mix_format'], 'haskell': ['hlint'], 'rust': ['rustfmt'] }
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_ruby_rubocop_executable = 'bin/rubocop'

" NERDTree
" ignore list
let NERDTreeIgnore=['node_modules']
