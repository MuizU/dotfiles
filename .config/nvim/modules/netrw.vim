let g:lf_replace_netrw = 1 
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:NetrwIsOpen=0
let g:netrw_dirhistmax = 0


augroup netrw_buf_hidden_fix
    autocmd!

    " Set all non-netrw buffers to bufhidden=hide
    autocmd BufWinEnter *
                \  if &ft != 'netrw'
                \|     set bufhidden=hide
                \| endif

augroup end

function! ToggleNetrw()
        let i = bufnr("$")
        let wasOpen = 0
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i
                let wasOpen = 1
            endif
            let i-=1
        endwhile
    if !wasOpen
        silent Vexplore
    endif
endfunction

"augroup ProjectDrawer
  "autocmd!
   "autocmd VimEnter * if argc() == 0 | ToggleNetrw()! | endif
  ""autocmd VimEnter * :Vexplore
"augroup END

autocmd FileType netrw setl bufhidden=wipe
