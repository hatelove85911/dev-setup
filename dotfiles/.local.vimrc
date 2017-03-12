" Plugins {{{
call neobundle#append()
" unite
NeoBundle 'Shougo/unite-session'

" web development
NeoBundle 'Chiel92/vim-autoformat'
NeoBundleLazy 'pangloss/vim-javascript', {'autoload': {'filetypes': ['javascript', 'jsx', 'vue']}}
NeoBundleLazy 'elzr/vim-json', {'autoload': {'filetypes': ['json']}}
NeoBundleLazy 'posva/vim-vue', {'autoload': {'filetypes': ['vue']}}
NeoBundleLazy 'mxw/vim-jsx', {'autoload': {'filetypes': ['javascript', 'jsx']}}
NeoBundleLazy 'JulesWang/css.vim', {'autoload': {'filetypes': ['css', 'vue']}}
NeoBundleLazy 'sukima/xmledit', {'autoload': {'filetypes': ['xml']}}
NeoBundleLazy 'ternjs/tern_for_vim', {
		\ 'build' : {
		\     'mac' : 'yarn install',
		\     'linux' : 'yarn install',
		\     'unix' : 'yarn install',
		\    },
        \ 'autoload': {
        \     'filetypes': ['javascript', 'jsx', 'vue'],
        \   },
        \ }

" text object
NeoBundle 'kana/vim-textobj-function'
NeoBundle 'thinca/vim-textobj-function-javascript'
NeoBundle 'beloglazov/vim-textobj-quotes'
NeoBundle 'mattn/vim-textobj-url'
NeoBundle 'sgur/vim-textobj-parameter'
NeoBundle 'whatyouhide/vim-textobj-xmlattr'

" utility
NeoBundle 'rhysd/accelerated-jk'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'cskeeters/vim-calutil'
NeoBundle 'vim-scripts/VisIncr'
NeoBundle 'arecarn/crunch.vim'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'mtth/scratch.vim'
NeoBundle 'tommcdo/vim-exchange'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'tmhedberg/matchit'
NeoBundle 'embear/vim-localvimrc'
NeoBundle 'kana/vim-arpeggio'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'terryma/vim-expand-region'
NeoBundle 'MattesGroeger/vim-bookmarks'
NeoBundle 'AndrewRadev/linediff.vim'
NeoBundle 'dbakker/vim-projectroot'
NeoBundle 'szw/vim-maximizer'

" themes
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'tpope/vim-vividchalk'
NeoBundle 'jszakmeister/vim-togglecursor'
call neobundle#end()
" END Plugins }}}
