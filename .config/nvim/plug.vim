call plug#begin(stdpath('data') . '/plug')

Plug 'pearofducks/ansible-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'cocopon/iceberg.vim'
Plug 'udalov/kotlin-vim'
Plug 'itchyny/lightline.vim'
Plug 'neomake/neomake'
Plug 'https://git.zx2c4.com/password-store', { 'rtp': 'contrib/vim' }
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'RRethy/vim-illuminate'
Plug 'ledger/vim-ledger'
Plug 'sheerun/vim-polyglot'

call plug#end()
