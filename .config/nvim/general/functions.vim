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
  if &filetype == 'java'
    exec "!javac %"
    exec "!time java -cp %:p:h %:t:r"
  elseif &filetype == 'sh'
    exec "!time bash %"
  elseif &filetype == 'python'
    exec "!time python2.7 %"
  elseif &filetype == 'html'
    exec "!brave % &"
  endif
endfunction
command! CompileRun call CompileRun()
