" show me the hjkl bitch!
" =============================================================================
"  _      _       _        
" | |    (_)     | |       
" | |     _ _ __ | | _____ 
" | |    | | '_ \| |/ / __|
" | |____| | | | |   <\__ \
" |______|_|_| |_|_|\_\___/
" =============================================================================
" http://vimcasts.org/
" http://vimawesome.com/ ---> vim plugins
" http://www.vimbits.com/ ---> vim scripts
" http://bytefluent.com/vivify/ ---> color theme preview and creator
" http://vimdoc.sf.net (this is :help as html)
" =============================================================================
filetype off
"source $HOME/.vim/plugins.vim
" Setup DeinVim  ----------------------------------------------------------{{{
  if (!isdirectory(expand("$HOME/.config/nvim/repos/github.com/Shougo/dein.vim")))
    call system(expand("mkdir -p $HOME/.config/nvim/repos/github.com"))
    call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.config/nvim/repos/github.com/Shougo/dein.vim"))
  endif
  if &compatible
    set nocompatible
  endif
  set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim/
  call dein#begin(expand('~/.config/nvim'))
  call dein#add('Shougo/dein.vim')
"start installing plugins
  call dein#add('tmhedberg/SimpylFold') " fold improver for python code
  call dein#add('jiangmiao/auto-pairs') " match quotes brackets parenthesis
  call dein#add('airblade/vim-gitgutter') " show which line is delete,modified,edited
  call dein#add('benekastah/neomake') " asynchronus :make using Neovim job-control functionality
    let g:neomake_python_enabled_makers = ['pep8']
    autocmd! BufWritePost * Neomake
  call dein#add('tpope/vim-surround') " change surroundings
  call dein#add('tomtom/tcomment_vim') " comment plugin
  call dein#add('Chiel92/vim-autoformat') " autoformat plugin (autopep8) need more setup for now didnt use autopep8
    let g:formatters_python = ['autopep8']
  call dein#add('scrooloose/nerdtree')
  call dein#add('Xuyuanp/nerdtree-git-plugin') " showing git status flags in nerdtree
  call dein#add('vim-airline/vim-airline')
  call dein#add('Shougo/deoplete.nvim') " autocomplete plugin like YouCompleteMe
    let g:deoplete#enable_at_startup = 1
  call dein#add('gorodinskiy/vim-coloresque') " css,html,sass,less color prewiev
  call dein#add('ryanoasis/vim-devicons') " icons in vim
  call dein#add('flazz/vim-colorschemes') " many colorschemes
  call dein#add('Valloric/MatchTagAlways') " always highlight enclosing tags
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('easymotion/vim-easymotion') " easy jump for vim <leader><leader>[w] / <leader><leader>f[char]
  call dein#add('ervandew/supertab') " easy jump for vim <leader><leader>[w] / <leader><leader>f[char]
  " call dein#add('terryma/vim-multiple-cursors') " multiple currsors in vim
  "call dein#add('dhruvasagar/vim-table-mode') " table creator in vim
  call dein#add('tpope/vim-fugitive')
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
    " Plugin key-mappings.
    imap <C-j>     <Plug>(neosnippet_expand_or_jump)
    smap <C-j>     <Plug>(neosnippet_expand_or_jump)
    xmap <C-j>     <Plug>(neosnippet_expand_target)

    " SuperTab like snippets behavior.
    " imap <expr><TAB>
    " \ pumvisible() ? "\<C-n>" :
    " \ neosnippet#expandable_or_jumpable() ?
    " \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
    smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

    " For conceal markers.
    if has('conceal')
    set conceallevel=2 concealcursor=niv
    endif
  "call dein#add('mattn/emmet-vim', {'on_ft': 'html'})
"end installing plugins

  if dein#check_install()
    call dein#install()
  endif
  call dein#end()
  filetype plugin indent on
 "}}}
filetype plugin indent on
" TODO: check vim pasta plugin
"
"
"
"source $HOME/.vim/key_bidings.vim
let mapleader=","
"NerdTree bindings-------------------------------------------------------------
map <c-t> :NERDTreeToggle<CR>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
"Keys maps---------------------------------------------------------------------
"remap arrow keys to nothing
noremap <left> <nop>
noremap <right> <nop>
noremap <up> <nop>
noremap <down> <nop>
"better regular expressions searching
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v
"move currsor with j and k on wrap lines too 
nnoremap j gj
nnoremap k gk
" no highlight
nnoremap <leader> :noh<cr>
" map ; to :
nnoremap ; :
"turn on off spell checking with ,s
nmap <silent><leader>s :set spell!<CR> 
"move current line up or down with arrows
nmap <Up> ddkP
nmap <Down> ddp
"move multiple selected lines up or down with arrows
vmap <Up> xkP`[V`]
vmap <Down> xp`[V`]
"folding and unfolding with Space
nnoremap <Space> za
vnoremap <Space> za
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
"edit vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv
" Comment Keys
nnoremap <leader>c :TComment<cr>
vnoremap <leader>c :TComment<cr>
":Autoformat
noremap <F12> :Autoformat<CR>
"------------------------------------------------------------------------------
"forcing saving files that require root permission with :W
"cmap w!! %!sudo tee > /dev/null %
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

"format html on read and write (remove spaces)
autocmd BufRead,BufWritePre *.html normal gg=G 

"run python code in vim <F5>
noremap <F5> <ESC>:w<CR>:execute "!python %"<CR>

"auto chmod +x if file begin with #! and contains /bin/
au bufwritepost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | silent !chmod a+x <afile> | endif | endif

"this is nedded for simply fold to work correctly
autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
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
set number "show current line number
set relativenumber "show line numbers relative to the current line
set scrolloff=2 "number of screen lines to show around the cursor
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
"10 GUI
set guifont=Inconsolata\ 13
"11 printing
"12 messages and info
set showcmd "show command keys in the status line
"13 selecting text
set clipboard=unnamed
"set clipboard=unnamedplus
"14 editing text
set textwidth=80 "line length above which to break the line
"15 tabs and indenting
set autoindent "automatically set the indent of a new line
set smartindent "do clever autoindenting
set expandtab "expand tab to spaces in insert mode
set shiftwidth=4 "number of spaces used for each step of (auto)indent
set softtabstop=4 "number of spaces to insert for a <Tab>
set tabstop=4 "number of spaces a <Tab> in the text stands for
set shiftround "round to 'shiftwidth' for '<<' and '>>'
"16 folding
"set foldmethod=indent
"set foldlevel=99
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
"set lazyredraw
"
" NVIM specific settings
set clipboard+=unnamedplus