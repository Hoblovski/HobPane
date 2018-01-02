""" HobPane: tmux like pane resizing
let g:Hob_savedMap = {}
func! Hob_ResizeEnable()
    " TODO: save and restore mapping for < > + -
    let g:Hob_savedMap[','] = maparg(',', 'n')
    let g:Hob_savedMap['.'] = maparg('.', 'n')
    let g:Hob_savedMap['-'] = maparg('-', 'n')
    let g:Hob_savedMap['='] = maparg('=', 'n')
    let g:Hob_savedMap['q'] = maparg('q', 'n')
    let g:Hob_savedMap['h'] = maparg('h', 'n')
    let g:Hob_savedMap['j'] = maparg('j', 'n')
    let g:Hob_savedMap['k'] = maparg('k', 'n')
    let g:Hob_savedMap['l'] = maparg('l', 'n')
    let g:Hob_savedMap['H'] = maparg('H', 'n')
    let g:Hob_savedMap['J'] = maparg('J', 'n')
    let g:Hob_savedMap['K'] = maparg('K', 'n')
    let g:Hob_savedMap['L'] = maparg('L', 'n')
    nnoremap <silent> , <C-W>2<
    nnoremap <silent> . <C-W>2>
    nnoremap <silent> = <C-W>2+
    nnoremap <silent> - <C-W>2-
    nnoremap <silent> q :call Hob_ResizeDisable()<CR>
    nnoremap <silent> h <C-W>h:call Hob_ResizeDisable()<CR>
    nnoremap <silent> j <C-W>j:call Hob_ResizeDisable()<CR>
    nnoremap <silent> k <C-W>k:call Hob_ResizeDisable()<CR>
    nnoremap <silent> l <C-W>l:call Hob_ResizeDisable()<CR>
    nnoremap <silent> H <C-W>H:call Hob_ResizeDisable()<CR>
    nnoremap <silent> J <C-W>J:call Hob_ResizeDisable()<CR>
    nnoremap <silent> K <C-W>K:call Hob_ResizeDisable()<CR>
    nnoremap <silent> L <C-W>L:call Hob_ResizeDisable()<CR>
    let g:Hob_ResizeEnable = 1
endfunc

func! Hob_ResizeDisable()
    for s:k in keys(g:Hob_savedMap)
        let s:v = g:Hob_savedMap[s:k]
        if !empty(s:v)
            exe 'nnoremap ' . s:k . ' ' . s:v
        else
            exe 'nunmap ' . s:k
        endif
    endfor
        let g:Hob_ResizeEnable = 0
endfunc

let g:Hob_ResizeEnable = 0
func! Hob_ResizeToggle()
    if (g:Hob_ResizeEnable == 0)
        call Hob_ResizeEnable()
    else
        call Hob_ResizeDisable()
    endif
endfunc

noremap <silent> <C-E> :call Hob_ResizeToggle()<CR>
