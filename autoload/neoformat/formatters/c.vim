function! neoformat#formatters#c#enabled() abort
   return ['clangformat']
endfunction

function! neoformat#formatters#c#clangformat() abort
    return {
            \ 'exe': 'clang-format',
            \ 'args': ['-style=file', '-assume-filename=' . expand('%:p')],
            \ 'stdin': 1,
            \ }
endfunction
