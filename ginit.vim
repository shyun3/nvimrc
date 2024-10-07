colorscheme molokai

call GuiClipboard()
call GuiWindowMaximized(1)

if !g:isMac
  GuiFont! DejaVu Sans Mono for Powerline:h9
else
  GuiFont! DejaVu Sans Mono for Powerline:h10
endif
GuiTabline 0
GuiPopupmenu 0

Welcome
