" Location for startify sessions
let g:startify_session_dir = '~/.config/nvim/session'

" Startify Menu
let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ ]

" Startify Bookmarks
let g:startify_bookmarks = [
            \ { 'c': '~/.config/bspwm/bspwmrc' },
            \ { 'i': '~/.config/nvim/init.vim' },
            \ { 'z': '~/.zshrc' },
            \ '~/Documents',
            \ ]

" Automatically restart a session
let g:startify_session_autoload = 1

" Take care of buffers
let g:startify_session_delete_buffers = 1

" vim rooter
let g:startify_change_to_vcs_root = 1

" Use unicode
let g:startify_fortune_use_unicode = 1

" Auto update sessions
let g:startify_session_persistence = 1

"Get rid of empty buffers and quit
let g:startify_enable_special = 0

let g:startify_custom_header = [
        \ '   _  __     _         __  ___         __     ___ ',
        \ '  / |/ /  __(_)_ _    /  |/  /__ _____/ /    |_  |',
        \ ' /    / |/ / /  ` \  / /|_/ / _ `/ __/ _ \  / __/ ',
        \ '/_/|_/|___/_/_/_/_/ /_/  /_/\_,_/\__/_//_/ /____/ ',
        \]
let g:startify_enable_special = 0


let g:webdevicons_enable_startify = 1

function! StartifyEntryFormat()
        return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
    endfunction
