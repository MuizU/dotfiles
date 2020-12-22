" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

" match the ending bracket with the same color will have a rainbow color
Plug 'luochen1990/rainbow'

Plug 'vinceau/vim-ltsa-syntax'

"java plugins
Plug 'nvim-treesitter/nvim-treesitter'

" Fire NVIM
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

Plug 'liuchengxu/space-vim-dark'

" displays the actual css color
Plug 'ap/vim-css-color'

"Plug '"KeitaNakamura/highlighter.nvim', { 'do': ':UpdateRemotePlugins' }

" nvim nightly
Plug 'kdheepak/lazygit.nvim'

" prob
Plug 'bivab/prob.vim'

" tex-conceal
Plug 'KeitaNakamura/tex-conceal.vim'

" vim tig explorer
Plug 'iberianpig/tig-explorer.vim'

" plugin for vim wiki
Plug 'vimwiki/vimwiki'

Plug 'chrisbra/vim-autosave' , {'for':'wiki'}

" Will enable undo history in another buffer
Plug 'mbbill/undotree'

" vim surround
Plug 'tpope/vim-surround'

Plug 'mhinz/vim-startify'

" Vim one dark
Plug 'joshdick/onedark.vim'
Plug 'rbgrouleff/bclose.vim'

"Plug 'ChristianChiarulli/codi.vim'

" honza vim-snippets
Plug 'honza/vim-snippets'

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
Plug 'norcalli/nvim-colorizer.lua'
Plug 'preservim/nerdcommenter' 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
  " Cool Icons
Plug 'ryanoasis/vim-devicons'
Plug 'liuchengxu/vim-which-key'

Plug 'lervag/vimtex'

call plug#end()
"
" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
