" install plug.vim if it isn't already present
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -Lfs -o ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(stdpath('data') . '/plug')

Plug 'editorconfig/editorconfig-vim'
Plug 'https://tildegit.org/sloum/gemini-vim-syntax'
Plug 'git://r-36.net/geomyidae', { 'rtp': 'gph/vim' }
Plug 'seanyeh/gopher.vim'
Plug 'https://git.zx2c4.com/password-store', { 'rtp': 'contrib/vim' }
Plug 'godlygeek/tabular'
Plug 'tpope/vim-eunuch'

call plug#end()
