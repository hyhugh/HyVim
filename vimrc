"==========================================
" Initial Plugin
"==========================================

" change the leader key
let mapleader = "\<space>"
let g:mapleader = "\<space>"

" syntax highlighting
syntax on
set ttyfast
set lazyredraw
" set re=0

" install bundles
if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
elseif filereadable(expand("~/.config/nvim/vimrc.bundles")) " neovim
    source ~/.config/nvim/vimrc.bundles
endif

" ensure ftdetect et al work by including this after the bundle stuff
filetype plugin indent on

"==========================================
" General Settings
"==========================================

" history size
set history=2000

" detect filetype
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

" autoread
set autoread
" i don't help uganda
set shortmess+=c
set updatetime=300
" disable backup
set nobackup
set nowritebackup
" disable swapfile
set noswapfile
set wildignore=*.swp,*.bak,*.pyc,*.class,.svn
" disable mouse
set mouse=n

" change the terminal's title
set title

" open new split window below current window
set splitbelow

" disable sound
set novisualbell
set noerrorbells
set t_vb=
set tm=500

" Remember info about open buffers on close
set viminfo^=%

" For regular expressions turn magic on
set magic

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"==========================================
" Display Settings
"==========================================

" show current row and col num
set display-=msgsep
set ruler
set showcmd
set showmode
" 在上下移动光标时，光标的上方或下方至少会保留显示的行数
set scrolloff=7

" show current col
" set cursorcolumn
" show current row
" set cursorline

set number
set wrap
set showmatch
set matchtime=2
" Highlight search
set hlsearch
set incsearch
set ignorecase
set smartcase

" fold code
set foldenable
set foldmethod=indent
set foldlevel=99

let g:FoldMethod = 0
map <leader>zz :call ToggleFold()<cr>
fun! ToggleFold()
    if g:FoldMethod == 0
        exe "normal! zM"
        let g:FoldMethod = 1
    else
        exe "normal! zR"
        let g:FoldMethod = 0
    endif
endfun

" Smart indent
set smartindent
" never add copyindent, case error   " copy the previous indentation on autoindenting
set autoindent

" tab related
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
set shiftround

" A buffer becomes hidden when it is abandoned
set hidden

" 相对行号: 行号变成相对，可以用 nj/nk 进行跳转
set relativenumber number

autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber
function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber number
    else
        set relativenumber
    endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

"==========================================
" File Encoding Settings
"==========================================
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set termencoding=utf-8
"==========================================
" others
"==========================================
" autocompleting for exmode
set wildmenu
set wildmode=list:longest,full

" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.class

" auto reload
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"==========================================
" Shortcut Settings
"==========================================

" turn off arrow keys
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

"Treat long lines as break lines (useful when moving around in them)
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

" I can type :help on my own, thanks.  Protect your fat fingers from the evils of <F1>
noremap <F1> <Esc>"

" F2 line number on/off
function! HideNumber()
    if(&relativenumber == &number)
        set relativenumber! number!
    elseif(&number)
        set number!
    else
        set relativenumber!
    endif
    set number?
endfunc
nnoremap <c-F2> :call HideNumber()<CR>
" F4 line wrapping on/off
nnoremap <c-F4> :set wrap! wrap?<CR>
" F6 syntax highlighting on/off
nnoremap <c-F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>

set pastetoggle=<c-F5>            "    when in insert mode, press <F5> to go to
"    paste mode, where you can paste mass data
"    that won't be autoindented

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <leader>wj <C-W>j
map <leader>wk <C-W>k
map <leader>wh <C-W>h
map <leader>wl <C-W>l

" Go to home and end using capitalized directions
noremap H g^
noremap L g$

" Map ; to : and save a million keystrokes
nnoremap ; :

" exmode，ctrl-a to the line beginning, c-e to the end
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" searching related
nnoremap / /\v
vnoremap / /\v

" Keep search pattern at the center of the screen.
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" disable highlighting
noremap <silent><leader>/ :nohls<CR>

" nnoremap gd *``zz
nnoremap * *``zz

" for # indent, python文件中输入新行时#号注释不切回行首
autocmd BufNewFile,BufRead *.py inoremap # X<c-h>#

" tab/buffer related
" switch buffer
nnoremap [b :bprevious<cr>
nnoremap ]b :bnext<cr>
" arraw key switch tabs
noremap <left> :tabprev<CR>
noremap <right> :tabnext<CR>
noremap <up> :bprevious<CR>
noremap <down> :bnext<CR>

" tabs
map <leader>th :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tj :tabnext<cr>
map <leader>tk :tabprev<cr>

" switch to specific tab
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Toggles between the active and last active tab "
" The first tab is always 1 "
let g:last_active_tab = 1

nnoremap <silent> <leader>tt :execute 'tabnext ' . g:last_active_tab<cr>
autocmd TabLeave * let g:last_active_tab = tabpagenr()

" => 选中及操作改键
" 调整缩进后自动选中，方便再次操作
vnoremap < <gv
vnoremap > >gv

" y$ -> Y Make Y behave like other capitals
map Y y$

" 复制选中区到系统剪切板中
vnoremap <leader>y "+y
vnoremap <leader>c "+y

" select all
map <Leader>sa ggVG

" select block
nnoremap <leader>v V`}

" kj to Esc
" inoremap kj <Esc>

" Quickly close the current window
nnoremap <leader>q :q<CR>

" Quickly save the current file
nnoremap <leader>w :w<CR>
" Quickly reload the current file
nnoremap <leader>e :e<CR>

" switch ' `, for the convenience of jumping to marks
nnoremap ' `
nnoremap ` '
nnoremap <leader><leader>p :pc<cr>

" remap U to <C-r> for easier redo
nnoremap U <C-r>

" lazy boi doesn't want to switch modes
" inoremap <C-h> <Left>
" inoremap <C-l> <Right>

"==========================================
" FileType Settings
"==========================================

autocmd FileType c,python,java,cpp set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType json,ruby,javascript,typescript,typescript.tsx,html,css,xml,haskell,vue set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
autocmd FileType vue syntax sync fromstart
autocmd BufRead,BufNewFile *.md,*.mkd,*.markdown set filetype=markdown.mkd
autocmd BufRead,BufNewFile *.part set filetype=html

au BufNewFile,BufRead *.j,*.J set filetype=jasmin
au BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
au BufNewFile,BufRead *.camkes set filetype=camkes
autocmd FileType typescript.tsx syntax sync fromstart
au BufNewFile,BufRead *.tex set filetype=tex

" AutoSetFileHead
autocmd BufNewFile *.sh,*.py,*.java exec ":call AutoSetFileHead()"
function! AutoSetFileHead()
    if &filetype == 'sh'
        call setline(1, "\#!/bin/bash")
    endif
    if &filetype == 'python'
        call setline(1, "\#!/usr/bin/env python3")
    endif
    if &filetype == 'java'
        call setline(1,"/**")
        call setline(2," * ". expand('%:t:r'))
        call setline(3," */")
        call setline(4,"public class " . expand('%:t:r'). " {" ) 
        call setline(5,"")
        call setline(6,"}")
    endif
    normal G
    normal o
endfunc

"==========================================
" Highlighting and CursorShape
"==========================================

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

hi! link SignColumn   LineNr
hi! link ShowMarksHLl DiffAdd
hi! link ShowMarksHLu DiffChange
hi link ALEError Error
hi Warning term=underline cterm=underline ctermfg=Yellow gui=undercurl guisp=Gold
hi link ALEWarning Warning
hi link ALEInfo SpellCap

let java_highlight_functions = 1
let java_highlight_all = 1
" let java_highlight_debug=1
let java_highlight_java_io=1
let java_highlight_java_lang_ids=1

set completeopt=menu,menuone
set display-=msgsep

" disable the annoying omni sql mapping
let g:omni_sql_no_default_maps = 1

" Neovim specific
" let g:python3_host_prog = '/Users/hyman/.pyenv/versions/neovim/bin/python3.7'
