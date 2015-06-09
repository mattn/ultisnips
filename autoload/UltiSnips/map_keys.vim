call UltiSnips#bootstrap#Bootstrap()

function! UltiSnips#map_keys#MapKeys()
    if !exists('g:_uspy')
        " Do not map keys if bootstrapping failed (e.g. no Python).
        return
    endif

    inoremap <Plug>(UltiSnips#ExpandSnippetOrJump) <C-R>=UltiSnips#ExpandSnippetOrJump()<cr>
    snoremap <Plug>(UltiSnips#ExpandSnippetOrJump) <Esc>:call UltiSnips#ExpandSnippetOrJump()<cr>
    inoremap <Plug>(UltiSnips#ExpandSnippet) <C-R>=UltiSnips#ExpandSnippet()<cr>
    snoremap <Plug>(UltiSnips#ExpandSnippet) <Esc>:call UltiSnips#ExpandSnippet()<cr>
    xnoremap <Plug>(UltiSnips#SaveLastVisualSelection) :call UltiSnips#SaveLastVisualSelection()<cr>gvs
    inoremap <Plug>(UltiSnips#ListSnippets) <C-R>=UltiSnips#ListSnippets()<cr>
    snoremap <Plug>(UltiSnips#ListSnippets) <Esc>:call UltiSnips#ListSnippets()<cr>

    " Map the keys correctly
    if g:UltiSnipsExpandTrigger == g:UltiSnipsJumpForwardTrigger

        exec "imap <silent> " . g:UltiSnipsExpandTrigger . " <Plug>(UltiSnips#ExpandSnippetOrJump)"
        exec "smap <silent> " . g:UltiSnipsExpandTrigger . " <Plug>(UltiSnips#ExpandSnippetOrJump)"
    else
        exec "imap <silent> " . g:UltiSnipsExpandTrigger . " <Plug>(UltiSnips#ExpandSnippet)"
        exec "smap <silent> " . g:UltiSnipsExpandTrigger . " <Plug>(UltiSnips#ExpandSnippet)"
    endif
    exec "xmap <silent> " . g:UltiSnipsExpandTrigger. " <Plug>(UltiSnips#SaveLastVisualSelection)"
    exec "imap <silent> " . g:UltiSnipsListSnippets . " <Plug>(UltiSnips#ListSnippets)"
    exec "smap <silent> " . g:UltiSnipsListSnippets . " <Plug>(UltiSnips#ListSnippets)"

    snoremap <silent> <BS> <c-g>c
    snoremap <silent> <DEL> <c-g>c
    snoremap <silent> <c-h> <c-g>c
    snoremap <c-r> <c-g>"_c<c-r>
endf
