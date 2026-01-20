" TIPS: normal
" g* g# : same as *|#, with anti-wordwise
" gi, g;, g, : work around last changes
" gF : enhanced gf, which takes the number prefix
" gR : enter VirtualREPLACE mode
" [*,]* or [/,]/ : go to prev/next C style comment
" <Tab> in Normal mode or quickfix window
" TIPS: completion in insert mode
" i_<c-x><c-]> tag
" i_<c-x><c-d> macro
" i_<c-x><c-o> omni
" <c-y>:OK, <c-e>:cancel
" TIPS: cmdline
" \0 or \r in {string} of :s
" :{range} normal @{register} : run macro for range
" :* corresponds to :'<,'> (if cpoptions doesn't contain *)
" :a!
" :DiffOrig
" :se {option}&, :se all&, :verb se {option}?
" :echo g:colors_name, :echo &t_Co
" :jumps
" :scrip
" :map
" :bel vnew, :on
" :h standard-plugin-list
" :opt
" :!sudo tee >/dev/null %
" :se spell
" :set {option}^={string}
" :helpclose
" :dig
" TIPS: registers
" ["] unnamed, refer to most recently used register almost every time
"     with an exception (see below)
" [%] current buffer name
" [#] alternate buffer name
" [*] the clipboard incarnation (primary)
" [+] the clipboard incarnation (secondary)
" [/] most recently search string
" [:] most recently executed EX command
" [.] most recently inserted text
" [-] characterwise(small) deletion history without specifying register
" [=] the expression register: let us calc
" [_] black hole, record nothing including unnamed register
" [0] numbered, for YANKING history without specifying register
" [1-9] numbered, for DELETING history without specifying register
"      deletions within one line is ignored, unless the motion used in
"      the deletion has possibility of exceeding one line (namely %()`/?nN{})

" source $VIMRUNTIME/defaults.vim " just for reference (use 'gf' to jump)
source $VIMRUNTIME/vimrc_example.vim
" reset some settings in vimrc_example.vim
set scrolloff=0
" unmap Q

" colorscheme
syntax on
set t_Co=256
colorscheme apprentice
hi VertSplit ctermbg=235  ctermfg=238  guibg=#262626 guifg=#444444
hi Folded gui=bold term=standout ctermbg=DarkGrey ctermfg=black
hi Pmenu ctermfg=gray ctermbg=black
let g:markdown_fenced_languages = ['python', 'js=javascript']

" misc
language C
set nowrap belloff=all
set showmatch
set fileencodings=ucs-bom,utf-8,cp932
set ambiwidth=double
set listchars+=tab:>-,trail:-
set expandtab tabstop=4 shiftwidth=4 shiftround smarttab smartindent " oracle
set matchpairs+=<:>
set virtualedit+=block
set nrformats+=alpha
set ignorecase smartcase
" I know formatoptins set here is overwritten by ftplugin, but I don't have an
" idea what the clever solution is.
set textwidth=78 formatoptions-=tc formatoptions+=j
set ttymouse=xterm2
set mouse=a
behave mswin
set completeopt=menuone,preview showfulltag pumheight=10
" 2018-04-18 http://auewe.hatenablog.com/entry/2013/05/14/003610 
" set backupdir=~/.vim/backup directory=~/.vim/swap noundofile
" 2026-01-20 backup/swap will be located based on location of .vimrc
if isdirectory($HOME . '/.vim/backup')
    set backupdir^=$HOME/.vim/backup//
endif
if isdirectory($HOME . '/.vim/swap')
    set directory^=$HOME/.vim/swap//
endif
if isdirectory($HOME . '/.config/vim/backup')
    set backupdir^=$HOME/.config/vim/backup//
endif
if isdirectory($HOME . '/.config/vim/swap')
    set directory^=$HOME/.config/vim/swap//
endif
"set noequalalways " This causes E36 when :cwin. I can't recognize why.
set foldmethod=syntax
let g:perl_fold=1
let g:tex_fold_enabled=1

" mapping
" In OSX, change the setting of keyboard 'wat insert when press '\'' preference.
" Otherwise, the following won't work.
nnoremap \d O<Esc>!!date +\%F<CR>==I
nnoremap \t :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
" 2022-05-26
cnoreabbrev w up
cnoreabbrev up w

" tag
if v:version >= 800
    set tagcase=smart
endif
set path+=./include,/usr/include/**1,/usr/local/include,/usr/local/include/**1
set tags+=~/.vim/systags

" filetype
autocmd BufRead,BufNewFile *.cmake,CMakeLists.txt set filetype=cmake
autocmd BufRead,BufNewFile *.org set filetype=org
autocmd BufRead,BufNewFile .tmux.conf set filetype=tmux
autocmd BufRead,BufNewFile .spacemacs set filetype=lisp

" security
set nomodeline
set secure
