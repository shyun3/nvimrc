function! neoformat#formatters#cpp#enabled() abort
   return neoformat#formatters#c#enabled()
endfunction

function! neoformat#formatters#cpp#clangformat() abort
    return neoformat#formatters#c#clangformat()
endfunction
