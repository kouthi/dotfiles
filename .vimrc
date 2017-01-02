" TIPS: normal
" g* g# : same as *|#, with anti-wordwise
" gi, g;, g, : work around last changes
" gF : enhanced gf, which takes the number prefix
" gR : enter VirtualREPLACE mode
" [*,]* or [/,]/ : go to prev/next C stype comment
" <Tab> in Normal mode or quickfix window
" TIPS: completion in insert mode
" i_<c-x><c-]> tag
" i_<c-x><c-d> macro
" i_<c-x><c-o> omni
" <c-y>:OK, <c-e>:cancel
" TIPS: cmdline
" \0 or \r in {string} of :s
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
" :helpclose
" TIPS: registers
" ": unnamed, refer to most recently used register almost every time
"    with an exception (see below)
" _: black hole, record nothing including unnamed register
" 0  : numbered, for YANKING history without specifying register
" 1-9: numbered, for DELETING history without specifying register
"      deletions within one line is ignored, unless the motion used in
"      the deletion has possibility of exceeding one line (namely %()`/?nN{})
" -: characterwise(small) deletion history without specifying register
" .: most recently inserted text
" :: most recently executed EX command
" /: most recently search string
" %: current buffer name, #: alternate buffer name

" source $VIMRUNTIME/defaults.vim " just for reference (using gf on this)
source $VIMRUNTIME/vimrc_example.vim
" The part 'I humbly don't agree with you, Mr.Bram.'
" we have brilliant HML movement of intuition in normal mode.
" However, setting the following non-zero unnecessarily collapses this virtue.
set scrolloff=0
" 'suicide' features of their own is not beautiful unless it is
" too malfunction to accept, and I think ex mode is not.
unmap Q
set noundofile " new and default from vim7.3, though I don't like this.
" colorscheme
syntax on
set t_Co=256
colorscheme apprentice
hi VertSplit ctermbg=235  ctermfg=238  guibg=#262626 guifg=#444444
hi Folded gui=bold term=standout ctermbg=DarkGrey ctermfg=black
" misc
language C
set cpoptions+=v$ " make vim nostalgic one
set noshowcmd nowrap belloff=all
set showmatch
set fileencodings=ucs-bom,utf-8,cp932 " 'AAAIM JAPANEEEESE!!!' -Mune Kawasaki
set ambiwidth=double " 'AAAIM JA(ry
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
behave mswin
set completeopt=menuone,preview showfulltag pumheight=10 tagcase=smart
hi Pmenu ctermfg=gray ctermbg=black
set backupdir=~/.vim/backup directory=~/.vim/swap
"set colorcolumn=81 " Once I set it, but concluded is dirty.
"set noequalalways " This causes E36 when :cwin. I can't recognize why.
" folding
set foldmethod=syntax
let g:perl_fold=1
let g:tex_fold_enabled=1
" ~/.vim/plugin/foldtext.vim
let g:Foldtext_enable=1
let g:Foldtext_tex_enable=1
let g:Foldtext_cpp_enable=1
let g:Foldtext_perl_enable=1
" In OSX, change the setting of keyboard 'wat insert when press '\'' preference.
" Otherwise, the following won't work.
nnoremap \d O<Esc>!!date +\%F<CR>==I
nnoremap \t :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
" search path
set path+=./include,/usr/include/**1,/usr/local/include,/usr/local/include/**1
set tags+=~/.vim/systags
" suffix recognition
autocmd BufRead,BufNewFile *.cmake,CMakeLists.txt set filetype=cmake
autocmd BufRead,BufNewFile *.org set filetype=org
autocmd BufRead,BufNewFile .tmux.conf set filetype=tmux
" security
set nomodeline
set secure
