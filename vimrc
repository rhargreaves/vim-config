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
Plug 'rhysd/vim-clang-format'
Plug 'justinmk/vim-syntax-extra'
call plug#end()
set tabstop=4
set shiftwidth=4
:set number
:set mouse=a
colorscheme badwolf
map <F2> :NERDTreeToggle<CR>
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'
let g:clang_format#auto_format = 1
