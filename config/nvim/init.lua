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
})

-- Source shared configuration
vim.cmd('source ' .. vim.fn.stdpath('config') .. '/shared.vim')
