function! neoformat#formatters#c#enabled() abort
   return ['clangformat']
endfunction

function! neoformat#formatters#c#clangformat() abort
    return {
            \ 'exe': 'clang-format',
            \ 'args': ['-style=file',
            \          '-assume-filename=' . fnameescape(expand('%:t'))],
            \ 'stdin': 1,
            \ }
endfunction
