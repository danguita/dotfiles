call plug#begin('~/.vim/plugged')

Plug 'tomtom/tlib_vim' | Plug 'MarcWeber/vim-addon-mw-utils' | Plug 'garbas/vim-snipmate' | Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter', { 'on':  '<plug>NERDCommenterToggle' }
Plug 'mileszs/ack.vim', { 'on': 'Ack' }
Plug 'ngmy/vim-rubocop', { 'on': 'RuboCop' }
Plug 'godlygeek/tabular', { 'on': 'Tabularize' }
Plug 'michaeljsmith/vim-indent-object'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive' | Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'bronson/vim-trailing-whitespace'
Plug 'ervandew/supertab'
Plug 'mattn/emmet-vim', { 'for': ['html', 'eruby', 'eelixir', 'jsx', 'javascript', 'javascript.jsx'] }
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mattn/webapi-vim' | Plug 'mattn/gist-vim', { 'on': 'Gist' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'ryanoasis/vim-devicons'

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
set cursorline
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

" Colorscheme
set background=dark
silent! colorscheme base16-default-dark
highlight Normal ctermbg=none
highlight ALEWarning ctermbg=cyan ctermfg=white

" Ignorelist
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store,*/tmp/*
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*.swp,*~,._*
set wildignore+=*/deps/*,*/node_modules/*,*/_build/*

" Filetypes
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,Procfile,Guardfile,config.ru,*.rake} set ft=ruby
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown
au FileType make setlocal noexpandtab
au FileType markdown setlocal linebreak textwidth=72 nolist
au FileType python setlocal tabstop=4 shiftwidth=4

" Backup and swap files
set backupdir^=~/.vim/_backup//
set directory^=~/.vim/_temp//

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

" Highlight 81 column
set textwidth=80
set colorcolumn=+1

" Avoid word wrapping
set formatoptions-=t

" Use system's clipboard
set clipboard=unnamed

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

if has('nvim')
  nmap <BS> :tabp<CR>
endif

" NERDTree toggle
map <Leader>n :NERDTreeToggle<CR> :NERDTreeMirror<CR>

" NERDTree ignore list
let NERDTreeIgnore=['node_modules']

" NERDCommenter toggle
map <Leader>/ <plug>NERDCommenterToggle<CR>

" Tagbar toggle
map <Leader>rt :TagbarToggle<CR>

" ALEFix toggle
map <Leader>f :ALEFix<CR>

" Fugitive
nmap <Leader>gb :Gblame<CR>
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gd :Gdiff<CR>
nmap <Leader>gl :Glog<CR>
nmap <Leader>gc :Gcommit<CR>
nmap <Leader>gp :Git push<CR>

" format the entire file
nnoremap <leader>fef :normal! gg=G``<CR>

" Map the arrow keys to be based on display lines, not physical lines
map <Down> gj
map <Up> gk

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
nmap <C-k> [e
nmap <C-j> ]e

" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv
vmap <C-k> [egv
vmap <C-j> ]egv

" Open file finder
nnoremap <C-p> :FZF<CR>
inoremap <C-p> <ESC>:FZF<CR>

" Set file finder's custom command to respect `.gitignore`
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" TagList settings
let Tlist_Use_Right_Window = 1
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'

" Use The Silver Searcher (ag) as default text searching tool
let g:ackprg = 'ag --nogroup --nocolor --column'

" Unfolded Markdown by default
let g:vim_markdown_folding_disabled = 1

" Airline configuration
" https://github.com/vim-airline/vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'base16'
let g:airline_extensions = []

" Disable some powerline symbols
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_right_sep = ''

" vim-jsx configuration
let g:jsx_ext_required = 0

let g:ale_linters = {'javascript': ['eslint'], 'ruby': ['rubocop'], 'elixir': ['mix_format']}
let g:ale_fixers = {'javascript': ['prettier'], 'ruby': ['rubocop'], 'elixir': ['mix_format']}
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_lint_delay = 100
