" vimfile option

" syntastic
nmap cos :call MyOwnSyntasticModeToggle()<cr>

" tagbar
nmap cob :TagbarToggle<cr>

" replace word under cursor and you can proceed by
" return to normal mode, type n to go to next occurence, type . to repeat
nmap cr *cgn
