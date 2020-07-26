call plug#begin('~/.vim/plugged')
Plug 'honza/vim-snippets'
Plug 'dense-analysis/ale'
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
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug  'posva/vim-vue'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdcommenter' 
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'vim-scripts/vim-auto-save', {'for':'tex'}
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'luochen1990/rainbow'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'francoiscabrol/ranger.vim'
Plug 'kamykn/spelunker.vim'
Plug 'lervag/vimtex'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'christoomey/vim-system-copy'
call plug#end()
let g:rainbow_active = 1 
nmap <silent> [c <Plug>(ale_previous_wrap)
nmap <silent> ]c <Plug>(ale_next_wrap)
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['eslint']
nmap <C-f> <Plug>(ale_fix)

" Fix files automatically on save
let g:ale_fix_on_save = 1

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

set backspace=indent,eol,start
set hidden
autocmd StdinReadPre * let s:std_in=1
let g:livepreview_previewer = 'evince'
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
set relativenumber
" Remove expandable arrow
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
let NERDTreeDirArrowExpandable = "\u00a0"
let NERDTreeDirArrowCollapsible = "\u00a0"
let NERDTreeNodeDelimiter = "\x07"

" activates filetype detection
filetype plugin indent on

" activates syntax highlighting among other things
syntax on

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


nmap <C-n> :NERDTreeToggle<CR>
let g:ranger_replace_netrw = 1 
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'

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

if has('nvim')
    " Neovim specific commands
else
    " Standard vim specific commands
endif
if (empty($TMUX))
  if (has("termguicolors"))
    set termguicolors
  endif
endif

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
      \ 'component_function': {
      \  'gitbranch': 'FugitiveHead'
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

let g:python3_host_prog = '/usr/bin/python3'

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:python3_host_prog = '/usr/bin/python3.'

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
