let g:comments_map_keys = 0

" key-mappings for comment line in normal mode
nnoremap  <silent> <leader>cc :call CommentLine()<CR>
 "key-mappings for range comment lines in visual <Shift-V> mode
vnoremap <silent> <leader>cc :call RangeCommentLine()<CR>

" key-mappings for un-comment line in normal mode
noremap  <leader>c<leader> :call UnCommentLine()<CR>
" key-mappings for range un-comment lines in visual <Shift-V> mode
vnoremap <leader>c<leader> :call RangeUnCommentLine()<CR>
