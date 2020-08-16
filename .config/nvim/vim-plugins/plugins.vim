" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

Plug 'luochen1990/rainbow'
Plug 'ap/vim-css-color'
Plug 'vimwiki/vimwiki'
Plug 'mbbill/undotree'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'lervag/vimtex', {'for':'tex'}
Plug 'joshdick/onedark.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'kovetskiy/sxhkd-vim'
Plug 'xuhdev/vim-latex-live-preview'
Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'
Plug 'kien/ctrlp.vim'
Plug 'gregsexton/MatchTag'
Plug 'kien/ctrlp.vim'
Plug 'Raimondi/delimitMate'
Plug 'posva/vim-vue'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/vim-gitbranch'
Plug 'preservim/nerdcommenter' 
Plug 'kamykn/spelunker.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'

call plug#end()
"
" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
