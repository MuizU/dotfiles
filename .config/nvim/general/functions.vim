" Random Useful Functions

" Turn spellcheck on for markdown files
augroup auto_spellcheck
  autocmd BufNewFile,BufRead *.md *.tex setlocal spell
augroup END

" Run :Xbit to make file executable
function! SetExecutableBit()
  let fname = expand("%:p")
  checktime
  execute "au FileChangedShell " . fname . " :echo"
  silent !chmod a+x %
  checktime
  execute "au! FileChangedShell " . fname
endfunction
command! Xbit call SetExecutableBit()

function! CompileRun()
  exec "w"
  "if &filetype == 'c'
    "exec "!gcc % -o %<"
    "exec "!time ./%<"
  "elseif &filetype == 'cpp'
    "exec "!g++ % -o %<"
    "exec "!time ./%<"
  if &filetype == 'java'
    exec "!javac %"
    exec "!time java -cp %:p:h %:t:r"
  elseif &filetype == 'sh'
    exec "!time bash %"
  elseif &filetype == 'python'
    exec "!time python2.7 %"
  elseif &filetype == 'html'
    exec "!chrome % &"
  elseif &filetype == 'mkd'
    exec "!~/.vim/markdown.pl % > %.html &"
    exec "!firefox %.html &"
  endif
endfunc
command! CompileRun call CompileRun()
