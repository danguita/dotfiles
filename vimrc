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
Plug 'mattn/emmet-vim', { 'for': ['html', 'eruby', 'eelixir', 'jsx', 'javascript', 'javascript.jsx'] }
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'editorconfig/editorconfig-vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

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

" Colors
set background=dark
colorscheme default

highlight ALEError ctermbg=red ctermfg=white
highlight ALEWarning ctermbg=yellow ctermfg=black
highlight ALEErrorSign ctermbg=none ctermfg=red
highlight ALEWarningSign ctermbg=none ctermfg=yellow

highlight Pmenu ctermbg=233 ctermfg=white
highlight PmenuSel ctermbg=magenta ctermfg=black
highlight PmenuSbar ctermbg=white ctermfg=none
highlight PmenuThumb ctermbg=magenta ctermfg=none

highlight Comment cterm=italic
highlight VertSplit cterm=none ctermfg=234
highlight CursorLine cterm=none ctermbg=233
highlight Visual cterm=reverse ctermbg=none
highlight LineNr ctermfg=240
highlight ColorColumn ctermbg=234
highlight SignColumn ctermbg=none
highlight TabLineFill ctermfg=235
highlight TabLine cterm=none ctermbg=238 ctermfg=252
highlight TabLineSel cterm=none ctermbg=0 ctermfg=255
highlight Search cterm=none ctermbg=yellow ctermfg=233

highlight DiffAdd ctermfg=green ctermbg=black cterm=none
highlight DiffChange ctermfg=yellow ctermbg=black cterm=none
highlight DiffDelete ctermfg=red ctermbg=black cterm=none
highlight DiffText ctermfg=blue ctermbg=black cterm=none

" Ignorelist
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store,*/tmp/*
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*.swp,*~,._*
set wildignore+=*/deps/*,*/node_modules/*,*/_build/*

" Filetypes
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,Procfile,Guardfile,config.ru,*.rake} set filetype=ruby
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} set filetype=markdown
au BufRead,BufNewFile *.jsx set filetype=javascript.jsx
au FileType make setlocal noexpandtab
au FileType markdown setlocal linebreak textwidth=72 nolist
au FileType python setlocal tabstop=4 shiftwidth=4

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

" Highlight 81 column
set textwidth=80
set colorcolumn=+1

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

" NERDTree ignore list
let NERDTreeIgnore=['node_modules']

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

" Open file finder for current buffers
nnoremap <Leader>; :Buffers<CR>

" Get back to the good old non-popup layout
let g:fzf_layout = { 'down': '40%' }

" ALE
" https://github.com/dense-analysis/ale
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 0
let g:ale_lint_delay = 100
let g:ale_linters = {'javascript': [], 'ruby': ['rubocop'], 'elixir': ['elixir-ls'], 'haskell': ['hlint'] }
let g:ale_fixers = {'javascript': ['eslint'], 'ruby': ['rubocop'], 'elixir': ['mix_format'], 'haskell': ['hlint'], 'rust': ['rustfmt'] }
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_ruby_rubocop_executable = 'bin/rubocop'

" projectionist
let g:projectionist_heuristics = {
      \ "&mix.exs": {
      \   "lib/*.ex": {
      \     "type": "lib",
      \     "alternate": [
      \       "test/{}_test.exs",
      \     ],
      \   },
      \   "test/*_test.exs": {
      \     "type": "test",
      \     "alternate": "lib/{}.ex",
      \     "dispatch": "mix test test/{}_test.exs`=v:lnum ? ':'.v:lnum : ''`"
      \   },
      \   "test/test_helper.exs": { "type": "test" },
      \   "mix.exs": {
      \     "type": "lib",
      \     "alternate": "mix.lock",
      \     "dispatch": "mix deps.get"
      \   },
      \   "mix.lock": { "alternate": "mix.exs" },
      \   "*": {
      \     "make": "mix",
      \     "console": "iex -S mix"
      \   }
      \ }}

" coc: Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" coc: Use <c-space> to trigger completion.
inoremap <expr> <c-space> coc#refresh()

" coc: Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" coc: Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" coc: Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" coc: Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
