call plug#begin(stdpath('data') . '/plug')

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'editorconfig/editorconfig-vim'
Plug 'cocopon/iceberg.vim'
Plug 'https://git.zx2c4.com/password-store', { 'rtp': 'contrib/vim' }
Plug 'godlygeek/tabular'
Plug 'tpope/vim-eunuch'
Plug 'sheerun/vim-polyglot'
Plug 'leafOfTree/vim-svelte-plugin'

" local plugins
Plug '/usr/lib/factor/misc/vim'

call plug#end()
