let g:lightline = {
       \ 'colorscheme': 'molokai',
      \ 'active': {
   \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'modified' ] ]
      \ },
       \ 'component_function': {
       \  'gitbranch': 'gitbranch#name'
       \	 }
       \ }
