" activates syntax highlighting among other things
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set backspace=indent,eol,start
set noerrorbells
set tabstop=4 softtabstop=4

set expandtab
set smartindent
set shiftwidth=4
set nowrap
set incsearch " search as characters are entered
set noswapfile  " swap files won't be created
set smartindent
set ignorecase  " case insensitive search
set smartcase
set undodir=~/.vim/undodir
set undofile
set hidden
set incsearch
autocmd StdinReadPre * let s:std_in=1
syntax on
set showmatch   " highlight matching brackets
set wildmenu    " autocompletion for commandmenu
set wrap    " wrap lines
let mapleader = " "
set splitbelow splitright
call plug#begin('~/.vim/plugged')
"Plug 'honza/vim-snippets'
Plug 'lervag/vimtex'
Plug 'mattn/emmet-vim'
Plug 'vim-syntastic/syntastic'
Plug 'editorconfig/editorconfig-vim'
Plug 'ap/vim-css-color'
Plug 'mbbill/undotree'
Plug 'tpope/vim-vinegar'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-surround'
Plug 'Shougo/echodoc.vim'
Plug 'dense-analysis/ale'
Plug 'junegunn/goyo.vim' 
Plug 'rbgrouleff/bclose.vim'
Plug 'kovetskiy/sxhkd-vim'
Plug 'xuhdev/vim-latex-live-preview'
Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'
Plug 'kien/ctrlp.vim'
Plug 'gregsexton/MatchTag'
Plug 'itchyny/vim-gitbranch'
Plug 'Raimondi/delimitMate'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug  'posva/vim-vue'
"Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdcommenter' 
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
"Plug 'vim-scripts/vim-auto-save', {'for':'tex'}
Plug 'ryanoasis/vim-devicons'
"Plug 'ycm-core/YouCompleteMe'
Plug 'luochen1990/rainbow'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vimwiki/vimwiki'
Plug 'kamykn/spelunker.vim'
Plug 'lervag/vimtex'
Plug 'christoomey/vim-system-copy'
call plug#end()
let g:rainbow_active = 1 

" save and quit
nmap <leader>w :w!<cr>
nmap <leader>q :wq!<cr>
nmap <leader>x :xa!<cr>
nmap <leader>qq :q!<cr>

augroup Smartf
  autocmd User SmartfEnter :hi Conceal ctermfg=220 guifg=#6638F0
  autocmd User SmartfLeave :hi Conceal ctermfg=239 guifg=#504945
augroup end

"split two windows
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30 <CR>

nmap <leader>rr <Plug>(coc-rename)
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>


" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

let g:lf_replace_netrw = 1 
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:NetrwIsOpen=0

function! ToggleNetrw()
        let i = bufnr("$")
        let wasOpen = 0
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i
                let wasOpen = 1
            endif
            let i-=1
        endwhile
    if !wasOpen
        silent Lexplore
    endif
endfunction
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore
augroup END

noremap <silent> <C-N> :call ToggleNetrw()<CR>
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" ALE
nmap <silent> [c <Plug>(ale_previous_wrap)
nmap <silent> ]c <Plug>(ale_next_wrap)
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier'],
\}
let g:ale_completion_enabled = 1
nmap <C-f> :Prettier <CR>
" To use echodoc, you must increase 'cmdheight' value.
set cmdheight=2
let g:echodoc_enable_at_startup = 1


" note that if you are using Plug mapping you should not use `noremap` mappings.
nmap <F5> <Plug>(lcn-menu)
" Or map each action separately
nmap <silent>K <Plug>(lcn-hover)
nmap <silent> gd <Plug>(lcn-definition)
nmap <silent> <F2> <Plug>(lcn-rename)

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

let g:vimtex_mappings_enabled = 'true'
" vimtex mappings
nmap <leader>li <plug>(vimtex-info) <CR>
nmap <leader>lv <plug>(vimtex-view)	<CR>
nmap <leader>lt <plug>(vimtex-toc-open)	<CR>


" Spellcheck
nmap <leader>o :setlocal spell! spelllang=en_us<CR>

" vim-fugitive
nmap <leader>gs :vertical G<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gc :vertical Gcommit <CR>

" undo tree
nnoremap <leader>u :UndotreeShow<CR>



" Start Page
let g:startify_custom_header = [
\'  ████     ██                           ██		 ',
\' ░██░██   ░██                          ░░		 ',
\' ░██░░██  ░██  █████   ██████  ██    ██ ██ ██████████	 ',
\' ░██ ░░██ ░██ ██░░░██ ██░░░░██░██   ░██░██░░██░░██░░██ ',
\' ░██  ░░██░██░███████░██   ░██░░██ ░██ ░██ ░██ ░██ ░██ ',
\' ░██   ░░████░██░░░░ ░██   ░██ ░░████  ░██ ░██ ░██ ░██ ',	
\' ░██    ░░███░░██████░░██████   ░░██   ░██ ███ ░██ ░██ ',
\' ░░      ░░░  ░░░░░░  ░░░░░░     ░░    ░░ ░░░  ░░  ░░  ',
\ '',
 \]



let g:livepreview_previewer = 'zathura'
let g:ctrlp_user_command = ['.git/','git --git-dir=%s/.git ls-files -oc --exclude-standard']
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd StdinReadPre * let s:std_in=1


" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"let g:NERDTreeIgnore = ['^node_modules$']
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
"autocmd vimenter * NERDTree
set number relativenumber
" Remove expandable arrow
"let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
"let NERDTreeDirArrowExpandable = "\u00a0"
"let NERDTreeDirArrowCollapsible = "\u00a0"
"let NERDTreeNodeDelimiter = "\x07"

" activates filetype detection
filetype plugin indent on


" Autorefresh on tree focus
"function! NERDTreeRefresh()
    "if &filetype == "nerdtree"
        "silent exe substitute(mapcheck("R"), "<CR>", "", "")
    "endif
"endfunction

  autocmd FileType json syntax match Comment +\/\/.\+$+
"autocmd BufEnter * call NERDTreeRefresh()
" Enable folder icons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

" Fix directory colors
"highlight! link NERDTreeFlags NERDTreeDir
set encoding=UTF-8


" Copy selected text to system clipboard (requires gvim)
	:noremap <C-c> "*Y :let @+=@*<CR>
	map <C-p> "+P


" NERDTress File highlighting
"function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 "exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 "exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
"endfunction

"call NERDTreeHighlightFile('vue', 'green', 'none', 'green', '#151515')
"call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
"call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
"call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
"call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
"call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
"call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

  autocmd FileType json syntax match Comment +\/\/.\+$+
"let g:NERDTreeHijackNetrw = 0 
let g:auto_save_in_insert_mode = 0  " do not save while in insert mode
let g:auto_save = 1  " enable AutoSave on Vim startup
set bs=2
set clipboard=unnamedplus
let g:system_copy#copy_command='xclip -sel clipboard'
let g:system_copy#paste_command='xclip -sel clipboard -o'



"nmap <C-n> :NERDTreeToggle<CR>

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
nnoremap <silent> <Leader>\ :Files<CR>
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

colorscheme onedark
" Syntax
filetype plugin indent on
syntax on
let g:onedark_hide_endofbuffer=1
let g:onedark_termcolors=256
let g:onedark_terminal_italics=1





noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p
set nospell
let g:lightline = {
       \ 'colorscheme': 'molokai',
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

if !has('gui_running')
  set t_Co=256
endif

if executable('rg')
    let g:rg_derive_root='true'
endif




if has('nvim')
let g:vimtex_compiler_progname = 'nvr'
endif

let g:ctrlp_use_caching = 0

let g:python3_host_prog = '/usr/bin/python'

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0



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

" compile tex files on save
autocmd BufWritePost *.tex silent! execute "!pdflatex % >/dev/null 2>&1" | redraw!
set pyxversion=3

" line numbers color
highlight LineNr ctermfg=magenta


"Enable 256 colors
if $COLORTERM == 'alacritty'
    set t_Co=256
endif

" Run :Xbit to make file executable
function! SetExecutableBit()
  let fname = expand("%:p")
  checktime
  execute "au FileChangedShell " . fname . " :echo"
  silent !chmod a+x %
  checktime
  execute "au! FileChangedShell " . fname
endfunction
command! Xbit call SetExecutableBit()
