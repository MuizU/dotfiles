let g:tig_explorer_keymap_edit    = '<C-o>'
let g:tig_explorer_keymap_tabedit = '<C-t>'
let g:tig_explorer_keymap_split   = '<C-y>'
let g:tig_explorer_keymap_vsplit  = '<C-l>'

" don't use builtin terminal
let g:tig_explorer_use_builtin_term=0

" open tig with current file
nnoremap <Leader>T :TigOpenCurrentFile<CR>

" open tig with Project root path
nnoremap <Leader>t :TigOpenProjectRootDir<CR>

" open tig grep
nnoremap <Leader>g :TigGrep<CR>

" resume from last grep
nnoremap <Leader>r :TigGrepResume<CR>

" open tig grep with the selected word
vnoremap <Leader>g y:TigGrep<Space><C-R>"<CR>

" open tig grep with the word under the cursor
nnoremap <Leader>cg :<C-u>:TigGrep<Space><C-R><C-W><CR>

" open tig blame with current file
nnoremap <Leader>l :TigBlame<CR>
