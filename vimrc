call plug#begin('~/.vim/plugged')
set nocompatible              " :/be iMproved, required
filetype off                  " required
set encoding=utf8

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-signify'
Plug 'junegunn/gv.vim'
Plug 'hashivim/vim-terraform'
Plug 'juliosueiras/vim-terraform-completion'
Plug 'Yggdroot/indentLine'
Plug 'rizzatti/dash.vim'
Plug 'majutsushi/tagbar'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-surround'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'hashivim/vim-hashicorp-tools'
Plug 'Raimondi/delimitMate'
Plug 'ekalinin/Dockerfile.vim', {'for' : 'Dockerfile'}
Plug 'elzr/vim-json', {'for' : 'json'}
Plug 'mbbill/undotree'
Plug 'ryanoasis/vim-devicons'
Plug 'flazz/vim-colorschemes'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dyng/ctrlsf.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

call plug#end()

"=====================================================
"===================== SETTINGS ======================

set nocompatible
filetype on
filetype plugin indent on

set ttyfast

set laststatus=2
set encoding=utf-8              " Set default encoding to UTF-8
set autoread                    " Automatically reread changed files without asking me anything
set autoindent
set backspace=indent,eol,start  " Makes backspace key more powerful.
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set mouse=a                     "Enable mouse mode

set noerrorbells             " No beeps
set vb t_vb=

set number                   " Show line numbers
set showcmd                  " Show me what I'm typing
set noswapfile               " Don't use swapfile
set nobackup                 " Don't create annoying backup files
set splitright               " Split vertical windows right to the current windows
set splitbelow               " Split horizontal windows below to the current windows
set autowrite                " Automatically save before :next, :make etc.
set hidden
set fileformats=unix,dos,mac " Prefer Unix over Windows over OS 9 formats
set noshowmatch              " Do not show matching brackets by flickering
set noshowmode               " We show the mode with airline or lightline
set ignorecase               " Search case insensitive...
set smartcase                " ... but not it begins with upper case
set completeopt=menu,menuone
set nocursorcolumn           " speed up syntax highlighting
set nocursorline
set updatetime=300
set pumheight=10             " Completion window max size
set conceallevel=2           " Concealed text is completely hidden
set shortmess+=c             " Shut off completion messages
set noerrorbells
set ruler                    " Show the cursor position all the time
set title                    " Show title in console title bar

set lazyredraw

"http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
set clipboard^=unnamed
set clipboard^=unnamedplus

" increase max memory to show syntax highlighting for large files
set maxmempattern=40000

" ~/.viminfo needs to be writable and readable. Set oldfiles to 1000 last
" recently opened files, :FzfHistory uses it
set viminfo='1000

if has('persistent_undo')
  set undofile
  set undodir=~/.cache/vim
endif

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " Disable comment continuation on paste
autocmd BufWritePre * %s/\s\+$//e "trim whitespaces

" Disable menu bars
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar

" Color

syntax enable
set t_Co=256
set background=dark
let g:molokai_original = 1
let g:rehash256 = 1
colorscheme dracula
let g:airline_theme='dracula'


""" mapping utils
nnoremap <leader>w :w!<CR>
nnoremap <leader>q :q!<CR>
nnoremap <leader>l <C-w>
nnoremap <leader>L <C-W>


" NERD Tree
nnoremap <F10> :NERDTreeToggle<cr>
nnoremap <leader>n :NERDTreeToggle<cr>
let NERDTreeShowHidden=1

" Tagbar
nmap <F8> :TagbarToggle<CR>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Make Y behave like other capitals
nnoremap Y y$

" Do not show stupid q: window
map q: :q

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
if !has('gui_running')
  set notimeout
  set ttimeout
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

" ==================== vim-go ====================
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_options = {
  \ 'goimports': '-local do/',
  \ }

let g:go_debug_windows = {
      \ 'vars':  'leftabove 35vnew',
      \ 'stack': 'botright 10new',
      \ }


let g:go_test_prepend_name = 1
let g:go_list_type = "quickfix"
let g:go_auto_type_info = 0
let g:go_auto_sameids = 0
let g:go_info_mode = "gocode"

let g:go_def_mode = "godef"
let g:go_echo_command_info = 1
let g:go_autodetect_gopath = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_enabled = ['vet', 'golint']

let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 0
let g:go_highlight_build_constraints = 1
let g:go_highlight_types = 0
let g:go_highlight_operators = 1
let g:go_highlight_format_strings = 0
let g:go_highlight_function_calls = 0
let g:go_gocode_propose_source = 1

let g:go_modifytags_transform = 'camelcase'
let g:go_fold_enable = []

nnoremap <silent> <Leader>gb       :GoBuild<CR>
nnoremap <silent> <Leader>gr       :GoRun<CR>
nnoremap <silent> <Leader>gt       :GoTest<CR>
nnoremap <silent> <Leader>gd       :GoDecls<CR>
nnoremap <silent> <Leader>gi       :GoInfo<CR>
nnoremap <silent> <Leader>gl       :GoMetaLinter<CR>
nnoremap <silent> <Leader>gD       :GoDeclsDir<CR>
nnoremap <silent> <Leader>gc       :GoCoverage<CR>
nnoremap <silent> <Leader>gg       :GoDef<CR>


" ----------------------------------------------------------------------------
" vim-fugitive
" ----------------------------------------------------------------------------
nmap     <Leader>g :Gstatus<CR>gg<c-n>
nnoremap <Leader>d :Gdiff<CR>
nnoremap <Leader>b :Gblame<CR>

" ----------------------------------------------------------------------------
" undotree
" ----------------------------------------------------------------------------
"let g:undotree_WindowLayout = 2
nnoremap <F9> :UndotreeToggle<CR>

" Unselect the search result
map <Leader><Space> :noh<CR>

" ============================================================================
" FZF {{{
" ============================================================================
let g:fzf_command_prefix = 'Fzf'
let g:fzf_layout = { 'down': '~20%' }

" search
nmap <C-b> :FzfHistory<cr>
imap <C-b> <esc>:<C-u>FzfHistory<cr>

" search across files in the current directory
nmap <C-p> :FzfFiles<cr>
imap <C-p> <esc>:<C-u>FzfFiles<cr>

" ============================================================================
" Go Configuration {{{
" ============================================================================
let g:go_fmt_command = "goimports"
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
  \ }



let g:go_term_mode = "split"
let g:go_term_height = 60
let g:go_term_width = 60

" ==================== Completion + Snippet ====================
" Ultisnips has native support for SuperTab. SuperTab does omnicompletion by
" pressing tab. I like this better than autocompletion, but it's still fast.
let g:SuperTabDefaultCompletionType = "context"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" ============================================================================
" Disable Arrows {{{
" ============================================================================
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" ==================== vim-json ====================
let g:vim_json_syntax_conceal = 0

" webdev icons
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enabl = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 0
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

" vim: sw=2 sw=2 et

" ==========CTRLSF
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>


" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#deoplete_onmni_patterns = get(g:, 'deoplete#force_omni_input_patterns', {})
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
let g:deoplete#sources = {}
let g:deoplete#sources._=['omni', 'buffer', 'member', 'tag', 'ultisnips', 'file']

" Setup python
let g:python3_host_prog = '/Users/lucas/.pyenv/shims/python3'
