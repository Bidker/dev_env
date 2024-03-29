let mapleader=";"

set nocompatible
filetype off


set rtp+=~/.local/share/nvim/plugged
set rtp+=/.local/opt/fzf
set rtp+=~/.fzf


call plug#begin('~/.local/share/nvim/plugged')

" for gui
Plug 'ryanoasis/vim-devicons'
Plug 'freeo/vim-kalisi'
Plug 'itchyny/lightline.vim'
Plug 'yggdroot/indentline'

" file openers
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Plug 'vwxyutarooo/nerdtree-devicons-syntax'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'yuki-ycino/fzf-preview.vim'

" completion and clear code
Plug 'dense-analysis/ale'
Plug 'davidhalter/jedi-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'

" colors of syntax
Plug 'tweekmonster/django-plus.vim'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'vim-scripts/django.vim'
Plug 'sheerun/vim-polyglot'
Plug 'luochen1990/rainbow'

" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'idanarye/vim-merginal'

" autoclose brackets and html tags, autoadd semilicon
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'

" markdown
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}

" mayby in futer:
" snippets
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
"
call plug#end()


" ---------------
" UI
" ---------------
colorscheme kalisi
set ruler " Ruler on
set nu " Line numbers on
set wrap linebreak nolist
highlight LineNr guibg=#202020 ctermbg=0
set laststatus=2 " Always show the statusline
set cmdheight=2
set encoding=utf-8
set guifont=JetBraiinsMonoMedium:h11


" ---------------
" Behaviors
" ---------------
syntax on
let g:neodark#background = '#202020'
set cursorline
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
autocmd FileType python set tabstop=4 softtabstop=4 shiftwidth=4 " Tabs under smart indent
autocmd FileType javascript,vue set tabstop=2 softtabstop=2 shiftwidth=2 " Tabs under smart indent
set backspace=2 " Delete everything with backspace
set cindent
set autoindent
set smarttab
set expandtab
set backspace=2
set foldmethod=indent


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


" other settings
set nobackup
set pastetoggle=<F8>


" ---------------
" shortcruts
" ---------------
" trailing space remove, retab and save file
noremap <leader>w :%s/\s\+$//e<bar>:retab<bar>:wa <CR>
nmap <leader>q :qa<CR>
nmap <leader>wq :wqa<CR>
nnoremap <leader>x d$
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <leader>so :source ~/.config/nvim/init.vim<CR><ESC>
nnoremap <leader>b obreakpoint()<ESC>

" for django models
nnoremap <leader>V a, verbose_name=_('')<ESC>hi

"for css
:set omnifunc=csscomplete#CompleteCSS

" edit neovim config
nmap <silent> <leader>v :e ~/.config/nvim/init.vim<CR>

" tabs in normal mode
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
vnoremap <Tab> >
vnoremap <S-Tab> <

" resize for NERDTree
map <F1> :vertical resize 31<CR> <BAR> <CR>
nnoremap <F2> :call FuncElasticResize() <CR>

function! FuncElasticResize()
    if winwidth(0) == 31
      vertical resize 90<CR>
    else
      vertical resize 31<CR>
    endif
endfunction


" ---------------
" shortcruts for plugins
" ---------------

" ---------------
" Plug
" ---------------
nmap <Leader>pi :PlugInstall<CR>
nmap <Leader>pu :PlugInstall!<CR> " Because this also updates
nmap <Leader>pc :PlugClean<CR>

" ---------------
" polyglot
" ---------------
let g:polyglot_disabled = ['html', 'htmldjango', 'py']

" ---------------
" rainbow
" ---------------
let g:rainbow_active = 1
let g:rainbow_conf = {
\   'ctermfgs': ['lightblue', 'green', 'yellow', 'magenta', 'red'],
\   'separately': {
\       'nerdtree': 0,
\       'fzf': 0,
\   },
\}

" ---------------
" gitgutter
" ---------------
highlight GitGutterAdd    guifg=#009900 guibg=<X> ctermfg=2
highlight GitGutterChange guifg=#bbbb00 guibg=<X> ctermfg=3
highlight GitGutterDelete guifg=#ff2222 guibg=<X> ctermfg=1


" ---------------
" fugitive
" ---------------
nmap <Leader>gw :Gwrite<CR>
nmap <Leader>gb :Gblame<CR>
nmap <Leader>gs :Gstatus<CR>


" ---------------
" merginal
" ---------------
nmap <Leader>gm :Merginal<CR>

" ---------------
" ale
" ---------------
let g:ale_sign_warning = '⚠'
let g:ale_sign_error = '✗'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_linters = {'python': ['flake8', 'pylint']} ", 'vue': ['eslint'], 'javascript': ['eslint']}
let g:ale_python_flake8_executable = 'flake8'
let g:ale_linters_explicit = 1
let g:ale_echo_msg_format = '[%linter%] %code%: %s'
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'always'
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace'], 'python': ['autopep8'], 'javascript': ['eslint']}

highlight link ALEWarningSign String
highlight link ALEErrorSign Title

nmap ]w :ALENextWrap<CR>
nmap [w :ALEPreviousWrap<CR>
nmap <Leader>f <Plug>(ale_fix)


" ---------------
" jedi-vim
" ---------------
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>u"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"


" ---------------
" deoplete-jedi
" ---------------
let g:deoplete#enable_at_startup=1
let g:deoplete#sources#syntax#min_keyword_length=2
let g:python3_host_prog='/usr/bin/python3.7'
let g:python_host_prog='/usr/bin/python'

inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif


" ---------------
" nerdtree-devicons-syntax
" ---------------
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeDirArrows=0
let g:NERDTreeShowBookmarks=1
let g:NERDTreeChDirMode=2
let g:NERDTreeMinimalUI = 1
let g:NERDTreeMarkBookmarks = 0
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeStatusLine = -1
let g:nerdtreedirarrowexpandable='►'
let g:nerdtreedirarrowcollapsible='▼'
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeIgnore = ['\.pyc$']
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 1

let g:DevIconsDefaultFolderOpenSymbol=' '
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol=' '

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

autocmd VimEnter * NERDTree

" ---------------
" lightline
" ---------------
let g:lightline = {
\ 'colorscheme': 'wombat',
\ 'active': {
\   'left': [
\       ['mode', 'paste'],
\        ['gitbranch', 'gitchange'],
\        ['relativepath'],
\    ],
\   'right': [
\       ['percent', 'lineinfo'],
\       ['readonly', 'fileencoding', 'fileformat', 'filetype'],
\       ['linter_warnings', 'linter_errors', 'linter_ok'],
\   ],
\ },
\ 'component_expand': {
\   'linter_warnings': 'LightlineLinterWarnings',
\   'linter_errors': 'LightlineLinterErrors',
\   'linter_ok': 'LightlineLinterOK'
\ },
\ 'component_type': {
\   'readonly': 'error',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error'
\ },
\'component_function': {
\   'gitchange': 'LightlinterAirblade',
\   'gitbranch': 'LightlineFugitive',
\   'filename': 'LightlineFilename',
\   'filetype': 'MyFiletype',
\   'fileformat': 'MyFileformat',
\   'readonly': 'LightlineReadonly',
\ },
\}

augroup filetype_nerdtree
    au!
    au FileType nerdtree call s:disable_lightline_on_nerdtree()
    au WinEnter,BufWinEnter,TabEnter * call s:disable_lightline_on_nerdtree()
augroup END

fu s:disable_lightline_on_nerdtree() abort
    let nerdtree_winnr = index(map(range(1, winnr('$')), {_,v -> getbufvar(winbufnr(v), '&ft')}), 'nerdtree') + 1
    call timer_start(0, {-> nerdtree_winnr && setwinvar(nerdtree_winnr, '&stl', '%#Normal#')})
endfu

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() . ' ' : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ⚠', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓ ' : ''
endfunction

augroup lightline#ale
  autocmd!
  autocmd User ALEJobStarted call s:MaybeUpdateLightline()
  autocmd User ALELintPost call s:MaybeUpdateLightline()
  autocmd User ALEFixPost call s:MaybeUpdateLightline()
augroup END

function! LightlineFugitive()
    return printf(' %s', FugitiveHead())
endfunction

function! LightlinterAirblade()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction

function! LightlineReadonly()
    return &readonly ? 'RO ' : ''
endfunction

"autocmd BufWritePost * call s:MaybeUpdateLightline() works after save

" Update and show lightline but only if it's visible (e.g., not in Goyo)
function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction

set t_Co=256

" ---------------
" fzf
" ---------------
let $FZF_DEFAULT_OPTS=" --color=dark --border"

noremap <C-p> :Files<CR>

nnoremap <C-g> :Rg<Cr>
noremap <F11> :Buffers<CR>
nmap <F12> :b#<CR>
imap <F12> <C-O>:b#<CR>

" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_layout = { 'down': '~39%' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)


" ---------------
" semshi
" ---------------
nmap <silent> <leader>rr :Semshi rename<CR>

nmap <silent> <leader>n :Semshi goto name next<CR>
nmap <silent> <leader>N :Semshi goto name prev<CR>

nmap <silent> <leader>c :Semshi goto class next<CR>
nmap <silent> <leader>C :Semshi goto class prev<CR>

nmap <silent> <leader>f :Semshi goto function next<CR>
nmap <silent> <leader>F :Semshi goto function prev<CR>

nmap <silent> <leader>gu :Semshi goto unresolved first<CR>
nmap <silent> <leader>gp :Semshi goto parameterUnused first<CR>

let g:semshi#error_sign = v:false
let g:semshi#tolerate_syntax_errors = v:true

" ---------------
" closetag
" ---------------
let g:closetag_filetypes = 'html,xhtml,phtml,vue'


" ---------------
" vim-instant-markdown
" ---------------
filetype plugin on
let g:instant_markdown_autostart = 1

" make last column black
hi ColorColumn guibg=#000000 ctermbg=0
let &colorcolumn=join(range(121,999),",")
