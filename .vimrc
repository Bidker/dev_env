set nocompatible               " be iMproved


filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()


" ctrlp - ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']


" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
Bundle 'indentpython.vim'
Bundle 'python.vim'
Bundle 'git.zip'
Bundle 'tpope/vim-fugitive'
Bundle 'jQuery'
Bundle 'SuperTab'
Bundle 'scrooloose/nerdtree'
Bundle 'pangloss/vim-javascript'
Bundle 'ciaranm/inkpot'
Bundle 'wombat256.vim'
Bundle 'bling/vim-airline'
Bundle 'majutsushi/tagbar'
Bundle 'posva/vim-vue'
Bundle 'junegunn/fzf.vim'
Bundle 'davidhalter/jedi-vim'
Bundle 'rking/ag.vim'
Bundle 'yggdroot/indentline'
Bundle 'w0rp/ale'

" fzf
set rtp+=/usr/local/opt/fzf
set rtp+=~/.fzf

" jedi-vim
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>u"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"

" ALE
let g:ale_sign_warning = '◆'
let g:ale_sign_error = '✗'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_linters = {'javascript': ['eslint'], 'vue': ['eslint'], 'python': ['flake8']}
let g:ale_python_flake8_executable = 'flake8'
"let g:ale_python_flake8_options = ''
let g:ale_linters_explicit = 1
let g:ale_echo_msg_format = '[%linter%] %code%: %s'

highlight link ALEWarningSign String
highlight link ALEErrorSign Title

nmap [w :ALENextWrap<CR>
nmap ]w :ALEPreviousWrap<CR>

nmap <Leader>f <Plug>(ale_fix)

" ag
nmap <silent> <leader>a :Ag ''<left>


filetype plugin indent on     " required by vundle!

" Note: This line MUST come before any <leader> mappings
let mapleader=";"


colorscheme wombat256mod


" other settings
set nobackup
set pastetoggle=<F8>

" ---------------
" UI
" ---------------
set ruler " Ruler on
set nu " Line numbers on
set nowrap " Line wrapping off
set laststatus=2 " Always show the statusline
set cmdheight=2
set encoding=utf-8

" ---------------
" Behaviors
" ---------------
syntax enable
set autoread " Automatically reload changes if detected
set wildmenu " Turn on WiLd menu
set hidden " Change buffer - without saving
set history=768 " Number of things to remember in history.
set cf " Enable error files & error jumping.
set clipboard+=unnamed " Yanks go on clipboard instead.
set autowrite " Writes on make/shell commands
set timeoutlen=350 " Time to wait for a command (after leader for example)
set foldlevelstart=99 " Remove folds
set formatoptions=crql

" ---------------
" Text Format
" ---------------
set tabstop=4
set backspace=2 " Delete everything with backspace
set shiftwidth=4 " Tabs under smart indent
set cindent
set autoindent
set smarttab
set expandtab
set backspace=2
set softtabstop=4

" ---------------
" Searching
" ---------------
set ignorecase " Case insensitive search
set smartcase " Non-case sensitive search
set incsearch
set hlsearch
set wildignore+=*.o,*.obj,*.exe,*.so,*.dll,*.pyc,.svn,.hg,.bzr,.git,.sass-cache,*.class

" ---------------
" Visual
" ---------------
set showmatch " Show matching brackets.
set matchtime=2 " How many tenths of a second to blink

" ---------------
" Sounds
" ---------------
set noerrorbells
set novisualbell
set t_vb=

" ---------------
" Mouse
" ---------------
set mousehide " Hide mouse after chars typed
"set mouse=a " Mouse in all modes

" Better complete options to speed it up
set complete=.,w,b,u,U


"autocmd BufWritePost *.py call Pyflakes()
"autocmd BufWritePost *.py call Pep8()

noremap <C-p> :Files<CR>
noremap <F11> :Buffers<CR>

" ostatnio widziane bufory
nmap <F12> :b#<CR>
imap <F12> <C-O>:b#<CR>

" Edit vimrc with ,v
nmap <silent> <leader>v :e ~/.vimrc<CR>

" ---------------
" NERDTree
" ---------------
nnoremap <leader>nn :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=2 " Change the NERDTree directory to the root node
let NERDTreeIgnore = ['\.pyc$']
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

au VimEnter * NERDTree

" ---------------
" Indent Guides
" ---------------
let g:indent_guides_enable_on_vim_startup=1


" ---------------
" Fugitive
" ---------------
nmap <Leader>gc :Gcommit<CR>
nmap <Leader>gw :Gwrite<CR>
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gp :Git push<CR>
nmap <Leader>gb :Gblame<CR>
" Mnemonic, gu = Git Update
nmap <Leader>gu :Git pull<CR>
nmap <Leader>gd :Gdiff<CR>
" Exit a diff by closing the diff window
nmap <Leader>gx :wincmd h<CR>:q<CR>


" ---------------
" Vundle
" ---------------
nmap <Leader>bi :BundleInstall<CR>
nmap <Leader>bu :BundleInstall!<CR> " Because this also updates
nmap <Leader>bc :BundleClean<CR>

" shortcruts
noremap <leader>w <ESC>:%s/\s\+$//e<bar>:retab<bar>:w <CR>
nmap <leader>q :qa<CR>
nmap <leader>wq :wqa<CR>
nnoremap <leader>x d$
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

hi ColorColumn guibg=#000000 ctermbg=0
let &colorcolumn=join(range(121,999),",")
