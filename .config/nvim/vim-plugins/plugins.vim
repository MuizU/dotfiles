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

Plug 'rhysd/vim-fixjson'

"Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'turbio/bracey.vim' 

Plug 'jcartledge/git-blame-nvim'

Plug 'sudar/comments.vim'

Plug 'mhinz/vim-startify'

Plug 'tomtom/tcomment_vim'
" Plug 'tpope/vim-commentary'

Plug 'vinceau/vim-ltsa-syntax'

" Intellij plugin
Plug 'beeender/Comrade'

"java plugins
Plug 'nvim-treesitter/nvim-treesitter'

" displays the actual css color
Plug 'ap/vim-css-color'

" prob
Plug 'bivab/prob.vim'

" tex-conceal
Plug 'KeitaNakamura/tex-conceal.vim'

" vim tig explorer
Plug 'iberianpig/tig-explorer.vim'

" plugin for vim wiki
Plug 'vimwiki/vimwiki'

" Will enable undo history in another buffer
Plug 'mbbill/undotree'

" vim surround
Plug 'tpope/vim-surround'

" Vim one dark
Plug 'joshdick/onedark.vim'

" Palenight
Plug 'drewtempelmeyer/palenight.vim'

Plug 'rbgrouleff/bclose.vim'

" honza vim-snippets
Plug 'honza/vim-snippets'

Plug 'kovetskiy/sxhkd-vim'

Plug 'xuhdev/vim-latex-live-preview'

Plug 'sheerun/vim-polyglot'

Plug 'itchyny/lightline.vim'

Plug 'gregsexton/MatchTag'

Plug 'kien/ctrlp.vim'

Plug 'Raimondi/delimitMate'

Plug 'posva/vim-vue'

" Git stuff
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'itchyny/vim-gitbranch'

Plug 'norcalli/nvim-colorizer.lua'

Plug 'tyru/caw.vim'
"Plug 'preservim/nerdcommenter' 
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" FZF plugins
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'

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
