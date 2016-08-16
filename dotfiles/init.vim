function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

if has('nvim')
  let g:python3_host_prog = '/usr/bin/python3'
  let g:path2Vimrc="~/.config/nvim/init.vim"
  let g:path2VimHome="~/.config/nvim"
  let g:path2VimplugHome='~/.config/nvim/plugged'
else
  let g:path2Vimrc="~/.vimrc"
  let g:path2VimHome="~/.vim"
  let g:path2VimplugHome='~/.vim/plugged'
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin(g:path2VimplugHome)
" operate on surroundings
Plug 'tpope/vim-surround'
" directory tree
Plug 'scrooloose/nerdtree'
" git
Plug 'tpope/vim-fugitive'
" for navigation between items in quick fix or location list easier
Plug 'tpope/vim-unimpaired'
" completion plugin
Plug 'Shougo/neocomplete.vim'
" snippets
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
" Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }

" super substitute
Plug 'tpope/vim-abolish'

"""""""""""""""""""""""""""""""""""""""""""""""""
" shougo unite
""""""""""""""""""""""""""""""""""""""""""""""""""
" quick file finder
" ag is a front end for the silver searcher ag program
Plug 'rking/ag.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
" Plug 'Shougo/neoinclude.vim'
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

" tern
Plug 'ternjs/tern_for_vim', {'do': 'npm install'}

" tagbar
Plug 'majutsushi/tagbar'
" format
Plug 'Chiel92/vim-autoformat'

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
" small Plugs
""""""""""""""""""""""""""""""""""""""""""""""""""
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
" window maximizer
Plug 'szw/vim-maximizer'
" scratch buffer
Plug 'mtth/scratch.vim'
" swap two region of text easily
Plug 'tommcdo/vim-exchange'
""""""""""""""""""""""""""""""""""""""""""""""""""
" User interface related, nothing important to function
""""""""""""""""""""""""""""""""""""""""""""""""""
" relative number
" Plug 'myusuf3/numbers.vim'

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

"" show marks
"Plug 'kshenoy/vim-signature'

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
set t_Co=256
let g:solarized_termcolors=256
silent! colorscheme monokai
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
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocommand
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"markdown file extension recognization
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.eslintrc set filetype=json

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" window management
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" move between in windows
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-h> <c-w>h
nmap <c-l> <c-w>l
" widen or narrow a window
" nmap <M-l> 10<c-w>>
" nmap <M-h> 10<c-w><
nmap <Right> 10<c-w>>
nmap <Left> 10<c-w><
" increase of decrease the hight of a window
" nmap <M-j> 8<c-w>-
" nmap <M-k> 8<c-w>+
nmap <Down> 8<c-w>-
nmap <Up> 8<c-w>+
" swap position of window in the horizontal or vertical stack
nmap <M-s> <c-w>r
" toggle maximization of a window
let g:maximizer_set_default_mapping = 0
nnoremap coo :MaximizerToggle<cr>

" move to next/previous window
nmap ]w <c-w>w
nmap [w <c-w>W

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
" nnoremap [unite] <Nop>
" 2nd, make a key mapping to unite
" nmap cu [unite]

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
" call unite#custom#source('file_rec/async', 'ignore_globs',
" \ split(&wildignore, ','))
let g:unite_source_rec_async_command = ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', '',
      \ '--ignore', ".svn", '--ignore', ".git", '--ignore', "node_modules"]

nnoremap cub :<C-u>Unite -no-split -buffer-name=buffer -start-insert buffer<cr>
nnoremap cuf :<C-u>Unite -no-split -buffer-name=files -start-insert file_rec/async:!<cr>
nnoremap cum :<C-u>Unite -no-split -buffer-name=mru -start-insert file_mru<cr>
nnoremap cuy :<C-u>Unite -no-split -buffer-name=yank history/yank<cr>
nnoremap cus :<C-u>Unite -no-split -buffer-name=neosnippet -start-insert neosnippet<cr>
nnoremap cug :<C-u>Unite -no-split -buffer-name=grep -start-insert grep:.<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" code formatter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <leader>f :Autoformat<cr>
" commented out temporarily because I'm able to use auto format again in this
" vim version,
"
" au Filetype javascript nmap <buffer> <leader>f :%!standard-format -<cr>
" au Filetype html nmap <buffer> <leader>f :%!tidy --show-errors 0 --show-warnings 0 --show-info 0 --quiet 1<cr>
" au Filetype xhtml nmap <buffer> <leader>f :%!tidy --show-errors 0 --show-warnings 0 --show-info 0 --quiet 1<cr>
" au Filetype xml nmap <buffer> <leader>f :%!tidy --show-errors 0 --show-warnings 0 --show-info 0 --quiet 1<cr>
" au Filetype json nmap <buffer> <leader>f :%!python -m json.tool<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntastic configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" the syntastic built-in toggle command doesn't work
" even toggle to passive mode, it still do checks when buffer write
" that's why I write my own toggle funciton
function! MyOwnSyntasticModeToggle()
  let b:syntastic_mode = get(b:, "syntastic_mode", "active")

  if b:syntastic_mode == "passive"
    let b:syntastic_mode = "active"
    echo "active"
  else
    let b:syntastic_mode = "passive"
    echo "passive"
    execute "SyntasticReset"
  endif
endfunction
let g:syntastic_mode_map = {
      \ 'mode': 'passive',
      \ 'active_filetypes': ['javascript']}
" let g:syntastic_mode_map = {
"       \ 'mode': 'passive',
"       \ 'active_filetypes': [],
"       \ 'passive_filetypes': [] }
" use the latest tidy html5 for html
let g:syntastic_html_tidy_exec = 'tidy'
" set javascript checkers
let g:syntastic_javascript_checkers = ["eslint", "standard"]

" let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_auto_loc_list = 0

nmap <leader>c :SyntasticCheck<cr>
autocmd VimEnter * nmap cos :call MyOwnSyntasticModeToggle()<cr>
cabbrev si SyntasticInfo

let g:syntastic_error_symbol = '✗'
let g:syntastic_style_error_symbol = '🚫'
let g:syntastic_warning_symbol = '❗'
let g:syntastic_style_warning_symbol = '⚠'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" neosnippets
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:neosnippet#snippets_directory = g:path2VimHome . "/neosnips"
imap <C-j>     <Plug>(neosnippet_expand_or_jump)
smap <C-j>     <Plug>(neosnippet_expand_or_jump)
xmap <C-j>     <Plug>(neosnippet_expand_target)
nmap <leader>se :NeoSnippetEdit<cr>
nmap <leader>ss :NeoSnippetSource<cr>
nmap <leader>sc :NeoSnippetClearMarkers<cr>

" SuperTab like snippets behavior.
" "imap <expr><TAB>
" " \ pumvisible() ? "\<C-n>" :
" " \ neosnippet#expandable_or_jumpable() ?
" " \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdtree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap cot :NERDTreeToggle<cr>
let g:NERDTreeShowHidden=1
let g:NERDTreeShowLineNumbers=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" use autocommand enter here because unimpaired plugin has a same key mapping
" for toggle background color, since plugins are loaded after vimrc, we need
" to use this approach to overwrite back my keymapping
autocmd VimEnter * nnoremap cob :TagbarToggle<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" multiline editing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" small script to apply macro to visually selected lines
" recommended in online post:
" https://medium.com/@schtoeffel/you-don-t-need-more-than-one-cursor-in-vim-2c44117d51db#.y8t7jdgwx
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction
" apply macro globally
cabbrev gq g/./normal @q<HOME><Right><Right><Right>

" replace word under cursor and you can proceed by
" return to normal mode, type n to go to next occurence, type . to repeat
" change
autocmd VimEnter * nmap cr *cgn

" replace all occurence of the word under cursor or user input in the whole file or in the selected range with user's input
function! ReplaceItInNormalMode()
  let wordUnderCursor = expand('<cword>')
  call inputsave()
  let original = input('target: ', wordUnderCursor)
  if original == ""
    return
  endif
  call inputrestore()
  call inputsave()
  let replacement = input('replacement: ')
  call inputrestore()
  execute '%s/'.original.'/'.replacement.'/g'
endfunction
function! ReplaceItInVisualMode() range
  let wordUnderCursor = expand('<cword>')
  call inputsave()
  let original = input('target: ', wordUnderCursor)
  call inputrestore()
  if original == ""
    return
  endif
  call inputsave()
  let replacement = input('replacement: ')
  call inputrestore()
  execute "'<,'>s/".original.'/'.replacement.'/g'
endfunction
nmap cR :call ReplaceItInNormalMode()<cr>
vmap cr :call ReplaceItInVisualMode()<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" write quite files key mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Bslash>w :w<cr>
nmap <Bslash>ww :wa<cr>
nmap <Bslash>q :q<cr>
nmap <Bslash>qd :q!<cr>
nmap <Bslash>qq :qa<cr>
nmap <Bslash>qqd :qa!<cr>
nmap <Bslash>x :x<cr>
nmap <Bslash>xd :x!<cr>
nmap <Bslash>xx :xa<cr>
nmap <Bslash>xxd :xa!<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" neocomplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:neocomplete#enable_at_startup = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" scartch pad
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:scratch_no_mappings = 1
let g:scratch_horizontal = 0
let g:scratch_top = 0
let g:scratch_height = 40
let g:scratch_persistence_file = '/tmp/scratch.vim'
nmap gs :Scratch<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-textobj-punctuation configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" As most of the time, you need to operate on the text until punctuation, I add the following bindings to make it even more convenient to use:
" Now, you just need to press cu, du, yu, or vu to operate on the text until the closest punctuation.
" xmap u iu
" omap u iu

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
" move the cursor to the next next poistion 'xxx|' -> 'xxx'|
imap <c-l> <Esc>la
" remap * to not jump to next occurence immediately, instead, stay at where
" you are, solution posted here:
" http://stackoverflow.com/a/13682379/2303252
nnoremap <silent> * :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
" to quickly move to the end of curly braces
" imap <c-]> <Esc>]}a
" nmap <c-]> ]}
"
" command abbreavtion for source %
cabbrev ss execute 'source' g:path2Vimrc
cabbrev vrc execute 'e'.g:path2Vimrc
cabbrev zrc e ~/.zshrc<cr>
