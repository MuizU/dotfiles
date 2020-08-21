let g:vimtex_mappings_enabled = 'true'
let g:vimtex_compiler_progname = 'nvr'
" Runs a script that cleans out tex build files whenever I close out of a .tex file.
	autocmd VimLeave *.tex !texclear %
" compile tex files on save
autocmd BufWritePost *.tex silent! execute "!xelatex % >/dev/null 2>&1" | redraw!
let g:livepreview_previewer = 'zathura'
let g:tex_flavor = 'latex'	
let g:vimtex_mappings_enabled = 'true'
" vimtex mappings
nmap <leader>li <plug>(vimtex-info) <CR>
nmap <leader>lv <plug>(vimtex-view)	<CR>
nmap <leader>lt <plug>(vimtex-toc-open)	<CR>

