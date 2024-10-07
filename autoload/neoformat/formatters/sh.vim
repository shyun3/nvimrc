function! neoformat#formatters#sh#enabled() abort
   return ['prettier']
endfunction

function! neoformat#formatters#sh#prettier() abort
    return {
            \ 'exe': 'prettier',
            \ 'args': ['--stdin-filepath', fnameescape(expand('%:t'))],
            \ 'stdin': 1,
            \ }
endfunction

