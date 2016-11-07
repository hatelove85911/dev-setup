" toggle syntastic
nmap coc :call MyOwnSyntasticModeToggle()<cr>
" toggle cursorline
" why windo? the setting is mainly for linediff
" when linediff, both window will have cursorline, so I need to toggle
" cursorline on and off for all windows
nmap col :windo set cursorline!<CR>

" replace word under cursor and you can proceed by
" return to normal mode, type n to go to next occurence, type . to repeat
nmap cr *cgn

" set search highligh foreground and background same as
" molokai color scheme
highlight Search term=reverse ctermfg=0 ctermbg=222 guifg=#000000 guibg=#FFE792


