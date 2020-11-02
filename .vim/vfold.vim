setlocal foldmethod=marker
setlocal foldtext=VFoldText()
setlocal foldcolumn=1
setlocal fillchars=fold:\
highlight Folded cterm=bold ctermfg=2 ctermbg=none
highlight FoldColumn cterm=bold ctermfg=2 ctermbg=none

function! VFoldText()
    let line = getline(v:foldstart)
    let sub = substitute(line, '//\s*\|/\*\|\*/\|{{{\s*\d\=', '', 'g')
    return sub
endfunction


