return {
  "vim-airline/vim-airline",
  dependencies = { "vim-airline/vim-airline-themes" },

  init = function()
    vim.g.airline_theme = "molokai"
    vim.g.airline_powerline_fonts = 1

    vim.g.airline_section_error =
      "%{airline#util#wrap(airline#extensions#coc#get_error(),0)}"
    vim.g.airline_section_warning =
      "%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}"

    vim.g["airline#extensions#whitespace#enabled"] = 0 -- Whitespace error detection
    vim.g["airline#extensions#tagbar#enabled"] = 0

    vim.g["airline#extensions#tabline#enabled"] = 1
    vim.g["airline#extensions#tabline#formatter"] = "uniq_tail_or_proj"
    vim.g["airline#extensions#tabline#fnamemod"] = ":t" -- Default tab name formatter
    vim.g["airline#extensions#tabline#fnamecollapse"] = 0 -- Short parent names in tabs
    vim.g["airline#extensions#tabline#tab_nr_type"] = 1
    vim.g["airline#extensions#tabline#show_close_button"] = 0
    vim.g["airline#extensions#tabline#show_splits"] = 0
    vim.g["airline#extensions#tabline#show_buffers"] = 0
    vim.g["airline#extensions#tabline#show_tab_type"] = 0
  end,
}
