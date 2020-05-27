call plug#begin('~/.vim/plugged')
Plug 'xuhdev/vim-latex-live-preview', {'for': 'tex'}
Plug 'kien/ctrlp.vim'
Plug 'gregsexton/MatchTag'
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
set number
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

set nospell
