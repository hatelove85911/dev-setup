function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

let s:mycolors = ['solarized', 'vividchalk', 'molokai']
let s:colorIndex = 0
function! s:NextColor()
    let s:colorIndex = s:colorIndex + 1
	if s:colorIndex > 2
		let s:colorIndex = 0
    endif
    echo s:mycolors[s:colorIndex]
    execute 'colorscheme ' . s:mycolors[s:colorIndex]
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
" neocomplete vim 
Plug 'Shougo/neco-vim'
" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

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
" simple note
Plug 'mrtazz/simplenote.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""
" shougo unite
""""""""""""""""""""""""""""""""""""""""""""""""""
" quick file finder
" ag is a front end for the silver searcher ag program
Plug 'rking/ag.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/unite.vim' | Plug 'Shougo/neomru.vim' | Plug 'Shougo/neoyank.vim'
Plug 'tsukkee/unite-tag'
Plug 'Shougo/unite-outline'
" file explorer, can be integrated with unite
Plug 'Shougo/vimfiler.vim'
" unite session
Plug 'Shougo/unite-session'
" unite help
Plug 'Shougo/unite-help'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" shougo neocomplete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" completion plugin
Plug 'Shougo/neocomplete.vim'
" Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
" calculator source for neocomplete
Plug 'hrsh7th/vim-neco-calc'
" neocomplete syntax source
Plug 'Shougo/neco-syntax'
" codi
Plug 'metakirby5/codi.vim'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tags
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tagbar
Plug 'majutsushi/tagbar'
" automatic tags generation
" Plug 'ludovicchabant/vim-gutentags'
" find project root
Plug 'dbakker/vim-projectroot'

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
Plug 'mattn/emmet-vim'

" tern
Plug 'ternjs/tern_for_vim', {'do': 'npm install'}

" format
Plug 'Chiel92/vim-autoformat'

" js library syntax
" Plug 'othree/javascript-libraries-syntax.vim'

" vue syntax
Plug 'posva/vim-vue'

" fix my js
Plug 'ruanyl/vim-fixmyjs'

" jsx
Plug 'mxw/vim-jsx'

" html5
Plug 'othree/html5.vim'
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
" for any type of quote
Plug 'beloglazov/vim-textobj-quotes'
" url
Plug 'mattn/vim-textobj-url'
" parameters
Plug 'sgur/vim-textobj-parameter'
" html xml attrbutes
Plug 'whatyouhide/vim-textobj-xmlattr'
" indent
Plug 'kana/vim-textobj-indent'
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
" search for .lvimrc 
Plug 'embear/vim-localvimrc'
" toggle quickfix or location list window
Plug 'Valloric/ListToggle'
" create simutenous keymapping
Plug 'kana/vim-arpeggio'
""""""""""""""""""""""""""""""""""""""""""""""""""
" User interface related, nothing important to function
""""""""""""""""""""""""""""""""""""""""""""""""""
" color scheme
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
" set t_Co=256
" let g:solarized_termcolors=256
set background=dark
colorscheme solarized
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
" simplenote
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/.simplenoterc

let g:SimplenoteVertical=1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"powerline font
let g:airline_powerline_fonts=1
let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'
let g:airline#extensions#quickfix#location_text = 'Location'
let g:airline#extensions#branch#enabled = 1
" tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffers_label = 'b'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" enable buffer index and quick select buffer
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>h <Plug>AirlineSelectPrevTab
nmap <leader>l <Plug>AirlineSelectNextTab

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fugitive
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufReadPost fugitive://* set bufhidden=delete
" go to parent tree when editing git object
autocmd BufReadPost fugitive://*
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif

nmap cis :Gstatus<cr>
nmap cic :Gcommit<cr>
nmap cil :Glog 
nmap cid :Gdiff<cr>
nmap cig :Ggrep 
nmap cie :Gedit 
nmap cir :Gread 
nmap ciw :Gwrite 
nmap cib :Gblame<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" toggle quickfix or location list
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lt_location_list_toggle_map = 'cok'
let g:lt_quickfix_list_toggle_map = 'coq'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" local vimrc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:localvimrc_ask = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" expand region
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Extend the global default
call expand_region#custom_text_objects({
      \ 'a''' :0,
      \ 'a""' :0,
      \ 'a]' :1,
      \ 'ab' :1,
      \ 'aB' :1,
      \ 'ii' :0,
      \ 'ai' :0,
      \ 'if' :1,
      \ 'af' :1,
      \ })

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gutentags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:gutentags_project_root = ['.projectRoot']
" let g:gutentags_cache_dir = '~/tagfiles'
" let g:gutentags_exclude = ['.git','.svn','.hg','min','vendor','\*.min.\*','\*.map','\*.swp','\*.bak','\*.pyc','\*.class','\*.sln','\*.Master','\*.csproj','\*.csproj.user','\*.cache','\*.dll','\*.pdb','tags','cscope.\*','\*.tar.\*','node_modules','bower_components', 'build', 'dist']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" accelerated jk
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocommand
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"markdown file extension recognization
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.eslintrc set filetype=json
au BufRead,BufNewFile *.vue set filetype=vue
au BufRead,BufNewFile *.vue let b:current_syntax = "vue"
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
nnoremap cuc :<C-u>Unite -buffer-name=uniteTag tag:%<cr>
nnoremap cut :<C-u>Unite -buffer-name=uniteTag tag<cr>
nnoremap cul :<C-u>Unite -buffer-name=uniteLine line<cr>
nnoremap cuo :<C-u>Unite -buffer-name=uniteOutline outline<cr>
nnoremap cup :<C-u>Unite -buffer-name=uniteSnippet ultisnips<cr>
nnoremap cuh :<C-u>Unite -buffer-name=uniteHelp help<cr>

au Filetype unite nnoremap <buffer> <c-l> :TmuxNavigateRight<CR>
au Filetype unite nmap <buffer> <c-p> <Plug>(unite_redraw)|

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
au Filetype vimfiler nnoremap <buffer> <c-l> :TmuxNavigateRight<CR>
au Filetype vimfiler nmap <buffer> <c-p> <Plug>(vimfiler_redraw_screen)

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
let g:formatdef_jsbeautify_javascript = '"js-beautify -s 2 -a"'
au FileType javascript nmap <buffer> <leader>x :Autoformat <bar> :Fixmyjs<CR>
au FileType javascript set ft=javascript.jsx

" vue beautify
" let g:formatters_vue = ['htmlbeautify_vue']
" let g:formatdef_htmlbeautify_vue = '"htmlbeautify -s 2 -a -I -A -U []"'
" au Filetype javascript nmap <buffer> <leader>s :%!standard-format -<cr>
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
let g:syntastic_javascript_checkers = ["eslint"]

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
" xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
"

" function! ExecuteMacroOverVisualRange()
" echo "@".getcmdline()
" execute ":'<,'>normal @".nr2char(getchar())
" endfunction
" " apply macro globally
" cabbrev gq g/./normal @q<HOME><Right><Right><Right>

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
  let replacement = input('replacement: ', wordUnderCursor)
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
  let replacement = input('replacement: ', wordUnderCursor)
  call inputrestore()
  execute "'<,'>s/".original.'/'.replacement.'/g'
endfunction

nmap cr :call ReplaceItInNormalMode()<cr>
vmap cv :call ReplaceItInVisualMode()<cr>

" do substitution in selected area
cabbrev sis s/\%V
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ultisnips
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsSnippetsDir = g:path2VimHome . "/UltiSnips"
let g:UltiSnipsSnippetDirectories=["UltiSnips"]

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

nmap cp :UltiSnipsEdit<cr>

" function! UltiSnipsCallUnite()
"   Unite ultisnips
"   return ''
" endfunction

" " inoremap <silent> cup <C-R>=(pumvisible()? "\<LT>C-E>":"")<CR><C-R>=UltiSnipsCallUnite()<CR>
" nnoremap <silent> cup a<C-R>=(pumvisible()? "\<LT>C-E>":"")<CR><C-R>=UltiSnipsCallUnite()<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" neocomplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" auto close preview window
let g:neocomplete#enable_auto_close_preview = 1
" when using fugitive plugin, there'll be issue when writing commit message if
" you turned on auto_close_preview window
" refer to the github issue for details:
" https://github.com/Shougo/neocomplcache.vim/issues/424
autocmd FileType gitcommit let b:neocomplcache_enable_auto_close_preview = 0 
" to use echo doc to view api
" set completeopt-=preview

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" <TAB>: completion.
" disbaled tab, the reason is that using tab for both utlisnips and
" neocomplete is inconvenient, when you want to expand ultisnips, you must use
" <c-y> to close popup first, that's why I only assign tab to ultisnips
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<C-R>=UltiSnips#ExpandSnippetOrJump()<CR>"
" inoremap <expr><s-TAB>  pumvisible() ? "\<C-p>" : "\<C-R>=UltiSnips#JumpBackwards()<CR>"

" there're three option to close the popup menu: enter, esc, space
" compaired the 3 options, finally I give up all of them and just choose to
" use <c-y> to close popup
" because those keys are very important, when you're typing and press them,
" you'll expect them to be effective immdediately, otherwise it's going to
" impact your speed, with the below configuration in the way, it'll take the
" first key stroke to close the popup and the second one to effect, that's
" unacceptable
" but I leave the configuraton still here, just in case for furture reference

" inoremap <silent> <esc> <C-r>=<SID>my_esc_function()<esc>
" function! s:my_esc_function()
"   " return (pumvisible() ? "\<C-y>" : "" ) . "\<esc>"
"   " For no inserting <esc> key.
"   return pumvisible() ? "\<C-y>" : "\<esc>"
" endfunction
"
" inoremap <silent> <cr> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function()
"   " return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
"   " For no inserting <CR> key.
"   return pumvisible() ? "\<C-y>" : "\<CR>"
" endfunction
"
" set g:AutoPairsMapSpace to zero to disable auto-pairs' keymap
" and remap <space> to my own keymapping
" let g:AutoPairsMapSpace = 0
" inoremap <silent> <space> <C-r>=<SID>my_space_function()<cr>
" function! s:my_space_function()
"   " return (pumvisible() ? "\<C-y>" : "" ) . "\<space>"
"   " For no inserting <space> key.
"   " return pumvisible() ? "\<C-y>" : "\<space>"
"   return pumvisible() ? "\<C-y>" : AutoPairsSpace()
" endfunction

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
let g:scratch_height = 100
let g:scratch_persistence_file = '/tmp/scratch.vim'
nmap gs :Scratch<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" some shortcut mapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" toggle tagbar
nmap coe :set expandtab!<CR>:set expandtab?<CR>
" cycle through my favorite colorschemes
nmap yc :call <SID>NextColor()<CR>
" toggle expansion
" nmap cot :TagbarToggle<CR>
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
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>
nmap <leader>ww :wa<CR>
nmap <leader>qq :qa<CR>
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

" command abbreavtion for source %
cabbrev ss execute 'source' g:path2Vimrc
cabbrev vrc execute 'e'.g:path2Vimrc
cabbrev aft execute 'e'.g:path2VimHome.'/after/plugin/my.vim'
cabbrev zrc e ~/.zshrc<cr>
