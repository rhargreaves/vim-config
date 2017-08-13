set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
call pathogen#infect()      " Load all the plugins
call pathogen#helptags()    " Generate help tags for plugins
filetype on                 " Reenable filetype
filetype indent on
filetype plugin on

Bundle 'gmarik/vundle'
Plugin 'christoomey/vim-tmux-navigator'

" }}}
" Bundled plugins {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use the matchit macro to enable switching between open close tags and
" if/elsif/else/end with %
runtime macros/matchit.vim
runtime ftplugin/man.vim  " Enable viewing man pages

" }}}
" Basic stuff {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set guifont=Menlo\ for\ Powerline
set noerrorbells          " No annoying beeps
set visualbell t_vb=
set history=1000          " Increase command history size
set ruler                 " Show the ruler
set incsearch             " Incomplete search matches
set hlsearch              " Keep search highlight after complete
set number
set showmode              " Show the current mode in the last line
set showcmd               " Show the current command in the last line
set showmatch             " Highlight matching brackets
set wildmenu              " Improve tab completion menu
set wildmode=list         " Tab complete longest common string and show list
set t_Co=256              " Set 256 color mode
set wildignore+=.git,.hg,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.node                           " Node compiled addons
set wildignore+=*/node_modules/*                 " Node project modules source
set wildignore+=*/coverage/*                     " Code coverage files
set wildignore+=*/.sass-cache/*                     " Code coverage files
set encoding=utf-8        " Default to UTF-8
set scrolloff=2           " start scrolling 2 lines from screen edge
syntax on                 " Enable syntax highlighting
colorscheme badwolf       " Make it pretty
set background=dark
"colorscheme distinguished

set hidden                " Hide rather than close abandoned buffers
set backspace=2           " Make backspace work for indent, eol, start
set shortmess=atI         " Shorten the large interruptive prompts
set ttyfast               " Smoother redrawing with multiple windows
set lazyredraw            " Suspend redrawing while running macros
set matchtime=3           " Jump to matching paren for a briefer time
set splitbelow            " Open new splits below current window
set splitright            " Open new vsplits to the right
set autowrite             " Autowrite files when leaving
set report=0              " Always tell me how many lines were affected
set dictionary=/usr/share/dict/words
set completeopt=menuone   " Show menu even for one item and no preview

" }}}
" GUI stuff {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('gui_running')
	set confirm                      " Show a dialog when quiting and not saved
	set guioptions-=T                " Hide the toolbar
	set guioptions-=m                " Hide the menu
	set guioptions-=l                " Hide the left hand scrollbar
	set guioptions-=r                " Hide the right hand scrollbar
	set guioptions-=b                " Hide the bottom scrollbar
endif

" }}}
" Cursor settings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set cursorline                       " Highlight the line under the cursor
set nocursorcolumn                   " Don't Highlight the column
au WinEnter * setlocal cursorline    " Turn on cursorline on focus
au WinLeave * setlocal nocursorline  " And off on losing focus
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
" }}}
" Color column settings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set colorcolumn=80        " Show 80 char column in light grey
highlight ColorColumn ctermbg=239 guibg=#4f4f4f
" Disable colorcolumn in the quickfix buffers
au Filetype qf setlocal colorcolumn=0 nolist nocursorline nowrap

" }}}
" Backups, undo and swapfiles {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set undofile
set undodir=~/.vim/tmp/undo,~/tmp,/tmp
set backupdir=~/.vim/tmp/backup,~/tmp,/tmp
set directory=~/.vim/tmp/swap/,~/tmp,/tmp
set noswapfile

"Shortcut mapping
noremap <leader><tab> :Stab<cr>
set cindent                         " Indent new lines to same level as last
set listchars=tab:▸▸,trail:-        " Nicer whitespace characters
set list                            " Show whitespace
set softtabstop=4                   " 4 spaces is a tab when editing/inserting
set tabstop=4                       " 4 spaces is equivalent to a tab
set shiftwidth=4                    " Shift by 4 spaces
set mouse=nv                        " Allow Mouse in normal and visual mode

" Override colourscheme - darken whitespace characters
hi NonText ctermfg=darkgrey guifg=darkgrey
hi clear SpecialKey
hi link SpecialKey NonText

" }}}
" Folding {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! SimpleFoldText()
	return getline(v:foldstart).' '
endfunction

set foldlevelstart=99               " Open all folds
set foldcolumn=3                    " Show 3 levels
set foldtext=SimpleFoldText()       " Only the function name

" }}}
" Keymaps {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=","
let maplocalleader=","

" Toggle NERDTRee with F2 in command mode
noremap <f2> :NERDTreeToggle<cr>
" and in insert mode
inoremap <f2> :NERDTreeToggle<cr>i
" Open .vimrc in a new split for quick editing
nnoremap <leader>ev :split $MYVIMRC<cr>
" Source .vimrc in current window
nnoremap <leader>sv :source $MYVIMRC<cr>
" Go to start of line
nnoremap H 0
" Go to end of line
nnoremap L $
" copy and paste with xclip
vnoremap <leader>y :!xclip -f -sel  clip<CR>
" noremap <leader>p :-1r !xclip -o -sel clip<CR>
" Disable paste mode when leaving insert mode
if has('autocommand')
	au InsertLeave * set nopaste
endif

" }}}
" Tab keymaps {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>tn          :tabn<cr>
nnoremap <leader>tp          :tabp<cr>
nnoremap <leader>te          :tabe<space>
nnoremap <leader>tc          :tabclose<cr>

"
" }}}
" Commandline  keymaps {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" }}}
" Toggle numbering {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! ToggleNumberingMode()
	if (&rnu == 1)
		set norelativenumber
	else
		set relativenumber
	endif
endfunction

nnoremap <leader>n      :call ToggleNumberingMode()<CR>

" }}}
" Whitespace keymaps {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle whitespace
noremap <leader>l :set list!<cr>
" Strip Trailing
nnoremap <leader>W :call <SID>StripTrailingWhitespaces()<cr>
nnoremap <S-Tab>          <<
vnoremap <S-Tab>          <<

nnoremap <leader>w        :write<cr>

" }}}
" Mode switching keymaps {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Exit insert mode
inoremap jk               <esc>
nnoremap <F12>            :set paste!<cr>

" }}}
" Spellchecking keymaps {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <leader>ss             :setlocal spell!<cr>
" Next misspelling
noremap <leader>sn             ]s
" Previous misspelling
noremap <leader>sp             [s
" Add word to dictionary
noremap <leader>sa             zg
noremap <leader>s?             z=

" }}}
" Airline {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_right_sep=''
let g:airline_left_sep=''

" }}}
" Help shortcuts {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <F1>             <ESC>
nnoremap <F1>             :above help <c-r>=expand("<cword>")<cr><cr>
vnoremap <F1>             <ESC>
cmap help                 :above help

" }}}
" Remap annoying default keymaps {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move up and down by screenline instead of file line
nnoremap j                gj
nnoremap k                gk
" Fix vim's regexp search to use perl regexps
nnoremap /                /\v
vnoremap \                /\v
" Move to matching bracket
nnoremap <tab>            %
vnoremap <tab>            %
" Don't enter ex mode
noremap Q                 <nop>

" Turn off search highlighting
nnoremap <leader><space>  :noh<cr>
" Highlight word at cursor and return to same position
nnoremap <leader>h *<C-O>

" }}}}}}
" Ack configuration {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bring up ack ready to searc
nnoremap <leader>a        :Ack!<Space>
" Highlight word at cursor and then Ack it.
nnoremap <leader>H        *<C-O>:AckFromSearch!<CR>

" }}}}}}
" Command Maps {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable saving readonly files with sudo
cmap w!! %!sudo tee > /dev/null %
command! -nargs=1 -range SuperRetab <line1>,<line2>s/\v%(^ *)@<= {<args>}/\t/g
cmap Q q

" }}}
" Indent Guides configuration {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

" }}}
" Syntastic configuration {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_mode_map = { 'mode': 'active',
                         \ 'active_filetypes': [ 'javascript' ],
                         \ 'passive_filetypes': [] }
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_jump = 1
let g:syntastic_check_on_open = 1
let g:syntastic_aggregate_errors = 1

" }}}
" Rainbow Parentheses configuration {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>R :RainbowParenthesesToggle<cr>
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16

augroup rainbowparentheses
	au!

	" Turn on rainbow parentheses for all types by default
	au VimEnter * RainbowParenthesesToggle
	au Syntax * RainbowParenthesesLoadRound
	au Syntax * RainbowParenthesesLoadSquare
	au Syntax * RainbowParenthesesLoadBraces
augroup END

" }}}
" Fugitive configuration {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>gs           :Gstatus
nnoremap <leader>gd           :Gdiff
" nnoremap <leader>gw           :Gwrite
nnoremap <leader>ga           :Gadd
nnoremap <leader>gco          :Gcheckout
nnoremap <leader>gci          :Gcommit

" }}}
" NERDTree configuration {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeIgnore = ['\~$','\.git']
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" }}}
" supertab configuration {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = '<C-x><C-o>'

if has('autocommand')
	augroup ft_clojure
		au!

		" Disable delimitMate for clojure
		au FileType clojure let b:loaded_delimitMate=1
	augroup END
endif

" }}}
" Taglist configuration {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50
noremap <F5> :TlistToggle<cr>
noremap <F8> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>

" }}}
" Gundo configuration {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F6> :GundoToggle<cr>
let g:gundo_right = 1

" }}}
" Cscope configuration {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")
	set csprg=/usr/bin/cscope
	set csto=0
	set cst
	set nocsverb
	" Add cscope database in current directory
	if filereadable("cscope.out")
		cs add cscope.out
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif
endif

" }}}
" CtrlP configuration {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_open_new_file = 1         " Open new files in tabs
let g:ctrlp_dotfiles = 1
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" }}}
" Enable toggling of the quickfix and errors window {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! ToggleErrors()
	if exists("w:is_error_window")
		unlet w:is_error_window
		lclose
	else
		exec "Errors"
		botright lopen
		let w:is_error_window = 1
	endif
endfunction

function! ToggleQuickFix(forced)
	if exists('g:quickfix_is_open') && a:forced == 0
		unlet g:quickfix_is_open
		cclose
	else
		botright copen 10
		let g:quickfix_is_open = bufnr("$")
	endif
endfunction

command! -bang -nargs=? ToggleQuickFix call ToggleQuickFix(<bang>0)
command! ToggleErrors call ToggleErrors()

noremap <F4> :ToggleQuickFix<CR>
noremap <F3> :ToggleErrors<CR>

" }}}
" Scratch {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! ToggleScratch()
	if exists('w:scratch_is_open')
		unlet w:scratch_is_open
		exec "q"
	else
		Sscratch
		let w:scratch_is_open = 1
	endif
endfunction

nnoremap <leader>S call ToggleScratch()

" }}}
" Statusline {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline=%02n:%<                         " Buffer no
set statusline+=%f                              " Path
set statusline+=%m                             " Modified flag
set statusline+=%r                             " Readonly flag
set statusline+=%{fugitive#statusline()}       " Show git repo status

set statusline+=%#error#                       " Error highlight
set statusline+=%{SyntasticStatuslineFlag()}   " Show syntastic error status
set statusline+=%*                             " Reset highlighting

set statusline+=%=                             " Right align

set statusline+=%c,                            " Cursor column
set statusline+=%l/%L                          " Cursor line / total lines
set statusline+=(
set statusline+=%{&ff}                         " Line ending format
set statusline+=/
set statusline+=%{strlen(&fenc)?&fenc:&enc}    " Encoding
set statusline+=/
set statusline+=%{&ft}                         " Filetype
set statusline+=)

" Always show status line
set laststatus=2

if has("autocmd")
	augroup ft_statusline_background_colour
		au InsertEnter * hi StatusLine ctermfg=15 guifg=#FF3145
		au InsertLeave * hi StatusLine ctermfg=236 guifg=#CD5907
	augroup END
endif

" }}}
" Css and less files {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
	augroup ft_css
		au!

		au BufNewFile,BufRead *.less setlocal filetype=less

		" Make folding work
		au FileType less,css setlocal foldmethod=marker
		au FileType less,css setlocal foldmarker={,}
	augroup END
endif

" }}}
" Javascript files {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
	augroup ft_javascript
		au!

		au FileType javascript setlocal foldmethod=marker
		au FileType javascript setlocal foldmarker={,}
		au FileType javascript setl formatprg=js-beautify\ -t\ -j\ -w\ 80\ -f\ -
		au BufWritePre *.js :%s/\s\+$//e
	augroup END
endif

" }}}
" Vimscript files {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
	augroup ft_vim
		au!

		au FileType vim setlocal foldmethod=marker
	augroup END
endif

" }}}
" Ruby files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
	augroup ft_ruby
		au FileType ruby setlocal foldmethod=syntax
		au FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
		au FileType ruby map <buffer> <localleader>ra        :RunSpecs<cr>
		au FileType ruby map <buffer> <localleader>rs        :RunSpec<cr>
		au FileType ruby map <buffer> <localleader>rl        :RunSpecLine<cr>
	augroup END
endif

" }}}
" Scheme files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
	augroup ft_scheme
		au FileType scheme setlocal foldmethod=syntax
		au FileType scheme setlocal ts=2 sts=2 sw=2 expandtab
		au FileType scheme let b:delimitMate_quotes = "\""
		au FileType scheme setlocal equalprg=scmindent.rkt
	augroup END
	autocmd filetype lisp,scheme,art,clojure setlocal equalprg=scmindent.rkt
endif

" }}}
" Clojure files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RunMidje() "{{{
	Eval (require 'midje.repl)(midje.repl/load-facts :all)
endfunction " }}}

command! Midje call RunMidje()

" }}}
" Commands to run on startup {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
	autocmd VimEnter * wincmd p

	" Custom tab settings
	" make must be tabs
	autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
	" yaml and coffeescript must be spaces
	autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType coffee setlocal ts=2 sts=2 sw=2 expandtab
	" Use javascript filetype for json files
	autocmd BufRead *.json setlocal filetype=javascript
	autocmd BufEnter * let &titlestring="vim: " . expand("%:t")
endif

" }}}
" Enable project level vimrcs {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set exrc
set secure
