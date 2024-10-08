" ==========================================
" bundle settings
" ==========================================

"------------------------------------------- begin of configs --------------------------------------------

set nocompatible
filetype off " required! turn off

" ----------------------------------------------------------------------------
" vim plugin bundle control, command model
" ----------------------------------------------------------------------------

call plug#begin('~/.vim/bundle')

" fuzzy search plugin
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"vim-snippets and ultisnips
Plug 'honza/vim-snippets'
Plug 'nvim-lua/plenary.nvim'

" semantic autocompleting
"{{{
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind.nvim'
"}}}
"
" symbol autocompleting
Plug 'hyhugh/auto-pairs'
" quick comment out
Plug 'scrooloose/nerdcommenter'
" for repeat -> enhance surround.vim, . to repeat command
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
" trailingwhitespace
Plug 'ntpeters/vim-better-whitespace'
" easymotion
Plug 'Lokaltog/vim-easymotion'
" quickscope
Plug 'unblevable/quick-scope'
" signature
Plug 'kshenoy/vim-signature'
" quick selection and edit
Plug 'terryma/vim-expand-region'
" multiplecursors
Plug 'mg979/vim-visual-multi'
" lightline
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'morhetz/gruvbox'
" nerdtree 
Plug 'scrooloose/nerdtree'
" text object
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
" tmux suppoort
Plug 'christoomey/vim-tmux-navigator'
" buffer delete support
Plug 'moll/vim-bbye'
" indent line

Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'rcarriga/nvim-notify'
Plug 'stevearc/dressing.nvim'


" extra syntax {{{
Plug 'hail2u/vim-css3-syntax'
Plug 'harenome/vim-mipssyntax'
Plug 'ARM9/arm-syntax-vim'
Plug 'udalov/kotlin-vim'
" }}}

" ctrlsf
Plug 'dyng/ctrlsf.vim'

"bazel support
Plug 'google/vim-maktaba'
Plug 'bazelbuild/vim-bazel'

" esay-easyescape
Plug 'hyhugh/vim-easyescape-plus'

" latex support
Plug 'lervag/vimtex'

" nvim
Plug 'stevearc/dressing.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'akinsho/flutter-tools.nvim'

call plug#end()

colorscheme gruvbox
set termguicolors
set background=dark

" ################### AutoCompletion ###################
"  {{{
" config moved to lua and nvim-cmp
"}}}

" closetag {{{
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
" }}}

" nerdcommenter {{{
let g:NERDSpaceDelims=1
let g:NERDAltDelims_python = 1
let g:NERDCustomDelimiters = { 'typescript.tsx': { 'left': '{/*','right': '*/}' } }
" }}}

" trailingwhitespace {{{
let g:better_whitespace_filetypes_blacklist=['ctrlsf', 'vim']
map <leader><leader>s :StripWhitespace<cr>
" }}}
" ################### 快速移动 ###################

" easymotion {{{
let g:EasyMotion_smartcase = 1
"let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><leader>l <Plug>(easymotion-lineforward)

map <Leader><leader>. <Plug>(easymotion-repeat)
" }}}

" quickscope {{{
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" }}}

" expandregion {{{
vmap J <Plug>(expand_region_expand)
vmap K <Plug>(expand_region_shrink)

" Extend the global default
call expand_region#custom_text_objects({
            \ 'a]' :1,
            \ 'ab' :1,
            \ 'aB' :1,
            \ 'ii' :0,
            \ 'ai' :0,
            \ })
" }}}


" lightline {{{


" lightline
let g:lightline = {
  \ 'colorscheme': 'gruvbox',
  \ 'active': {
  \   'left': [
  \     [ 'mode', 'paste' ],
  \     [ 'git', 'diagnostic',  'filename', 'method', 'modified' ]
  \   ],
  \   'right':[
  \     [ 'fileformat', 'fileencoding', 'filetype', 'lineinfo', 'percent' ],
  \     [ 'blame' ],
  \   ],
  \ },
  \ 'tabline': {
  \    'left': [ ['buffers'] ],
  \    'right': [ ['close'] ],
  \ },
  \ 'component_expand': {
  \    'buffers': 'lightline#bufferline#buffers'
  \ },
  \ 'component_type': {
  \    'buffers': 'tabsel'
  \ },
  \ 'component_function': {
  \ }
\ }
let g:lightline.component_raw = {'buffers': 1}
let g:lightline#bufferline#clickable = 1
" }}}


" nerdtree nerdtreetabs {{{
let NERDTreeHighlightCursorline=1
let NERDTreeMinimalMenu=1
let NERDTreeHijackNetrw=1
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$', '\.class$', '^__pycache__$' ]

"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end

let g:NERDTreeMapOpenSplit = 's'
let g:NERDTreeMapOpenVSplit = 'v'
let g:NERDTreeWinPos = "right"

nnoremap <silent> <leader>g :NERDTreeFind<cr>
nnoremap <silent> <leader>n :NERDTreeFocus<cr>
autocmd FileType nerdtree nnoremap <buffer> <leader>n <c-w><c-p>
autocmd FileType nerdtree nnoremap <buffer> <esc> <c-w><c-p>
" }}}

" nerdtreetabs {{{
map <leader><F8> <plug>NERDTreeTabsToggle<CR>
" 关闭同步
" let g:nerdtree_tabs_synchronize_view=0
" let g:nerdtree_tabs_synchronize_focus=0
let g:nerdtree_tabs_open_on_console_startup=0
let g:nerdtree_tabs_open_on_gui_startup=0
" }}}

" FZF {{{
au FileType fzf set nonu nornu
nnoremap <leader>. :Tags<cr>
nnoremap <leader>> :Tags <C-R><C-W><CR>
nnoremap <leader>f :RG<CR>
nnoremap <Leader>F :RG <C-R><C-W><CR>
nnoremap <leader>b :BLines <CR>
nnoremap <leader>B :BLines <C-R><C-W><cr>
nnoremap <leader>p :Files <CR>

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let options = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  let options = fzf#vim#with_preview(options, 'up:40%', 'ctrl-/')
  call fzf#vim#grep(initial_command, 1, options, a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

let g:fzf_buffers_jump = 1
let g:fzf_tags_command = 'ctags -R'

let g:fzf_preview_window = ['up:40%', 'ctrl-/']
" }}}

" pythonsyntax {{{
let python_highlight_all = 1
" }}}

" markdown {{{
let g:vim_markdown_folding_disabled=1
" let g:instant_markdown_autostart = 0
" }}}

" javascript {{{
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
" }}}

" json {{{
let g:vim_json_syntax_conceal = 0
" }}}

" golang support {{{
let g:go_fmt_autosave = 0
" }}}

" vim latex{{{
let g:vimtex_mappings_enabled = 0
let g:vimtex_view_automatic = 1
let g:tex_flavor = 'latex'
let g:vimtex_disable_version_warning = 1
let g:vimtex_compiler_latexmk = {
            \ 'build_dir' : '',
            \ 'callback' : 0,
            \ 'continuous' : 1,
            \ 'executable' : 'latexmk',
            \ 'hooks' : [],
            \ 'options' : [
            \   '-verbose',
            \   '-shell-escape',
            \   '-file-line-error',
            \   '-synctex=1',
            \   '-interaction=nonstopmode',
            \ ],
            \}

if has('unix')
    let g:vimtex_view_general_viewer = 'okular'
    let g:vimtex_view_general_options = '--noraise --unique file:@pdf\#src:@line@tex'
else
    let g:vimtex_view_general_viewer = 'skim'
endif

" }}}
"
"" ctrlsf {{{
let g:ctrlsf_search_mode = 'async'
nmap \ <Plug>CtrlSFCwordPath<CR>
nmap <leader>\ :CtrlSF 
let g:ctrlsf_auto_focus = {
            \ "at" : "start",
            \}
let g:ctrlsf_position = 'bottom'
" let g:ctrlsf_winsize = '30%'
let g:ctrlsf_auto_close = 0
let g:ctrlsf_confirm_save = 0
let g:ctrlsf_ackprg = 'rg'
let g:ctrlsf_case_sensitive = 'smart'
let g:ctrlsf_ignore_dir = ['tags']
" }}}

"" vim easyescape {{{
let g:easyescape_string = "kj"
let g:easyescape_timeout = 300
"}}}

"" vim autopairs {{{
let g:AutoPairsShortcutFastWrap = "<C-e>"
let g:AutoPairsShortcutJump = '<C-l>'
let g:AutoPairsShortcutJumpBack = '<C-h>'
let g:AutoPairsMultilineClose = 0
"}}}

" vim-css3-syntax {{{
augroup VimCSS3Syntax
    autocmd!
    autocmd FileType css setlocal iskeyword+=-
augroup END
"}}}

" typescript {{{
let g:vim_jsx_pretty_colorful_config = 1
"}}}

" buffer delete {{{
nnoremap <leader>a :Bdelete<cr>
" }}}
" 

augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
augroup END


"------------------------------------------- end of configs --------------------------------------------
