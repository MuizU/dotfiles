" activates syntax highlighting among other things
syntax on
let mapleader = " "
set splitbelow splitright
call plug#begin('~/.vim/plugged')
"Plug 'honza/vim-snippets'
Plug 'ap/vim-css-color'
Plug 'mbbill/undotree'
Plug 'tpope/vim-surround'
Plug 'dense-analysis/ale'
Plug 'junegunn/goyo.vim' 
Plug 'ptzz/lf.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'kovetskiy/sxhkd-vim'
Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}
Plug 'xuhdev/vim-latex-live-preview', {'for': 'tex'}
Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'
Plug 'kien/ctrlp.vim'
Plug 'gregsexton/MatchTag'
Plug 'itchyny/vim-gitbranch'
Plug 'joshdick/onedark.vim'
Plug 'Raimondi/delimitMate'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug  'posva/vim-vue'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdcommenter' 
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'vim-scripts/vim-auto-save', {'for':'tex'}
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ycm-core/YouCompleteMe'
Plug 'luochen1990/rainbow'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'kamykn/spelunker.vim'
Plug 'lervag/vimtex'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'christoomey/vim-system-copy'
call plug#end()
let g:rainbow_active = 1 
nmap <silent> [c <Plug>(ale_previous_wrap)
nmap <silent> ]c <Plug>(ale_next_wrap)
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
nmap <C-f> <Plug>(ale_fix)


let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

" Goyo plugin
nmap <leader>f :Goyo \| set linebreak<CR>


" Spellcheck
nmap <leader>o :setlocal spell! spelllang=en_us<CR>

" vim-fugitive
nmap <leader>gs :vertical G<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gc :vertical Gcommit <CR>

" undo tree
nnoremap <leader>u :UndotreeShow<CR>

"split two windows
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30 <CR>

"YouCompleteMe do to definition
nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>

"YouCompleteMe Fix it
nnoremap <silent> <Leader>gf :YcmCompleter Fixit<CR>





set backspace=indent,eol,start
set noerrorbells
set tabstop=4 softtabstop=4
set expandtab
set smartindent
set shiftwidth=4
set nowrap
set smartcase
set undodir=~/.vim/undodir
set undofile
set hidden
set incsearch
autocmd StdinReadPre * let s:std_in=1
let g:livepreview_previewer = 'zathura'
let g:ctrlp_user_command = ['.git/','git --git-dir=%s/.git ls-files -oc --exclude-standard']
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:NERDTreeIgnore = ['^node_modules$']
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
inoremap <silent><expr> <c-space> coc#refresh()
autocmd vimenter * NERDTree
set number relativenumber
" Remove expandable arrow
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
let NERDTreeDirArrowExpandable = "\u00a0"
let NERDTreeDirArrowCollapsible = "\u00a0"
let NERDTreeNodeDelimiter = "\x07"

" activates filetype detection
filetype plugin indent on


" Autorefresh on tree focus
function! NERDTreeRefresh()
    if &filetype == "nerdtree"
        silent exe substitute(mapcheck("R"), "<CR>", "", "")
    endif
endfunction

  autocmd FileType json syntax match Comment +\/\/.\+$+
autocmd BufEnter * call NERDTreeRefresh()
" Enable folder icons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

" Fix directory colors
highlight! link NERDTreeFlags NERDTreeDir
set encoding=UTF-8


" Copy selected text to system clipboard (requires gvim)
	:noremap <C-c> "*Y :let @+=@*<CR>
	map <C-p> "+P


" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('vue', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

  autocmd FileType json syntax match Comment +\/\/.\+$+
let g:coc_start_at_startup = 1
let g:NERDTreeHijackNetrw = 0 
let g:auto_save_in_insert_mode = 0  " do not save while in insert mode
let g:auto_save = 1  " enable AutoSave on Vim startup
set bs=2
set clipboard=unnamedplus
let g:system_copy#copy_command='xclip -sel clipboard'
let g:system_copy#paste_command='xclip -sel clipboard -o'

augroup vimrc_coc
  autocmd!
  autocmd VimEnter * call s:setup_coc()
augroup END

function s:setup_coc() abort
  call coc#config('coc.preferences', {
        \ 'diagnostic.displayByAle': 1,
        \ 'diagnostic.triggerSignatureHelp': 0,
        \ })
endfunction


nmap <C-n> :NERDTreeToggle<CR>

if has('nvim')

    autocmd FileType fzf tnoremap <buffer> <Esc> <Esc>
    " Neovim specific commands
else
    " Standard vim specific commands
endif
if (empty($TMUX))
  if (has("termguicolors"))
    set termguicolors
  endif
endif

"fzf commands
nnoremap <silent> <Leader><Space> :Files<CR>
nnoremap <silent> <Leader>. :Files <C-r>=expand("%:h")<CR>/<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>g :GFiles<CR>

" Commits with fzf and vim-fugitive
let g:fzf_commits_log_options = '--graph --color=always
  \ --format="%C(yellow)%h%C(red)%d%C(reset)
  \ - %C(bold green)(%ar)%C(reset) %s %C(blue)<%an>%C(reset)"'

nnoremap <silent> <Leader>c  :Commits<CR>
nnoremap <silent> <Leader>bc :BCommits<CR>

"ripgrep and fzf
nnoremap <Leader>rg :Rg<Space>
nnoremap <Leader>RG :Rg!<Space>
" fzf floating window
if has('nvim-0.4.0') || has("patch-8.2.0191")
    let g:fzf_layout = { 'window': {
                \ 'width': 0.9,
                \ 'height': 0.7,
                \ 'highlight': 'Comment',
                \ 'rounded': v:false } }
else
    let g:fzf_layout = { "window": "silent botright 16split enew" }
endif

" Syntax
syntax on
let g:onedark_hide_endofbuffer = 1
let g:onedark_termcolors = 256
let g:onedark_terminal_italics = 1
colorscheme onedark

noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p
set nospell
let g:lightline = {
       \ 'colorscheme': 'onedark',
      \ 'active': {
   \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
       \ 'component_function': {
       \  'gitbranch': 'gitbranch#name'
       \	 }
       \ }

execute "set t_8f=\e[38;2;%lu;%lu;%lum"
execute "set t_8b=\e[48;2;%lu;%lu;%lum"
set laststatus=2
if !has('gui_running')
  set t_Co=256
endif



let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_jsdoc = 1

let g:onedark_termcolors=256
if !has('gui_running')
  set t_Co=256
endif

if executable('rg')
    let g:rg_derive_root='true'
endif


let g:python3_host_prog = '/usr/bin/python3'

let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize = 25

let g:ctrlp_use_caching = 0

let g:python3_host_prog = '/usr/bin/python3.'

" javascript glyphs
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"
set conceallevel=1
let g:NERDToggleCheckAllLines = 1
autocmd FileType * set formatoptions-=cro
let g:NERDTreeHijackNetrw = 0 
let g:lf_replace_netrw = 1 

" Update binds when sxhkdrc is updated.
	autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd

" Save file as sudo on files that require root permission
	cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Enable Goyo by default for mutt writing
	autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
	autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo | set bg=light
	autocmd BufRead,BufNewFile /tmp/neomutt* map ZZ :Goyo\|x!<CR>
	autocmd BufRead,BufNewFile /tmp/neomutt* map ZQ :Goyo\|q!<CR>

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
	autocmd VimLeave *.tex !texclear %
