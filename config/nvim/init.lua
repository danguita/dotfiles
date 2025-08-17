-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugin Specifications
require("lazy").setup({
  -- File Navigation
  {'scrooloose/nerdtree', cmd = 'NERDTreeToggle'},
  'scrooloose/nerdcommenter',
  'godlygeek/tabular',
  'michaeljsmith/vim-indent-object',
  'majutsushi/tagbar',

  -- Vim Improvements
  'tpope/vim-rails',
  'tpope/vim-surround',
  {'tpope/vim-fugitive', dependencies = 'tpope/vim-rhubarb'},
  'tpope/vim-unimpaired',
  'tpope/vim-eunuch',
  'tpope/vim-projectionist',
  'bronson/vim-trailing-whitespace',

  -- Search and Utility
  {'junegunn/fzf', build = function() vim.fn['fzf#install']() end},
  'junegunn/fzf.vim',
  'w0rp/ale',
  'airblade/vim-gitgutter',
  'sheerun/vim-polyglot',
  'editorconfig/editorconfig-vim',

  -- Language and Completion
  {'neoclide/coc.nvim', branch = 'release'},

  -- Avante and Supporting Plugins
  'stevearc/dressing.nvim',
  'nvim-lua/plenary.nvim',
  'MunifTanjim/nui.nvim',
  {'yetone/avante.nvim', branch = 'main', build = 'make'},
})

-- Vim Settings
vim.opt.number = true
vim.opt.ruler = true
vim.opt.wrap = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.list = true
vim.opt.backspace = 'indent,eol,start'
vim.opt.laststatus = 2

-- Search Settings
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Color and Display
vim.cmd('colorscheme default')
vim.opt.background = 'dark'
vim.opt.termguicolors = true

-- Backup and Mouse
vim.opt.backup = false
vim.opt.mouse = 'a'

-- Performance
vim.opt.lazyredraw = true
vim.opt.ttyfast = true

-- Folding
vim.opt.foldlevel = 0
vim.opt.foldmethod = 'manual'

-- Text Formatting
vim.opt.showbreak = '↪'
vim.opt.fillchars:append('vert:│')
vim.opt.textwidth = 80
vim.opt.formatoptions:remove('t')

-- Clipboard and Completion
vim.opt.clipboard = 'unnamedplus'
vim.opt.shortmess:append('c')
vim.opt.signcolumn = 'yes'

-- Leader Key
vim.g.mapleader = ','

-- Keymappings
local keymap = vim.keymap.set

-- Reselect visual block after indent/outdent
keymap('v', '<', '<gv')
keymap('v', '>', '>gv')

-- Use Tab as Esc
keymap({'n', 'v', 'o'}, '<Tab>', '<Esc>')

-- Use jk as Esc in Insert mode
keymap('i', 'jk', '<Esc>')

-- Tab navigation
keymap('', '<C-L>', ':tabn<CR>')
keymap('', '<C-H>', ':tabp<CR>')

-- NERDTree
keymap('', '<Leader>n', ':NERDTreeToggle<CR>:NERDTreeMirror<CR>')

-- NERDCommenter
keymap('', '<Leader>/', '<plug>NERDCommenterToggle<CR>')

-- Tagbar
keymap('', '<Leader>rt', ':TagbarToggle<CR>')

-- ALEFix
keymap('', '<Leader>f', ':ALEFix<CR>')

-- Fugitive
keymap('n', '<Leader>gb', ':Git blame<CR>')
keymap('n', '<Leader>gs', ':Git status<CR>')
keymap('n', '<Leader>gd', ':Git diff<CR>')
keymap('n', '<Leader>gl', ':Git log<CR>')
keymap('n', '<Leader>gc', ':Git commit<CR>')
keymap('n', '<Leader>gp', ':Git push<CR>')

-- Format entire file
keymap('n', '<leader>fef', ':normal! gg=G``<CR>')

-- Bubble lines
keymap('n', '<C-k>', '[e')
keymap('n', '<C-j>', ']e')
keymap('v', '<C-k>', '[egv')
keymap('v', '<C-j>', ']egv')

-- FZF
keymap('n', '<Leader>p', ':FZF<CR>')
keymap('n', '<Leader>;', ':Buffers<CR>')

-- ALE Configuration
vim.g.ale_sign_error = '✘'
vim.g.ale_sign_warning = '⚠'
vim.g.ale_lint_on_save = 1
vim.g.ale_fix_on_save = 0
vim.g.ale_lint_delay = 100
vim.g.ale_linters = {
  javascript = {'eslint'},
  typescript = {'eslint'},
  typescriptreact = {'eslint'},
  ruby = {'rubocop'},
  elixir = {'elixir-ls'},
  haskell = {'hlint'}
}
vim.g.ale_fixers = {
  javascript = {'prettier'},
  typescript = {'prettier'},
  typescriptreact = {'prettier'},
  ruby = {'rubocop'},
  elixir = {'mix_format'},
  haskell = {'hlint'},
  rust = {'rustfmt'}
}
vim.g.ale_javascript_prettier_use_local_config = 1
vim.g.ale_ruby_rubocop_executable = 'bin/rubocop'

-- NERDTree ignore
vim.g.NERDTreeIgnore = {'node_modules'}
