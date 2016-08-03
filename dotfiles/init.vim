"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugins 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')

" operate on surroundings
Plug 'tpope/vim-surround'

" directory tree
Plug 'scrooloose/nerdtree'

" git
Plug 'tpope/vim-fugitive'

" multiple line edit
Plug 'terryma/vim-multiple-cursors'

"""""""""""""""""""""""""""""""""""""""""""""""""
" shougo unite
""""""""""""""""""""""""""""""""""""""""""""""""""
" quick file finder 
" ag is a front end for the silver searcher ag program
Plug 'rking/ag.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/unite.vim' | Plug 'Shougo/neomru.vim' | Plug 'Shougo/neoyank.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""
" shougo syntastic
""""""""""""""""""""""""""""""""""""""""""""""""""
" syntax checker
Plug 'scrooloose/syntastic'

""""""""""""""""""""""""""""""""""""""""""""""""""
" html(xml) css javascript related
""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

" distinguish json from javascript
Plug 'elzr/vim-json', { 'for': 'json' }

" xml 
Plug 'sukima/xmledit', { 'for': 'xml' }
Plug 'mattn/emmet-vim', { 'for': ['xml', 'html'] }

""""""""""""""""""""""""""""""""""""""""""""""""""
" text object
""""""""""""""""""""""""""""""""""""""""""""""""""
" text objects depend on kana/vim-textobj-user
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'
Plug 'sgur/vim-textobj-parameter'
Plug 'beloglazov/vim-textobj-punctuation'
Plug 'poetic/vim-textobj-javascript'
" javascript function text object, standalone, indepent of kana/vim-textobj-user
Plug 'thinca/vim-textobj-function-javascript'

""""""""""""""""""""""""""""""""""""""""""""""""""
" vim submode
""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'kana/vim-submode'

""""""""""""""""""""""""""""""""""""""""""""""""""
" small Plugs
""""""""""""""""""""""""""""""""""""""""""""""""""
" window maximizer
Plug 'szw/vim-maximizer'
" comment out code
Plug 'tpope/vim-commentary'
" generate incremental thing, like number, character
" calutil is needed by visIncr Plug for increamental date 
Plug 'cskeeters/vim-calutil'
Plug 'vim-scripts/VisIncr'

" vim calculator
Plug 'arecarn/crunch.vim'

" auto closing brackets
Plug 'jiangmiao/auto-pairs'

""""""""""""""""""""""""""""""""""""""""""""""""""
" temporary disabled Plugs
""""""""""""""""""""""""""""""""""""""""""""""""""

"" the ultimate code completion Plug
"Plug 'Valloric/YouCompleteMe'
"
"" tern 
"Plug 'ternjs/tern_for_vim'
"
"" tagbar
"Plug 'majutsushi/tagbar'
"
"" show marks
"Plug 'kshenoy/vim-signature'
"
" for navigation between items in quick fix or location list easier
Plug 'tpope/vim-unimpaired'
"
"" snips
"Plug 'SirVer/ultisnips'

""""""""""""""""""""""""""""""""""""""""""""""""""
" User interface related, nothing important to function
""""""""""""""""""""""""""""""""""""""""""""""""""
" relative number
Plug 'myusuf3/numbers.vim'

" color scheme
Plug 'sickill/vim-monokai'
Plug 'tomasr/molokai'
Plug 'altercation/vim-colors-solarized'

" for cursor shape change in difference terminal
Plug 'jszakmeister/vim-togglecursor'
" status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" smooth scroll when pressing ctrl+d or ctrl u
Plug 'joeytwiddle/sexy_scroller.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""
" unused Plugs
""""""""""""""""""""""""""""""""""""""""""""""""""

"" scratch pad
"Plug 'mtth/scratch.vim'

call plug#end()

"command abbrevation for pluginstall, PlugUpdte, PlugUpgrade, PlugClean
cabbrev pi PlugInstall
cabbrev pu PlugUpdate
cabbrev pg PlugUpgrade
cabbrev pc PlugClean

" use git protocol by default other than https
"let g:vundle_default_git_proto = 'git'

" map leader to space
let mapleader=" "

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" general
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" always show status line
set laststatus=2
" no swap file
set noswapfile
" set hidden allowed
set hidden
" access system clipboard
if has('unnamedplus')
  " vmap "+y :!xclip -f -sel clip
  " map "+p :r!xclip -o -sel clip
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif

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
set t_Co=256
let g:solarized_termcolors=256
silent! colorscheme monokai
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
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocommand
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"markdown file extension recognization
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.eslintrc set filetype=json

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" window management
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:maximizer_set_default_mapping = 0

call submode#enter_with('ctrl_window', 'n', '', '<M-w>', '<nop>')
" call submode#leave_with('ctrl_window', 'n', '', '<Esc>')

" widen or narrow a window
call submode#map('ctrl_window', 'n', '', 'l', '20<c-w>>')
call submode#map('ctrl_window', 'n', '', 'h', '20<c-w><')
" increase of decrease the hight of a window
call submode#map('ctrl_window', 'n', '', 'k', '8<c-w>+')
call submode#map('ctrl_window', 'n', '', 'j', '8<c-w>-')
" swap position of window in the horizontal or vertical stack
nmap <M-s> <c-w>r
" toggle maximization of a window
nmap <M-o> :MaximizerToggle<cr>
" move to next/previous window
nmap ]w <c-w>w
nmap [w <c-w>W
" create split window
nmap <bar> :vs<cr>
nmap - :sp<cr>

function! MyRotate()
  if winnr('$') == 2
    " save the original position, jump to the first window
    let initial = winnr()
    exe 1 . "wincmd w"

    wincmd l
    if winnr() != 1
      " succeeded moving to the right window
      wincmd J " make it the bot window
    else
      " cannot move to the right, so we are at the top
      wincmd H " make it the left window
    endif

    " restore cursor to the initial window
    exe initial . "wincmd w"
  endif
endfunction
nmap <M-r> :call MyRotate()<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" unite
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 1st, map key strokes: [unite] to do nothing, make sure [unite] is reserved
" for unite plugin usage
nnoremap [unite] <nop>
" 2nd, make a key mapping to unite
nmap m [unite]

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
" call unite#custom#source('file_rec/async', 'ignore_globs',
" \ split(&wildignore, ','))
let g:unite_source_rec_async_command = ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', '',
      \ '--ignore', ".svn", '--ignore', ".git", '--ignore', "node_modules"]

nnoremap <silent> [unite]b :<C-u>Unite -no-split -buffer-name=buffer -start-insert buffer<cr>
nnoremap <silent> [unite]f :<C-u>Unite -no-split -buffer-name=files -start-insert file_rec/async:!<cr>
nnoremap <silent> [unite]r :<C-u>Unite -no-split -buffer-name=mru -start-insert file_mru<cr>
nnoremap <silent> [unite]y :<C-u>Unite -no-split -buffer-name=yank history/yank<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" code formatter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>f :Autoformat<cr>
au Filetype javascript nmap <buffer> <leader>f :%!standard-format -<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntastic configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_mode_map = { 
      \ 'mode': 'passive',
      \ 'active_filetypes': ['javascript']}
let g:syntastic_javascript_checkers = ["eslint", "standard"]
let gsyntastic_aggregate_errors = 1
let g:syntastic_auto_loc_list = 0
nmap <leader>s :SyntasticCheck<cr>
cabbrev si SyntasticInfo

let g:syntastic_error_symbol = '✗'
let g:syntastic_style_error_symbol = '🚫'
let g:syntastic_warning_symbol = '❗'
let g:syntastic_style_warning_symbol = '⚠'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" utltsnips
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " define where to store the custom snippets created by me
" let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
" " define the directory names where ultisnips will go and search for .snippets 
" let g:UltisnipsSnippetDirectories=["UltiSnips"]
" let g:UltiSnipsExpandTrigger="<c-j>"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" let g:UltiSnipsEditSplit="vertical"
" nmap <leader>se :UltiSnipsEdit<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> <leader>nd :NERDTreeToggle<cr>
let g:NERDTreeShowHidden=1
let g:NERDTreeShowLineNumbers=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" multi-cursor 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:multi_cursor_exit_from_insert_mode = 0
"
nnoremap <silent> <C-m> "zyiw:MultipleCursorsFind <C-R>z<CR>
vnoremap <silent> <C-m> "zy:MultipleCursorsFind <C-R>z<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-textobj-punctuation configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" As most of the time, you need to operate on the text until punctuation, I add the following bindings to make it even more convenient to use:
" Now, you just need to press cu, du, yu, or vu to operate on the text until the closest punctuation.
xmap u iu
omap u iu

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" some shortcut mapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" quick insert semicolon at the end of the line
nnoremap <leader>; A;<Esc>
"upper case Y to copy from cursor to line end
nnoremap Y v$hy
" select the whole line
nnoremap vv V
" select to the end of line
nnoremap V v$h
" set all lines
" nnoremap va 
" for not to lose the yanked text after pasting over selection
xnoremap p pgvy
" for quick switch between two buffer in the same window
nmap <leader>b :b#<cr>
" save all
nmap <leader>ww :wa<cr>
" write current file
nmap <leader>w :w<cr>
" quit all
nmap <leader>qq :qa<cr>
" quite window
nmap <leader>q :q<cr>
" force quit all
nmap <leader>xx :qa!<cr>
" force qite current window
nmap <leader>x :q!<cr>
" diffget BASE in three merge
nmap dob :diffget BA<cr>
" diffget LOCAL in three merge
nmap dol :diffget LO<cr>
" diffget REMOTE in three merge
nmap dor :diffget RE<cr>
" diffupdate
nmap dfu :diffupdate<cr>
" move between in windows
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-h> <c-w>h
nmap <c-l> <c-w>l
" 0 to the start of line
nnoremap 0 ^
" g0 to the column 1
nnoremap g0 0
" move the cursor to the next next poistion 'xxx|' -> 'xxx'|
imap <c-l> <Esc>la
" to quickly move to the end of curly braces
" imap <c-]> <Esc>]}a
" nmap <c-]> ]}
" command abbreavtion for source %
cabbrev sa source %

