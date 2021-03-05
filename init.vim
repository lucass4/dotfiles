call plug#begin('~/.vim/plugged')
set nocompatible

Plug 'scrooloose/nerdtree' " file explorer
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim' " Powerbar
Plug 'andymass/vim-matchup'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'APZelos/blamer.nvim'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-commentary' " g cc to comment gcc to uncomment
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-signify'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
" Plug 'dense-analysis/ale'
Plug 'honza/vim-snippets'
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'sebdah/vim-delve'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Chiel92/vim-autoformat'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'junegunn/seoul256.vim'

" Plug 'davidhalter/jedi-vim'

call plug#end()

let g:python3_host_prog = '/Users/lucas.santanna/.pyenv/shims/python'

set noshowmode
set undofile
set autoindent                    " take indent for new line from previous line
" set smartindent                   " enable smart indentation
set autoread                      " reload file if the file changes on the disk
set autowrite                     " write when switching buffers
set autowriteall                  " write on :quit
set clipboard=unnamedplus
" set colorcolumn=120                " highlight the 120th column as an indicator
set cursorline                    " highlight the current line for the cursor
set encoding=utf-8
set list                          " show trailing whitespace
set listchars=tab:\|\ ,trail:▫
set nospell                       " disable spelling
set noswapfile                    " disable swapfile usage
set nowrap
set noerrorbells                  " No bells!
set novisualbell                  " I said, no bells!
set number                        " show number ruler
set relativenumber                " show relative numbers in the ruler
set ruler
set title                         " let vim set the terminal title
set updatetime=300                " redraw the status bar often
set maxmempattern=80000           " increase max memory to show syntax highlighting for large files
set guioptions-=m                 " remove menu bar
set guioptions-=T                 " remove toolbar
set guioptions-=r                 " remove right-hand scroll bar
set guioptions-=L                 " remove left-hand scroll bar
set expandtab                     " expands tabs to spaces
set softtabstop=2
set tabstop=2
syntax on

" Splits
"----------------------------------------------
" Create horizontal splits below the current window
set splitbelow
set splitright

" Allow vim to set a custom font or color for a word
syntax enable
set background="dark"
colorscheme seoul256

let g:lightline = { 'colorscheme': 'powerline', }

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

" Language: Go
" Tagbar configuration for Golang
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

let g:delve_backend = 'native'

" Tmux vim integration
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = 'goimports'
let g:go_fmt_options = {
  \ 'goimports': '-local do/',
  \ }

let g:go_debug_windows = {
      \ 'vars':  'leftabove 35vnew',
      \ 'stack': 'botright 10new',
      \ }


let g:go_test_prepend_name = 1
let g:go_list_type = 'quickfix'
let g:go_auto_type_info = 0
let g:go_auto_sameids = 0
let g:go_info_mode = 'gocode'

let g:go_def_mode = 'godef'
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


" FZF
let g:fzf_command_prefix = 'Fzf'
let g:fzf_layout = { 'down': '~20%' }

let g:indentLine_enabled = 1
let g:indentLine_char = '⎸'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 1

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Signify
let g:signify_sign_add    = '┃'
let g:signify_sign_change = '┃'
let g:signify_sign_delete = '•'
let g:signify_sign_show_count = 0 "


nnoremap Y y$ " Make Y behave like other capitals

" Move between buffers with Shift + arrow key...
nnoremap <S-Left>  :bprevious<cr>
nnoremap <S-Right> :bnext<cr>

" Tagbar
nmap <F8> :TagbarToggle<CR>

" Do not show stupid q: window
map q: :q

" search
nmap <C-b> :FzfHistory<cr>
imap <C-b> <esc>:<C-u>FzfHistory<cr>

" search across files in the current directory
nmap <C-p> :FzfFiles<cr>
imap <C-p> <esc>:<C-u>FzfFiles<cr>

" Disable Arrows
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" CTRLSF
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

" NERDTREE
nnoremap <F10> :NERDTreeToggle<cr>	nnoremap <F10> :NERDTreeToggle<cr>
nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <silent> <expr> <Leader>s (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"

" VIMGO MAPPINGS
nnoremap <silent> <Leader>gb :GoBuild<CR>
nnoremap <silent> <Leader>gr :GoRun<CR>
nnoremap <silent> <Leader>gt :GoTest<CR>
nnoremap <silent> <Leader>gd :GoDecls<CR>
nnoremap <silent> <Leader>gi :GoInfo<CR>
nnoremap <silent> <Leader>gl :GoMetaLinter<CR>
nnoremap <silent> <Leader>gD :GoDeclsDir<CR>
nnoremap <silent> <Leader>gc :GoCoverage<CR>
nnoremap <silent> <Leader>gg :GoDef<CR>

" Maps I like
nnoremap <space> zz " Center the screen quickly
nnoremap <leader>v :vsplit<cr>
nnoremap <leader>h :split<cr>
nnoremap <leader>w :w!<CR>
nnoremap <leader>q :q!<CR>
nnoremap <leader>l <C-w>
nnoremap <leader>L <C-W>
map <Leader><Space> :noh<CR>
nnoremap <leader>b :BlamerToggle<cr>

" Undotree
nnoremap <F9> :UndotreeToggle<CR>

autocmd BufLeave * silent! :wa " Autosave buffers before leaving them
autocmd BufWritePre * :%s/\s\+$//e " Remove trailing white spaces on save
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " Disable comment continuation on paste
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif "if the only window left is nerdtree then close


autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" " let g:ale_fix_on_save = 1
" let g:airline#extensions#ale#enabled = 1
" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)

" COC
set hidden " if hidden is not set, TextEdit might fail.
set nobackup
set nowritebackup
set cmdheight=2
set shortmess+=c
set signcolumn=yes

set noshowcmd

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

command! -nargs=0 Format :call CocAction('format')

" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected

au BufWrite * :Autoformat

"Auto ident
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

" Terraform setup
let g:terraform_align=1
let g:terraform_fmt_on_save=1

" Alacritty color
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48:2;%lu;%lu;%lum"
