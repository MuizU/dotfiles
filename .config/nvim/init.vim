" General Settings
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/functions.vim
source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/keys/which-key.vim

"" Vim-plug
source $HOME/.config/nvim/vim-plugins/plugins.vim

" Plugin Configurations
source $HOME/.config/nvim/plug-config/coc/coc.vim
source $HOME/.config/nvim/plug-config/comments.vim
source $HOME/.config/nvim/plug-config/coc/coc-extensions.vim
luafile $HOME/.config/nvim/lua/treesitter.lua
source $HOME/.config/nvim/plug-config/lazygit.vim
source $HOME/.config/nvim/plug-config/vimtex.vim
source $HOME/.config/nvim/plug-config/undotree.vim
source $HOME/.config/nvim/plug-config/prob.vim
source $HOME/.config/nvim/plug-config/fugitive.vim
"source $HOME/.config/nvim/plug-config/codi.vim
source $HOME/.config/nvim/plug-config/rainbow.vim
source $HOME/.config/nvim/plug-config/ctrlp.vim
source $HOME/.config/nvim/plug-config/fzf.vim
source $HOME/.config/nvim/plug-config/start-screen.vim
source $HOME/.config/nvim/plug-config/vim-polyglot.vim

" Modules
source $HOME/.config/nvim/modules/netrw.vim


" Themes
"source $HOME/.config/nvim/themes/space-vim-dark.vim
source $HOME/.config/nvim/themes/onedark.vim
source $HOME/.config/nvim/themes/lightline.vim

" Added colorizer
lua require'plug-colorizer'

" Add paths to node and python here
if !empty(glob("~/.config/nvim/paths.vim"))
  source $HOME/.config/nvim/paths.vim
endif
