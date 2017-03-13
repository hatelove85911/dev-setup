""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" general
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" show widemenu
set wildmenu
" always show status line
set laststatus=2
" no swap file
set noswapfile
" set hidden allowed
set hidden
" access system clipboard
if has('unnamedplus')
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif
" for fixing the issue of auto indenting
" the pasted code, see:
" http://superuser.com/a/437744
" http://stackoverflow.com/a/21798070
" https://coderwall.com/p/if9mda/automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
nmap cop :set paste! paste?<cr>

" search ignore case by default
set ic

" wrap
" set wrap
" set textwidth=60

" set list charts
set listchars=trail:·,precedes:«,extends:»,eol:↲,tab:▸\
set list
" disable Background Color Erase (BCE) so that color schemes
" render properly when inside 256-color tmux and GNU screen.
" see also http://snk.tuxfamily.org/log/vim-256color-bce.html
set t_ut=
" set t_Co=256
" let g:solarized_termcolors=256
" set background=dark
set relativenumber
set number
set showcmd
set cursorline
set showtabline=0

" indention
set smartindent
set tabstop=4 "tab stop means number of spaces a tab in a file counts for
set softtabstop=2 "number of spaces when editing files, insert tab or delete tab
set shiftwidth=2 "number of spaces moved when indent a line left or right
set expandtab " expand tab into spaces

" open help in split vertical window
cabbrev h vert h

" natural split position
set splitbelow
set splitright

" ask for confirmation first when quit when there're noname buffer
set confirm

" add kspell to complete
set complete+=U
set complete+=k
" don't show mode in command line area, I have mode shown in status line
set noshowmode
" auto read if file is changed outside vim but not changed inside vim yet
set autoread

" accelerate <c-e> and <c-y> a bit
" nnoremap <c-e> 3<c-e>
" nnoremap <c-y> 3<c-y>

" print current file name
cabbrev pfn echo expand('%:t')
cabbrev pfp echo expand('%:p')
cabbrev pfr echo @%
cabbrev pfd echo expand('%:p:h')


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" toggle options as unimpaired
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" toggle tagbar
nmap coe :set expandtab!<CR>:set expandtab?<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"powerline font
" let g:airline_powerline_fonts=1
" let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'
" let g:airline#extensions#quickfix#location_text = 'Location'
" let g:airline#extensions#branch#enabled = 1
" tabline
let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffers_label = 'buffers'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" enable buffer index and quick select buffer
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <localleader>1 <Plug>AirlineSelectTab1
nmap <localleader>2 <Plug>AirlineSelectTab2
nmap <localleader>3 <Plug>AirlineSelectTab3
nmap <localleader>4 <Plug>AirlineSelectTab4
nmap <localleader>5 <Plug>AirlineSelectTab5
nmap <localleader>6 <Plug>AirlineSelectTab6
nmap <localleader>7 <Plug>AirlineSelectTab7
nmap <localleader>8 <Plug>AirlineSelectTab8
nmap <localleader>9 <Plug>AirlineSelectTab9
nmap <localleader>h <Plug>AirlineSelectPrevTab
nmap <localleader>l <Plug>AirlineSelectNextTab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" accelerated jk
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" window management
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" widen or narrow a window
nmap <Right> 10<c-w>>
nmap <Left> 10<c-w><
" increase of decrease the hight of a window
nmap <Down> 8<c-w>-
nmap <Up> 8<c-w>+
" toggle maximization of a window
let g:maximizer_set_default_mapping = 0
nnoremap <leader>z :MaximizerToggle<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" some customization to default oh-my-vim setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" unite default context setting
call unite#custom#profile('default', 'context', {
      \   'no_split': 1,
      \   'quit' : 1,
      \   'resume' : 1
      \ })

" add default ignore directory to ag command
if executable('ag')
  let g:unite_source_grep_default_opts =
        \ '--nocolor --nogroup -S'.
        \ ' --ignore ''node_modules'' --ignore ''.hg''' .
        \ ' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr''' .
        \ '-i --vimgrep --hidden'
endif


nnoremap <silent><Leader>a :Unite -silent -auto-preview 
      \ -winheight=40 -no-start-insert grep<CR>
nnoremap <silent><Leader>A :UniteWithCursorWord -silent -auto-preview 
      \ -winheight=40 -no-start-insert grep<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" some shortcut mapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" quick insert semicolon at the end of the line
nmap <leader>; A;<Esc>
"upper case Y to copy from cursor to line end
nnoremap Y v$hy
" select the whole line
nnoremap vv V
" select to the end of line
nnoremap V v$h
" for not to lose the yanked text after pasting over selection
xnoremap p pgvy
" exchange J and gJ, to make J join lines without producint space
nnoremap J gJ
nnoremap gJ J
" buffer write and quit
" nmap <leader>w :w<CR>
" nmap <leader>q :q<CR>
" nmap <leader>ww :wa<CR>
" nmap <leader>qq :qa<CR>
" define a map to switch to previous active buffer
nmap gb :b#<CR>

"vmap dil for diffline
vmap dil :Linediff<CR>

" visual map for diffput and diffget
vmap dp :diffput<cr>
vmap do :diffget<cr>
" diffget BASE in three merge
nmap dob :diffget BA<cr>
" diffget LOCAL in three merge
nmap dol :diffget LO<cr>
" diffget REMOTE in three merge
nmap dor :diffget RE<cr>
" diffupdate
nmap dfu :diffupdate<cr>
" 0 to the start of line
nnoremap 0 ^
" g0 to the column 1
nnoremap g0 0
" remap * to not jump to next occurence immediately, instead, stay at where
" you are, solution posted here:
" http://stackoverflow.com/a/13682379/2303252
nnoremap <silent> * :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
" Search for selected text, forwards or backwards. similar to above solution
" the get visual_selection function is got from here:
" http://stackoverflow.com/a/6271254/2303252
function! s:get_visual_selection()
  " Why is this not a built-in Vim script function?!
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][col1 - 1:]
  return join(lines, "\n")
endfunction
vnoremap <silent> * :<c-u>let @/='<C-R>=<SID>get_visual_selection()<CR>'<CR>:<c-u>set hls<CR>

" command abbreavtion for source %
cabbrev ss execute 'source ~/.vimrc'
cabbrev vrcaft execute 'e ~/.after.vimrc'
cabbrev vrcbef execute 'e ~/.before.vimrc'
cabbrev vrcloc execute 'e ~/.local.vimrc'
cabbrev vrcoh execute 'e ~/.oh-my-vim/vimrc'
cabbrev vrc execute 'e ~/.vimrc'
cabbrev zrc e ~/.zshrc<cr>
