" Hide vim intro message :intro
set shortmess+=I

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2
set backspace=indent,eol,start
syntax on
set relativenumber
set nu rnu " relative line numbering

" Search related
set showmatch "highlights matching brackets
set incsearch "search as characters are entered
set hlsearch "highlights matching searches
set smartcase
set hidden
set ignorecase
set noerrorbells
set visualbell

" === Text Rendering ===
syntax enable " enable syntax highlighting
set wrap " enable line wrapping
set linebreak " avoid wrapping a line in the middle of a word
set tabstop=4 softtabstop=4
set shiftwidth=4 " when shifting, indent using four spaces
set expandtab	" convert tabs to spaces
set smartindent
set sidescroll=5
set scrolloff=5
set ruler
set encoding=utf-8
set title
let g:SuperTabDefaultCompletionType = "<c-n>"
" set filetype plugin on
set autoindent	" new lines inherit the indentation of previous lines

call plug#begin(stdpath('data') . '/plugged')
Plug 'preservim/nerdtree'
" Plug 'Valloric/YouCompleteMe' Does not work on win 10 nvim
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'ap/vim-css-color' "Displays a preview of colors with CSS 
Plug 'ianks/vim-tsx'                       " Syntax highlighting and indenting for TSX
Plug 'sheerun/vim-polyglot'                " syntax highlighting
Plug 'jiangmiao/auto-pairs'                " auto close brackets
Plug 'prettier/vim-prettier'               " code formatting
Plug 'scrooloose/nerdcommenter'            " easy commenting
Plug 'scrooloose/nerdtree'                 " find files by dir tree
Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-dispatch'                  " async command line commands
Plug 'tpope/vim-fugitive'                  " git integration
Plug 'tpope/vim-rhubarb'                   " github for fugitive
Plug 'tpope/vim-surround'                  " surround with tags
Plug 'leafgarland/typescript-vim'          " typescript plugin 
Plug 'mbbill/undotree'                     " undo mgmt 
call plug#end()
" colorscheme gruvbox
" set colorcolumn=80
" highlight ColorColumn ctermbg=0 guibg=lightgrey

" map leader to space
let mapleader = ' '

" Add mouse support
set mouse+=a

"clears highlights
nnoremap // :noh<return>
" moves current line down or up
nnoremap <leader>- ddp
" set filetype on
nnoremap <leader>_ ddkP
" open vimrc in vertical split
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" update changes into current buffer
nnoremap <leader>sv :source $MYVIMRC<cr>

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.


nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

" Enable folding
set foldmethod=indent
set foldlevel=99
"Enable folding with the spacebar
nnoremap <space> za
" open files with ctrl-p
nnoremap <c-p> :Files<cr>
au BufNewFile,BufRead *.py,*.java,*.cpp,*.c,*.cs,*.rkt,*.h,*.html
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=120 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |



" air-line
let g:airline_powerline_fonts = 1
" let g:airline_theme = 'jellybeans'
let g:airline_theme = 'base16'
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''


highlight Comment cterm=italic gui=italic
" set showtabline=2
" true colours
" set background=dark
set t_Co=256
"
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif
" colorscheme jellybeans
colorscheme base16-onedark
" Make vim/nvim background transparent, has to come after colorscheme
hi Normal guibg=NONE ctermbg=NONE
" or Vim<8, replace EndOfBuffer by NonText
autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE
highlight CursorColumn guibg=#404040
" Language support

" c++11 support in syntastic
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11'
" run code
augroup compileandrun
    autocmd!
    autocmd filetype python nnoremap <f5> :w <bar> :!python3 % <cr>
    autocmd filetype cpp nnoremap <f5> :w <bar> !g++ -std=c++11 % <cr> :vnew <bar> :te "a.exe" <cr><cr>
    autocmd filetype cpp nnoremap <f6> :vnew <bar> :te "a.exe" <cr>
    autocmd filetype c nnoremap <f5> :w <bar> !make %:r && ./%:r <cr>
    autocmd filetype java nnoremap <f5> :w <bar> !javac % && java %:r <cr>
augroup END
