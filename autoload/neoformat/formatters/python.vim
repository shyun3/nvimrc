function! neoformat#formatters#python#enabled() abort
    return ['black', 'isort']
endfunction

function! neoformat#formatters#python#isort() abort
    return {
                \ 'exe': 'isort',
                \ 'args': ['-', '--quiet',],
                \ 'stdin': 1,
                \ }
endfunction

function! neoformat#formatters#python#black() abort
    return {
                \ 'exe': 'black',
                \ 'stdin': 1,
                \ 'args': ['-q', '-'],
                \ }
endfunction
