call plug#begin(stdpath('data') . '/plug')

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'editorconfig/editorconfig-vim'
Plug 'https://git.zx2c4.com/password-store', { 'rtp': 'contrib/vim' }
Plug 'godlygeek/tabular'
Plug 'tpope/vim-eunuch'
Plug 'pangloss/vim-javascript'
Plug 'sheerun/vim-polyglot'
Plug 'evanleck/vim-svelte'
Plug 'leafOfTree/vim-svelte-plugin'

" local plugins
Plug '/usr/lib/factor/misc/vim'

call plug#end()
