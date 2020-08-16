" fzf floating window
if has('nvim-0.4.0') || has("patch-8.2.0191")
    let g:fzf_layout = { 'window': {
                \ 'width': 0.9,
                \ 'height': 0.7,
                \ 'highlight': 'Comment',
                \ 'rounded': v:false } }
else
    let g:fzf_layout = { "window": "silent botright 16split enew" }
endif

" Commits with fzf and vim-fugitive
let g:fzf_commits_log_options = '--graph --color=always
  \ --format="%C(yellow)%h%C(red)%d%C(reset)
  \ - %C(bold green)(%ar)%C(reset) %s %C(blue)<%an>%C(reset)"'

  autocmd FileType json syntax match Comment +\/\/.\+$+

autocmd FileType fzf tnoremap <buffer> <Esc> <Esc>
