let $vimrcpath='~/.vimrc'
let $vimhome='~/.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin(expand($vimhome.'/plugged/'))
" operate on surroundings
Plug 'tpope/vim-surround'
" git
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv', {'on': ['Gitv']}
" for navigation between items in quick fix or location list easier and toggle
" option quickly
Plug 'tpope/vim-unimpaired'
" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" super substitute
Plug 'tpope/vim-abolish'
" expand selection region
Plug 'terryma/vim-expand-region'
" accelerated jk move
Plug 'rhysd/accelerated-jk'
" vim bookmark
Plug 'MattesGroeger/vim-bookmarks'
" line diff
Plug 'AndrewRadev/linediff.vim'
" vim rooter, automatic change root to project root
Plug 'airblade/vim-rooter'
" extended . repeat
Plug 'tpope/vim-repeat'
"""""""""""""""""""""""""""""""""""""""""""""""""
" shougo unite
""""""""""""""""""""""""""""""""""""""""""""""""""
" quick file finder
" ag is a front end for the silver searcher ag program
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/unite.vim'
Plug 'Shougo/neoyank.vim'
" file explorer, can be integrated with unite
Plug 'Shougo/vimfiler.vim'
" unite session
Plug 'Shougo/unite-session'
" quick left or right motion
Plug 'unblevable/quick-scope'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" shougo neocomplete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" completion plugin
Plug 'Shougo/neocomplete.vim'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tags
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" automatic tags generation
Plug 'ludovicchabant/vim-gutentags'
""""""""""""""""""""""""""""""""""""""""""""""""""
" syntastic
""""""""""""""""""""""""""""""""""""""""""""""""""
" syntax checker
Plug 'scrooloose/syntastic'
""""""""""""""""""""""""""""""""""""""""""""""""""
" html(xml) css javascript related
""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""" formatters
Plug 'Chiel92/vim-autoformat'

""""""""""" syntax
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx']}
" jsx syntax
Plug 'mxw/vim-jsx', {'for': ['javascript.jsx']}
" distinguish json from javascript
Plug 'elzr/vim-json', { 'for': 'json' }
" vue syntax
Plug 'posva/vim-vue', {'for': ['vue']}
" html5 syntax and autocomplete
Plug 'othree/html5.vim', {'for': ['html', 'vue']}
" css syntax
Plug 'JulesWang/css.vim', {'for': ['css']}
""""""""""" tools
" xml
Plug 'sukima/xmledit', { 'for': 'xml' }
Plug 'mattn/emmet-vim'
""""""""""" weixin mini app
Plug 'chemzqm/wxapp.vim'
""""""""""" markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'suan/vim-instant-markdown'
""""""""""""""""""""""""""""""""""""""""""""""""""
" text object
""""""""""""""""""""""""""""""""""""""""""""""""""
" text objects depend on kana/vim-textobj-user
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-function'
" support script for vim-textobj-function for js filetypes
" it will do nothing unless vim-textobj-function
Plug 'thinca/vim-textobj-function-javascript'
" parameters
Plug 'sgur/vim-textobj-parameter'
" html xml attrbutes
Plug 'whatyouhide/vim-textobj-xmlattr'
""""""""""""""""""""""""""""""""""""""""""""""""""
" small Plugs
""""""""""""""""""""""""""""""""""""""""""""""""""
" comment out code
Plug 'tpope/vim-commentary'
" generate incremental thing, like number, character
" calutil is needed by visIncr Plug for increamental date
Plug 'cskeeters/vim-calutil'
Plug 'vim-scripts/VisIncr'
" auto closing brackets
Plug 'jiangmiao/auto-pairs'
" window maximizer
Plug 'szw/vim-maximizer'
" scratch buffer
Plug 'mtth/scratch.vim'
" swap two region of text easily
Plug 'tommcdo/vim-exchange'
" jump to matching xml tags and more, extend % function to not only jump to
" matching parenthesis, square brackets
Plug 'tmhedberg/matchit'
" search for .lvimrc
Plug 'embear/vim-localvimrc'
""""""""""""""""""""""""""""""""""""""""""""""""""
" User interface related, nothing important to function
""""""""""""""""""""""""""""""""""""""""""""""""""
" color scheme
Plug 'joedicastro/vim-molokai256'
Plug 'crusoexia/vim-monokai'
Plug 'tomasr/molokai'
Plug 'altercation/vim-colors-solarized'
Plug 'jonathanfilip/vim-lucius'
Plug 'vim-scripts/Wombat'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'tpope/vim-vividchalk'
Plug 'junegunn/seoul256.vim'
Plug 'gosukiwi/vim-atom-dark'
Plug 'yearofmoo/Vim-Darkmate'

" for cursor shape change in difference terminal
Plug 'jszakmeister/vim-togglecursor'
" status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" show indent lines
Plug 'Yggdroot/indentLine'
""""""""""""""""""""""""""""""""""""""""""""""""""
" unused Plugs
""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#end()


" use git protocol by default other than https
"let g:vundle_default_git_proto = 'git'

" map leader to space
let mapleader=','
let maplocalleader= ' '

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" general
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin on
filetype indent on
syntax enable 
set nocompatible


set wildmenu          " show widemenu
set laststatus=2      " always show status line
set hidden            " set hidden allowed

" access system clipboard
if has('unnamedplus')
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif

" search ignore case by default
set incsearch                   " incremental searching
set showmatch                   " show pairs match
set hlsearch                    " highlight search results
set smartcase                   " smart case ignore
set ignorecase                  " ignore case letters

" Backups
set nobackup
set noswapfile

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
set background=dark
colorscheme molokai256
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fugitive
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cabbrev ge Gedit
cabbrev gl Glog -- %
cabbrev glr Glog
cabbrev glc Glog --
cabbrev gs Gstatus
cabbrev gdf Gdiff
cabbrev gw Gwrite
cabbrev gr Gread
cabbrev gmv Gmove
cabbrev grm Gremove
cabbrev gs Gcommit

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indent line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_char = '┊'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" markdown
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_folding_disabled = 1
" instance markdown plugin
let g:instant_markdown_autostart = 0
nmap <leader>p :InstantMarkdownPreview<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" rooter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rooter_manual_only = 1
" quick show pwd
nmap <localleader>p :pwd<CR>
" quick change pwd to project root
nmap <localleader>r :Rooter<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"powerline font
let g:airline_powerline_fonts=1
let g:airline#extensions#branch#enabled = 1
" tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffers_label = 'b'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" Just show the filename (no path) in the tab
let g:airline#extensions#tabline#fnamemod = ':t'
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" local vimrc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:localvimrc_ask = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" accelerated jk
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocommand
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup myown
  au!
  " prevent clipboard lost when vim exit
  au VimLeave * call system("xsel -ib", getreg('+'))
  "markdown file extension recognization
  au BufRead,BufNewFile *.md set filetype=markdown
  "wpy file extension recognization
  au BufRead,BufNewFile *.wpy set filetype=wpy.html
  "js file extension recognization
  au BufRead,BufNewFile *.js,*.jsx set filetype=javascript.jsx
  "make relative switch on when open any file type
  au Filetype * set relativenumber

  " neocomplete
  au FileType css setlocal omnifunc=csscomplete#CompleteCSS
  au FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  au FileType python setlocal omnifunc=pythoncomplete#Complete
  au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

  " when using fugitive plugin, there'll be issue when writing commit message if
  " you turned on auto_close_preview window
  " refer to the github issue for details:
  " https://github.com/Shougo/neocomplcache.vim/issues/424
  au FileType gitcommit let b:neocomplcache_enable_auto_close_preview = 0

  " fugitive
  au BufReadPost fugitive://* set bufhidden=delete
  " go to parent tree when editing git object
  au BufReadPost fugitive://*
        \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
        \   nnoremap <buffer> .. :edit %:h<CR> |
        \ endif
  augroup end
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" command abbreviation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" command abbreavtion for source %
cabbrev ss execute 'source' $vimrcpath
cabbrev vrc execute 'e'.$vimrcpath
cabbrev zrc e ~/.zshrc<cr>

"command abbrevation for pluginstall, PlugUpdte, PlugUpgrade, PlugClean
cabbrev pi PlugInstall
cabbrev pu PlugUpdate
cabbrev pg PlugUpgrade
cabbrev pc PlugClean

" open help in split vertical window
cabbrev h vert h

" do substitution in selected area
cabbrev sis s/\%V

" print current file name
cabbrev pfn echo expand('%:t')
cabbrev pfp echo expand('%:p')
cabbrev pfr echo @%
cabbrev pfd echo expand('%:p:h')
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" unimparied toggle options
" co+<x> to toggle some setting
" [
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" toggle maximum window
nmap coo :MaximizerToggle<cr>

nmap <c-h> <c-w>h
nmap <c-l> <c-w>l
nmap <c-k> <c-w>k
nmap <c-j> <c-w>j
" move to next/previous window
nmap ]w <c-w>w
nmap [w <c-w>W
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" unite
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" load helperfuncs
exec ':so ' $vimhome."/autoload/helperfuncs.vim"

" call unite#filters#converter_default#use(['converter_tail'])
" call unite#filters#matcher_default#use(['matcher_fuzzy'])
" call unite#filters#sorter_default#use(['sorter_rank'])
" call unite#custom#source('file_rec/async', 'ignore_globs',
" \ split(&wildignore, ','))

call unite#custom#profile('default', 'context', {
      \   'no_split': 1,
      \   'start_insert': 0,
      \   'quit' : 1
      \ })


""" unite sources
nnoremap <silent><Leader>y :<C-u>Unite history/yank<cr>
nnoremap <silent><Leader>r :<C-u>Unite register<CR>
nnoremap <silent><Leader>b :<C-u>Unite buffer<CR>
" source file_rec/async
let g:unite_source_rec_async_command = ['ag', '--nocolor', '--nogroup', '-S', '-g', '']
nnoremap <silent><Leader>t :<C-u>Unite file_rec/async<CR>
call unite#custom#profile('source/file_rec/async', 'context', {
      \   'start_insert': 1
      \ })

" source grep
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--nogroup --nocolor -S'
let g:unite_source_grep_recursive_opt = ''
nnoremap <silent><Leader>g :<C-u>Unite grep<CR>
call unite#custom#profile('source/grep', 'context', {
      \   'start_insert': 1,
      \   'resume': 1
      \ })

" Unite Menu {{{
let g:unite_source_menu_menus = {}
" menu prefix key (for all Unite menus) {{{
nnoremap [menu] <Nop>
nmap <LocalLeader> [menu]

let g:unite_source_menu_menus.all = {
      \ 'description' : '           search files
      \                                          ⌘ [space]a',
      \}
let g:unite_source_menu_menus.all.command_candidates = [
      \['▷ yank history                                               ⌘ <Leader>y',
      \'Unite -buffer-name=uniteYank history/yank'],
      \['▷ register                                                   ⌘ <Leader>r',
      \'Unite -buffer-name=uniteRegister register'],
      \['▷ buffer                                                     ⌘ <Leader>b',
      \'Unite -buffer-name=uniteBuffer -winheight=40 buffer'],
      \['▷ ultisnips                                                  ⌘ <Leader>u',
      \'Unite -buffer-name=uniteUltisnips ultisnips'],
      \['▷ grep (ag → ack → grep)                                     ⌘ <Leader>a',
      \'Unite -buffer-name=uniteGrep -winheight=40 grep'],
      \['▷ grep current word                                          ⌘ <Leader>A',
      \'UniteWithCursorWord -buffer-name=uniteGrep -winheight=40 grep'],
      \['▷ asynchronous recursive file                                ⌘ <Leader>e',
      \'Unite -buffer-name=uniteFileRecAsync -winheight=40 file_rec/async'],
      \['▷ find                                                       ⌘ <Leader>j',
      \'Unite -buffer-name=uniteFind -winheight=40 find'],
      \['▷ git grep /                                                 ⌘ <Leader>g',
      \'Unite -buffer-name=uniteGrepGit -winheight=40 grep/git:/:-P'],
      \['▷ git grep .                                                 ⌘ <Leader>G',
      \'Unite -buffer-name=uniteGrepGit -winheight=40 grep/git:.:-P'],
      \['▷ git repo asynchronous file search                          ⌘ <Leader>t',
      \'Unite -buffer-name=uniteFileRecGit -winheight=40 file_rec/git'],
      \['▷ create new file                                            ⌘ <Leader>n',
      \'Unite --start-insert file/new'],
      \['▷ create new directory                                       ⌘ <Leader>k',
      \'Unite --start-insert directory/new'],
      \['============================================================================', ''],
      \['- ⌘ <Leader>x ranger', 'call RangerChooser()'],
      \['- ⌘ <Leader>v vim filer', 'VimFiler "file_rec/async"'],
      \['- ⌘ <Leader>s vim session', 'Unite -buffer-name=uniteSession -no-start-insert session'],
      \['============================================================================', ''],
      \['- con toggle number', ''],
      \['- coc toggle cursor', ''],
      \['- coo toggle maximize window', ''],
      \['- cor toggle relative number', ''],
      \['- cop toggle paste mode', ''],
      \['- coe toggle expand tab', ''],
      \['- coh toggle highlight', ''],
      \['- col toggle listchars', ''],
      \['- cok toggle location window', ''],
      \['- coq toggle quickfix window', ''],
      \['- cow toggle wrap', ''],
      \['- cob toggle background light/dark', ''],
      \['- cox toggle column cursor', ''],
      \['- coi toggle ignore case', ''],
      \['- cos toggle spell', ''],
      \['============================================================================', ''],
      \['- pfn print file name', ''],
      \['- pfp print file path', ''],
      \['- pfd print current file directory', ''],
      \['- pfr print relative path', ''],
      \['- sis substitute in selection area', ''],
      \['- vrc edit ~/.vimrc', ''],
      \['- zrc edit ~/.zshrc', ''],
      \['- ss  source ~/.vimrc', ''],
      \['- h   open help in vertical split', ''],
      \]

let g:unite_source_menu_menus.all.command_candidates = helperfuncs#unite_menu_gen(g:unite_source_menu_menus.all.command_candidates, [])

nnoremap <silent>[menu]a :Unite menu:all<CR>
" END Unite Menu }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimfiler
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set vimfiler default explorer and disable netrw
let g:vimfiler_as_default_explorer = 1
" Disable netrw.vim
let g:loaded_netrwPlugin = 1

" custom profile
call vimfiler#custom#profile('default', 'context', {
      \ 'safe' : 0,
      \ 'auto_cd': 1
      \ })
nnoremap <leader>v :<C-u>VimFiler -buffer-name=vimfiler "file_rec/async"<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" unite-session
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>s :<C-u>Unite -buffer-name=uniteSession -no-start-insert session<cr>
nnoremap <localleader>s :UniteSessionSave 
let g:unite_source_session_enable_auto_save = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" code formatter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""prettier configuration
augroup prettier
  au!
  " autocmd BufWritePre *.js,*.json,*.css,*.scss,*.less Prettier
  autocmd Filetype javascript,javascript.jsx,json,css,scss,less nmap <buffer> <leader>f :silent %!prettier --stdin --config ".prettierrc"<CR>
augroup end

""""""""""" auto format
nmap <leader>f :Autoformat<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntastic configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_javascript_checkers=['eslint']
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ultisnips
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsSnippetsDir = $vimhome . "/UltiSnips"
let g:UltiSnipsSnippetDirectories=["UltiSnips"]

let g:UltiSnipsExpandTrigger = '<c-j>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

nmap <localleader>u :UltiSnipsEdit<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" neocomplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" auto close preview window
let g:neocomplete#enable_auto_close_preview = 1
" to use echo doc to view api
" set completeopt-=preview

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" remap ctrl+u to close auto complete popup because ctrl+y is used by emmet
" plugin
inoremap <silent> <c-u> <C-r>=<SID>my_esc_function()<esc>
function! s:my_esc_function()
  return pumvisible() ? "\<C-y>" : "\<c-u>"
endfunction

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
let g:scratch_height = 100
let g:scratch_persistence_file = '/tmp/scratch.vim'
nmap <leader>d :Scratch<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ranger
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use Ranger as a file explorer {{{
fun! RangerChooser()
  exec "silent !ranger --choosefile=/tmp/chosenfile " . expand("%:p:h")
  if filereadable('/tmp/chosenfile')
    exec 'edit ' . system('cat /tmp/chosenfile')
    call system('rm /tmp/chosenfile')
  endif
  redraw!
endfun
map <leader>x :call RangerChooser()<CR>
" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" some shortcut mapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" quick insert semicolon at the end of the line
nmap <localleader>; A;<Esc>
" quick indent whole file
nmap <localleader>i mzgg=G`z
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
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>
nmap <leader>W :wa<CR>
nmap <leader>Q :qa<CR>
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

" map ctrl + space to trigger auto completion
inoremap <Nul> <c-x>
