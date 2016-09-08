" syntastic
nmap cos :call MyOwnSyntasticModeToggle()<cr>

" replace word under cursor and you can proceed by
" return to normal mode, type n to go to next occurence, type . to repeat
nmap cr *cgn
