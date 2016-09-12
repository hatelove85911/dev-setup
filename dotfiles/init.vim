function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

if has('nvim')
  let g:python3_host_prog = '/usr/bin/python3'
  let g:path2Vimrc='~/.config/nvim/init.vim'
  let g:path2VimHome="~/.config/nvim"
  let g:path2VimplugHome='~/.config/nvim/plugged'
else
  let g:path2Vimrc='~/.vimrc'
  let g:path2VimHome='~/.vim'
  let g:path2VimplugHome='~/.vim/plugged'
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin(g:path2VimplugHome)
" operate on surroundings
Plug 'tpope/vim-surround'
" git
Plug 'tpope/vim-fugitive'
" for navigation between items in quick fix or location list easier and toggle
" option quickly
Plug 'tpope/vim-unimpaired'
" completion plugin
Plug 'Shougo/neocomplete.vim'
" snippets
Plug 'SirVer/ultisnips'
" Plug 'Shougo/neosnippet.vim'
" Plug 'Shougo/neosnippet-snippets'
" Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }

" super substitute
Plug 'tpope/vim-abolish'
" vim shell
Plug 'Shougo/vimshell.vim'
" expand selection region
Plug 'terryma/vim-expand-region'
" accelerated jk move
Plug 'rhysd/accelerated-jk'
" vim bookmark
Plug 'MattesGroeger/vim-bookmarks'
" line diff
Plug 'AndrewRadev/linediff.vim'
" tagbar
Plug 'majutsushi/tagbar'
" automatic tags generation
Plug 'ludovicchabant/vim-gutentags'

"""""""""""""""""""""""""""""""""""""""""""""""""
" shougo unite
""""""""""""""""""""""""""""""""""""""""""""""""""
" quick file finder
" ag is a front end for the silver searcher ag program
Plug 'rking/ag.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/unite.vim' | Plug 'Shougo/neomru.vim' | Plug 'Shougo/neoyank.vim'
Plug 'Shougo/neoinclude.vim'
Plug 'tsukkee/unite-tag'
" file explorer, can be integrated with unite
Plug 'Shougo/vimfiler.vim'
" unite session
Plug 'Shougo/unite-session'

""""""""""""""""""""""""""""""""""""""""""""""""""
" syntastic
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

" format
Plug 'Chiel92/vim-autoformat'

""""""""""""""""""""""""""""""""""""""""""""""""""
" text object
""""""""""""""""""""""""""""""""""""""""""""""""""
" targets
Plug 'wellle/targets.vim'
" text objects depend on kana/vim-textobj-user
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-function'
" support script for vim-textobj-function for js filetypes
" it will do nothing unless vim-textobj-function
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
" seamless navigation between tmux and vim
Plug 'christoomey/vim-tmux-navigator'
" jump to matching xml tags and more, extend % function to not only jump to
" matching parenthesis, square brackets
Plug 'tmhedberg/matchit'
""""""""""""""""""""""""""""""""""""""""""""""""""
" User interface related, nothing important to function
""""""""""""""""""""""""""""""""""""""""""""""""""
" color scheme
Plug 'crusoexia/vim-monokai'
Plug 'tomasr/molokai'
Plug 'altercation/vim-colors-solarized'
Plug 'jonathanfilip/vim-lucius'

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
set background=light
silent! colorscheme lucius
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

" accelerate <c-e> and <c-y> a bit
nnoremap <c-e> 3<c-e>
nnoremap <c-y> 3<c-y>

" print current file name
cabbrev pfn echo expand('%:t')
cabbrev pfp echo expand('%:p')
cabbrev pfr echo @%
cabbrev pfd echo expand('%:p:h')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap cot :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gutentags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gutentags_project_root = ['.gutenProjectRoot']
let g:gutentags_cache_dir = '~/tagfiles'
let g:gutentags_exclude = ['.git','.svn','.hg','min','vendor','\*.min.\*','\*.map','\*.swp','\*.bak','\*.pyc','\*.class','\*.sln','\*.Master','\*.csproj','\*.csproj.user','\*.cache','\*.dll','\*.pdb','tags','cscope.\*','\*.tar.\*','node_modules','bower_components', 'build', 'dist']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" accelerated jk
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" target
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set the target text object pair operator: a for a object, i for inner
" content, A for external object, I for inner content including space at both
" ends
let g:targets_aiAI = 'aIAi'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" neoinclude
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:neoinclude#ctags_commands = {
    \ '_' : 'ctags',
    \ 'javascript' : 'jsctags'
    \ }

let g:neoinclude#ctags_arguments = {
    \ 'javascript' : '-f'
    \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocommand
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"markdown file extension recognization
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.eslintrc set filetype=json
"make relative switch on when open any file type
au Filetype * set relativenumber

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" window management
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" widen or narrow a window
nmap <Right> 10<c-w>>
nmap <Left> 10<c-w><
" increase of decrease the hight of a window
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

let g:unite_source_rec_async_command = ['ag', '--nocolor', '--nogroup', '--hidden', '-g', '',
      \ '--ignore', '.svn', '--ignore', '.git', '--ignore', 'node_modules', '--ignore', 'build', '.']

call unite#custom#profile('default', 'context', {
    \   'no_split': 1,
    \   'start_insert': 1,
    \   'quit' : 1
    \ })

nnoremap cub :<C-u>Unite -buffer-name=uniteBuffer buffer:-<cr>
nnoremap cur :<C-u>Unite -buffer-name=uniteFiles file_rec/async:.<cr>
nnoremap cum :<C-u>Unite -buffer-name=uniteMru file_mru<cr>
nnoremap cuy :<C-u>Unite -buffer-name=uniteYank -no-start-insert history/yank<cr>
nnoremap cug :<C-u>Unite -buffer-name=uniteGrep grep:.:-iR<cr>
nnoremap cuf :<C-u>Unite -buffer-name=uniteFind find:.<cr>
nnoremap cuk :<C-u>Unite -buffer-name=uniteBookmark -no-start-insert vim_bookmarks<cr>
nnoremap cuc :<C-u>Unite -buffer-name=uniteTag tag:%<cr>
nnoremap cut :<C-u>Unite -buffer-name=uniteTag tag<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimfiler
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set vimfiler default explorer and disable netrw
let g:vimfiler_as_default_explorer = 1
" Disable netrw.vim
let g:loaded_netrwPlugin = 1

" vim, tmux seamless navigation, put the following mapping
" in after plugin to overwrite the key mapping done in the vimfiler plugin
" which use <c-l> to do refresh
" define new key map <c-r> to do refresh
au Filetype vimfiler,unite nnoremap <buffer> <c-l> :TmuxNavigateRight<CR>
au Filetype vimfiler,unite nmap <buffer> <c-p> <Plug>(vimfiler_redraw_screen)

" custom profile
call vimfiler#custom#profile('default', 'context', {
      \ 'safe' : 0,
      \ 'auto_cd': 1
      \ })

nnoremap yv :<C-u>VimFiler "file_rec/async"<cr>
nnoremap yvb :<C-u>VimFilerBufferDir "file_rec/async"<cr>
nnoremap yvc :<C-u>VimFilerCurrentDir "file_rec/async"<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" unite-session
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap cus :<C-u>Unite -buffer-name=uniteSession -no-start-insert session<cr>
cabbrev us UniteSessionSave
let g:unite_source_session_enable_auto_save = 1

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
cabbrev si SyntasticInfo

let g:syntastic_error_symbol = '✗'
let g:syntastic_style_error_symbol = '🚫'
let g:syntastic_warning_symbol = '❗'
let g:syntastic_style_warning_symbol = '⚠'
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
" ultisnips
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsSnippetsDir = g:path2VimHome . "/UltiSnips"
let g:UltiSnipsSnippetDirectories=["UltiSnips"]

let g:UltiSnipsExpandTrigger = '<c-j>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'

nmap cp :UltiSnipsEdit<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" neocomplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
"
" undo complete 
inoremap <expr><c-g> neocomplete#undo_completion()
" complete common string
inoremap <expr><c-l> neocomplete#complete_common_string()

inoremap <silent> <cr> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  " return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction

au Filetype javascript setlocal omnifunc=tern#Complete
au FileType css setlocal omnifunc=csscomplete#CompleteCSS
au FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
au FileType python setlocal omnifunc=pythoncomplete#Complete
au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags


" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php =
"\ '[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
"let g:neocomplete#sources#omni#input_patterns.c =
"\ '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?'
"let g:neocomplete#sources#omni#input_patterns.cpp =
"\ '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'


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
" define a map to switch to previous active buffer 
nmap gb :b#<CR>
" define some map to facilitate buffer write and window quit
nmap <c-s> :w<CR>
nmap <c-q> :q<CR>
nmap <c-n> :bn<CR>
nmap <c-p> :bp<CR>

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
" to quickly move to the end of curly braces
" imap <c-]> <Esc>]}a
" nmap <c-]> ]}
"
" command abbreavtion for source %
cabbrev ss execute 'source' g:path2Vimrc
cabbrev vrc execute 'e'.g:path2Vimrc
cabbrev aft execute 'e'.g:path2VimHome.'/after/plugin/my.vim'
cabbrev zrc e ~/.zshrc<cr>
