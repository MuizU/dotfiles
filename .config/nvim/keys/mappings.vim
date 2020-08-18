" g Leader key
let mapleader=" "
" let localleader=" "
nnoremap <Space> <Nop>

" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" I hate escape more than anything else
inoremap jk <Esc>
inoremap kj <Esc>

" Easy CAPS
inoremap <c-u> <ESC>viwUi
nnoremap <c-u> viwU<Esc>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" Alternate way to save
nnoremap <C-s> :w<CR>
" Alternate way to quit
nnoremap <C-Q> :xa!<CR>
" Use control-c instead of escape
nnoremap <C-c> <Esc>
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <Leader>o o<Esc>^Da
nnoremap <Leader>O O<Esc>^Da

"Netrw toggle
noremap <silent> <C-N> :call ToggleNetrw()<CR>


" Spellcheck
nmap <leader>o :setlocal spell! spelllang=en_us<CR>

" vim-fugitive
nmap <leader>gs :vertical G<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gc :vertical Gcommit <CR>

" undo tree
nnoremap <leader>u :UndotreeShow<CR>

"fzf commands
nnoremap <silent> <Leader>\ :Files<CR>
nnoremap <silent> <Leader>. :Files <C-r>=expand("%:h")<CR>/<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>g :GFiles<CR>

nnoremap <silent> <Leader>c  :Commits<CR>
nnoremap <silent> <Leader>bc :BCommits<CR>

"ripgrep and fzf
nnoremap <Leader>rg :Rg<Space>
nnoremap <Leader>RG :Rg!<Space>

noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

" Make file executable
nmap <leader>x :Xbit<CR>

" Compile document, be it groff/LaTeX/markdown/etc.
	map <leader>C :w! \| !compiler <c-r>%<CR>

" Open corresponding .pdf/.html or preview
	map <leader>p :!opout <c-r>%<CR><CR>
