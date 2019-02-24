" {{{ Links
" =============================================================================
"  _      _       _
" | |    (_)     | |
" | |     _ _ __ | |
" | |    | | '_ \| |/ / __|
" | |____| | | | |   <\__ \
" |______|_|_| |_|_|\_\___/
" =============================================================================
" http://vimcasts.org/
" http://vimawesome.com/ ---> vim plugins ratings
" http://www.vimbits.com/ ---> vim scripts
" http://bytefluent.com/vivify/ ---> color theme preview and creator
" =============================================================================
" }}}
" {{{ Virtualenv fixer for neovim
"If you are using virtualenv, it is recommended that you create environments specifically for Neovim. This way, you will not need to install the neovim package in each virtualenv. Once you have created them, add the following to your vimrc file:
"
" let g:python_host_prog = '/full/path/to/neovim2/bin/python'
let g:python3_host_prog = '/home/gogo/.virtualenv/neovim/bin/python3.7'
"}}}
" {{{ Plugins
filetype off
" Setup DeinVim PluginManager -------------------------------------------------
  if (!isdirectory(expand("$HOME/.config/nvim/repos/github.com/Shougo/dein.vim")))
    call system(expand("mkdir -p $HOME/.config/nvim/repos/github.com"))
    call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.config/nvim/repos/github.com/Shougo/dein.vim"))
  endif
  if &compatible
    set nocompatible
  endif

  set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim/
  call dein#begin(expand('~/.config/nvim/repos/github.com'))
  call dein#add('Shougo/dein.vim')
"------------------------>start installing plugins<----------------------------
  call dein#add('Shougo/deoplete.nvim') " autocomplete plugn
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#enable_smart_case = 1
  call dein#add('Shougo/context_filetype.vim') " completion from other opened files
  call dein#add('davidhalter/jedi-vim') " need for go to definitions
  call dein#add('zchee/deoplete-jedi') "jedi vim completion async with deoplete
  call dein#add('SirVer/ultisnips')
  call dein#add('honza/vim-snippets')
    let g:UltiSnipsExpandTrigger="<Tab>"
    let g:UltiSnipsListSnippets="<c-Tab>" "list the snippets
    let g:UltiSnipsJumpForwardTrigger="<Tab>"
    let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
    let g:UltiSnipsSnippetsDir = split(&runtimepath, ',')[0] . '/snips'
    let g:UltiSnipsSnippetDirectories = [g:UltiSnipsSnippetsDir]

  call dein#add('w0rp/ale') " linter on the fly
  call dein#add('sbdchd/neoformat') " formater
    " let g:neoformat_enabled_python = ['autopep8']
    let g:neoformat_enabled_python = ['black']
    " let g:neoformat_run_all_formatters = 1
    " let g:neoformat_verbose = 1 " debug setting
    " let &verbose            = 1 " debug setting


  call dein#add('Vimjas/vim-python-pep8-indent')
  call dein#add('mhinz/vim-signify')
  call dein#add('tpope/vim-fugitive') " git wrapper (integration)
  call dein#add('tpope/vim-surround') " change surroundings
  call dein#add('tpope/vim-repeat') " repeat surround commands
  call dein#add('tomtom/tcomment_vim') " comment plugin
  call dein#add('janko-m/vim-test')
    let test#strategy = "neovim"
    let test#python#runner = 'pytest'
  call dein#add('scrooloose/nerdtree')
  call dein#add('Xuyuanp/nerdtree-git-plugin') " showing git status flags in nerdtree
  call dein#add('jiangmiao/auto-pairs') " match quotes, brackets, parenthesis
  call dein#add('Valloric/MatchTagAlways') " always highlight html enclosing tags
  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
  call dein#add('bronson/vim-trailing-whitespace') " colorize red trailing whitspaces
  call dein#add('tmhedberg/SimpylFold') "fold manager for python (improve folding)
    let g:SimpylFold_docstring_preview=1 "display docstrings in folds
  call dein#add('ryanoasis/vim-devicons') " icons in vim (nerdtree, airline, ctrlP)
  call dein#add('tweekmonster/impsort.vim') "import sorting
  call dein#add('ervandew/supertab')
    let g:SuperTabDefaultCompletionType = "<c-n>" "complete from top to bottom
  call dein#add('vimwiki/vimwiki')
    let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
  call dein#add('gorodinskiy/vim-coloresque') " css,html,sass,less color prewiev
  call dein#add('flazz/vim-colorschemes') " many colorschemes
  call dein#add('vim-airline/vim-airline')
  call dein#add('iamcco/markdown-preview.nvim')
    " NOTES:
    " 1. add this to ~/.profile (Allow user-wide npm installations)
        " PATH="$HOME/.node_modules/bin:$PATH"
        " export npm_config_prefix=~/.node_modules
    " 2. go to plugin location and run 'npm install -g'
    " 3. npm install -g instant-markdown-d
    " 4. cd to plugin dir and follow the instructions from https://github.com/iamcco/markdown-preview.nvim
  "---------------------------------------------------------------------------"
  " call dein#add('sheerun/vim-polyglot')
  " call dein#add( 'carlitux/deoplete-ternjs' ), {'for':['javascript','javascript.jsx']}
" "--------------------------->finish installing plugins<---------------------------
  call dein#end()
  call dein#save_state()
  if dein#check_install()
    call dein#install()
  endif
  filetype plugin indent on
" }}}
" {{{ Remaps
let mapleader=","
"Markdown preview
map <leader>md :MarkdownPreview<CR>
"NerdTree bindings-------------------------------------------------------------
map <C-t> :NERDTreeToggle<CR>
"Tab for navigating between split screens
nnoremap <tab> <c-w>
nnoremap <tab><tab> <c-w><c-w>
" autoclose vim if only open window is NerdTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"Keys maps---------------------------------------------------------------------
"remap arrow keys to nothing
noremap <left> <nop>
noremap <right> <nop>
noremap <up> <nop>
noremap <down> <nop>
"better regular expressions searching
nnoremap / /\v
nnoremap ? ?\v
"move currsor with j and k on wrap lines too
nnoremap j gj
nnoremap k gk
" no highlight
nnoremap <leader><leader> :noh<cr>
nnoremap <space> :noh<cr>
" map ; to :
nnoremap ; :
"turn on off spell checking with ,s
nmap <silent><leader>s :set spell!<CR>
"folding and unfolding with Space
nnoremap <Space> za
vnoremap <Space> za
"foldin all and unfolding all with <leader>f <leader>ff
nnoremap <leader>f zR
nnoremap <leader>ff zM
"jj as Esc alternative
inoremap jj <Esc>
"select all text
map <leader>a ggVG
"sort selected text
vnoremap <leader>s :sort<CR>
"moving code blocks
vnoremap < <gv
vnoremap > >gv
"Substitute
nnoremap <c-s> :%s/
vnoremap <c-s> :s/
"edit vimrc in the current window
noremap <leader>e :e $MYVIMRC<CR>
" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv
" Comment Keys
nnoremap <leader>c :TComment<cr>
vnoremap <leader>c :TComment<cr>
" sorting the python imports
nnoremap <leader>is :ImpSort!<cr>
vnoremap <leader>is :ImpSort!<cr>
" replace visualy selected text with the what is in the paste register
vnoremap pp "+p
" remap ctrl+p to launch fzf search
nmap <c-p> :Files<CR>
" draw line separator
nnoremap <leader>l <ESC>79i-<ESC>
"TODO: add buffer aliases
nnoremap <leader>d :r! date "+[\%Y-\%m-\%d \%H:\%M:\%S]"
" -----------------------------------------------------------------------------
"forcing saving files that require root permission with :W
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

"run python code in vim <F5>
noremap <F5> <ESC>:w<CR>:execute "!python %"<CR>

" test mappings
nmap <silent> <leader>tt :TestSuite<CR>
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>tl :TestLast<CR>

"auto chmod +x if file begin with #! and contains /bin/
au bufwritepost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | silent !chmod a+x <afile> | endif | endif

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

 " Source vimrc after saving it
autocmd BufWritePost .vimrc,vimrc source $MYVIMRC

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
\ endif

" auto html filetype do htmldjango
au BufNewFile,BufRead *.html setlocal filetype=htmldjango
" no line wrap for html files
au BufNewFile,BufRead *.html set nowrap textwidth=120
au BufNewFile,BufRead *.htmldjango set nowrap textwidth=120
" no line wrap for txt files
au BufNewFile,BufRead *.txt set nowrap textwidth=120
" foldmethod=marker for .vim files
au BufNewFile,BufRead *.vim set foldmethod=marker
" autoclose folds when open .vim file
au BufNewFile,BufRead *.vim normal zM
" Remove spaces at end of lines in file before save
autocmd BufWritePre * %s/\s\+$//e

" Django shortcuts ------------------------------------------------------------
let g:last_relative_dir = ''
nnoremap g1 :call RelatedFile ("models.py")<cr>
nnoremap g2 :call RelatedFile ("views.py")<cr>
nnoremap g3 :call RelatedFile ("urls.py")<cr>
nnoremap g4 :call RelatedFile ("admin.py")<cr>
nnoremap g5 :call RelatedFile ("tests.py")<cr>
nnoremap g6 :call RelatedFile ( "templates/" )<cr>
nnoremap g7 :call RelatedFile ( "templatetags/" )<cr>
nnoremap g8 :call RelatedFile ( "management/" )<cr>
nnoremap g0 :e settings.py<cr>
nnoremap g9 :e urls.py<cr>

fun! RelatedFile(file)
    #This is to check that the directory looks djangoish
    if filereadable(expand("%:h"). '/models.py') || isdirectory(expand("%:h") . "/templatetags/")
        exec "edit %:h/" . a:file
        let g:last_relative_dir = expand("%:h") . '/'
        return ''
    endif
    if g:last_relative_dir != ''
        exec "edit " . g:last_relative_dir . a:file
        return ''
    endif
    echo "Cant determine where relative file is : " . a:file
    return ''
endfun

fun SetAppDir()
    if filereadable(expand("%:h"). '/models.py') || isdirectory(expand("%:h") . "/templatetags/")
        let g:last_relative_dir = expand("%:h") . '/'
        return ''
    endif
endfun
autocmd BufEnter *.py call SetAppDir()
"------------------------------------------------------------------------------
" }}}
" {{{ General
" =============================================================================
"   ___                          _
"  / _ \___ _ __   ___ _ __ __ _| |
" / /_\/ _ \ '_ \ / _ \ '__/ _` | |
"/ /_\\  __/ | | |  __/ | | (_| | |
"\____/\___|_| |_|\___|_|  \__,_|_|
" =============================================================================
" :options options
"1 important
set nocompatible "don't behave like vi
"2 moving around, searching and patterns
set incsearch "show match for partly search command
set showmatch "when inserting a bracket, briefly jump to its match
set ignorecase "ignore case when using search pattern
set smartcase "override 'ignorecase' when pattern has upper chars
"3 tags
"4 displaying text
set wrap "long lines wrap
set linebreak "break long lines at char in 'breakat' (local to window)
let &showbreak = '↳ ' " string to put before wrapped screen lines
set lazyredraw "don't redraw while executing macros
set number "show current line number
set relativenumber "show line numbers relative to the current line
set scrolloff=5 "number of screen lines to show around the cursor
"5 syntax, highlighting and spelling
syntax on
set hlsearch "highlight all matches for the last used search pattern
set background=dark
set cursorline "highlight the screen line of the cursor
set colorcolumn=80 "columns to highlight (local to window)
"6 multiple windows
set laststatus=2 "when to show status line (2 = always)
set splitbelow  "a new window is put below the current one
set splitright "a new window is put right of the current one
"7 multiple tab pages
"8 terminal
"9 using the mouse
set mouse=a " scroll in files and resize windows
"10 GUI
" set guifont=Inconsolata\ 13
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 11
"11 printing
"12 messages and info
set showcmd "show command keys in the status line
"13 selecting text
set clipboard=unnamed
"set clipboard=unnamedplus
"14 editing text
set textwidth=79 "line length above which to break the line
"15 tabs and indenting
set autoindent "automatically set the indent of a new line
set smartindent "do clever autoindenting for next line (after if for etc.)
set expandtab "expand tab to spaces in insert mode
set shiftwidth=4 "number of spaces used for each step of (auto)indent
set softtabstop=4 "number of spaces to insert for a <Tab>
set tabstop=4 "number of spaces a <Tab> in the text stands for
set shiftround "round to 'shiftwidth' for '<<' and '>>'
"16 folding
set foldmethod=indent
set foldlevel=99
set foldlevelstart=10 "open most folds by default
"17 diff mode
"18 mapping
"19 reading and writing files
set autoread "auto read file when it was modified outside of vim
"20 the swap file
set noswapfile
"21 command line editing
set wildmenu "comand line completion show a list of matches
set wildmode=full "specifies how command line completion works
"22 executing external commands
"23 running make and jumping to errors
"24 language specific
"25 multi-byte characters
set fileencoding=utf-8
set encoding=utf-8
"26 various
set gdefault "use 'g' flag for ':substitute' ('g' - global)
"
set t_Co=256
colorscheme distinguished
" =============================================================================
" NVIM specific settings
set clipboard+=unnamedplus
"
"
"
" other temp (spellchecking temp)
" http://thejakeharding.com/tutorial/2012/06/13/using-spell-check-in-vim.html
set spelllang=en
" set spell " ---> ;w
" turn spell checking on by default
"help spell ---> spell help
" ]s [s ---> move between spellchecking words
" }}}
"
" QuickFix:
augroup quickfix
  autocmd!
  autocmd QuickFixCmdPost make nested copen
augroup END
