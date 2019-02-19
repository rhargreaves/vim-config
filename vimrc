call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'nvie/vim-flake8'
Plug 'kien/ctrlp.vim'
Plug 'sjl/badwolf'
Plug 'vim-airline/vim-airline'
Plug 'smerrill/vcl-vim-plugin'
Plug 'omnisharp/omnisharp-vim'
Plug 'editorconfig/editorconfig-vim'
call plug#end()
set tabstop=4
set shiftwidth=4
colorscheme badwolf
:set number relativenumber
:set mouse=a
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
