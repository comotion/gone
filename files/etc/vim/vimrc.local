syntax on
set nomodeline
set cursorcolumn
set cursorline
set backspace=eol,indent,start
set tabstop=3
set background=dark
set t_Co=16
set shiftwidth=3
set ruler
set smartindent
set autoindent
set enc=utf8
set et
syntax on
highlight Normal guibg=Black guifg=White

" System dependent options
set dictionary+=~/.dictionary                   " Dictionary
set backupdir=~/tmp,.,~/,/tmp                   " Set backup dir to .
set tags+=./tags;/                              " Upward tag search
set printoptions+=syntax:y                      " Use syntax hilighting when printing


" Terminal: we know xterm is a color terminal.
" This is from Debian GNU/Linux global vimrc
if &term =~ "xterm"
    set t_Co=16
    set t_Sf=[3%dm
    set t_Sb=[4%dm
endif

""" Plugin stuff

" Don't use the status line stuff of the cvs plugin because it
" messes up my own status line and title bar messeges are OK.
let g:CVSstatusline = 0

" TeX itemize indent
let g:tex_indent_items = 1

set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set history=512                 " Set history size
"set viminfo='128,\"4096,h,r/tmp,r~/tmp,r/floppy,r/cdrom,r/cdrom2 " read/write a .viminfo file
set viminfo='10,\"100,:20,%,n~/.viminfo
set showcmd                     " Show (partial) command in status line.
set sm                          " Use the kinky s/m-mode. Warning: adult content!
set hidden                      " Use emacs-style hidden buffers
set ww=<,>,[,],h,l,b,s,~        " Make end/beginning-of-line cursor wrapping behave human-like, not vi-like
"set mouse=ar                    " Mouse on
set showbreak=+++\         " If wrapping IS used, show it
set cpoptions+=n                " Use number column for wrapped lines
set ss=1                        " Nice sidescroll
set siso=9                      " Even nicer sidescroll ;)
set scrolloff=4                 " Keep lines between the cursor and bottom/top
set gdefault                    " Use g flag by default in substitutes
set wildmenu                    " Wild menu!
set wildmode=longest,full       " First match only to the longest common string, then use full/wildmenu match
set laststatus=2                " Always show status bar
set listchars=tab:»\ ,trail:·,extends:>,precedes:<  " Use sensible list chars
set foldopen+=jump              " Add jump to fold open list
set noea                        " Do not equalize windows
set previewheight=7             " Preview window height
set virtualedit=block           " Allow more flexible visual block selection
set switchbuf=useopen           " Buffer switching the reuses already visible buffers
set nosol                       " Don't jump to start of line with misc commands
set showfulltag                 " Show full tag completions
set complete=.,w,b,u,U,i,d,k,t  " Better completion, full tags last
set hlsearch                    " Highlight search results
set incsearch                   " Incremental search
set ignorecase                  " Do case insensitive matching
set infercase                   " Handle case in a smart way in autocompletes
set smartcase                   " Do smart case search
set vb                          " Visual bell
set timeoutlen=2000             " Use a longer timeout
set guioptions+=c               " Use console dialogs
set guioptions-=T               " Don't show the toolbar
set mouseshape+=n:beam,v:beam   " Use beam in normal mode, too
set display+=lastline           " A nicer way to show long wrapped lines
set nolist                        " Display list chars by default
"set number                      " Display line number by default
" set foldenable                  " Display folds by default
" set foldcolumn=8                " Use 8 column folds
" Behave in mixed xterm-windows-way
"set selectmode=key              " Use windows-like shift-initiated select mode...
"set keymodel=startsel,stopsel   " ...and make it behave windows-like
set mousemodel=extend           " Use mouse for visual and extend visual
set selection=inclusive         " Selection is inclusive, unix-style
"set shiftround
set cinoptions+=(0              " Custom C indent options
set nojoinspaces                " Don't use double space after a period
"
" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,CVS/,tags

" Status line
set statusline=%<%f\ %y[%{&ff}]%m%r%w%a\ %=%l/%L,%c%V\ %P


""" Commands

" Smart make command
com -nargs=* Make wa | make <args> | cwin

" Smart grep command
com -nargs=* -bar DummyGrep grep <args>
com -nargs=* Grep DummyGrep <args> | cwin

" cd to the dir of the current buffer
com Cd cd %:p:h
com CD cd %:p:h

""" Macros

" Use better mark jump method
map ' `

" Cursor keys use screen lines
map <up> gk
imap <up> <c-o>gk
map <down> gj
imap <down> <c-o>gj

" Easy move between buffers
map <F2> :bp<CR>
imap <F2> <c-o>:bp<CR>
map <F3> :bn<CR>
imap <F3> <c-o>:bn<CR>

" Easy wrap, line numbers & list mode toggle
map <F4> :setlocal wrap!<CR>
imap <F4> <c-o>:setlocal wrap!<CR>
map <F5> :setlocal list!<CR>
imap <F5> <c-o>:setlocal list!<CR>
map <F6> :setlocal nu!<CR>
imap <F6> <c-o>:setlocal nu!<CR>
map <F1> :b #<CR>
imap <F1> <c-o>:b #<CR>

" Palindrome helper
map <Leader>rv Yo<C-O>:set revins<cr><C-R>"<esc>:set norevins<cr>

" Use * and # in visual mode
vmap <silent> * :<C-U>let old_reg=@"<cr>gvy/<C-R>"<cr>:let @"=old_reg<cr><C-L>
vmap <silent> # :<C-U>let old_reg=@"<cr>gvy?<C-R>"<cr>:let @"=old_reg<cr><C-L>


""" Functions

" Enables/Disables folding
map <F7> :call <SID>ToggleFolding()<CR>
imap <F7> <c-o>:call <SID>ToggleFolding()<CR>

function <SID>ToggleFolding()
    if &foldcolumn == 0
        setlocal foldenable
        setlocal foldcolumn=8
    else
        setlocal nofoldenable
        setlocal foldcolumn=0
    endif
endfunction

" This autocomments the curly brackets when you type }//
imap <Leader>} <c-o>:call <SID>CurlyBracket()<CR><c-o>a
map <Leader>} :call <SID>CurlyBracket()<CR>

function <SID>CurlyBracket()
    let l:line_num = line(".")
    let l:is_match = searchpair('{', '', '}', 'bW')
    if (l:is_match > 0)
        let l:comment_string = substitute(getline("."), '^\s*\(.\{-}\)\s*{', '\1', "")
        sil exe ":" . l:line_num
        sil exe "normal a // " . l:comment_string
    endif
endfunction

" Mark with restoring screen position (by Benji Fisher)
function s:Mark(...)
    if a:0 == 0
        let l:mark = line(".") . "G" . virtcol(".") . "|"
        normal! H
        let l:mark = "normal!" . line(".") . "Gzt" . l:mark
        execute l:mark
        return l:mark
    elseif a:0 == 1
        return "normal!" . a:1 . "G1|"
    else
        return "normal!" . a:1 . "G" . a:2 . "|"
    endif
endfun

" Remove trailing blanks but preserve sigdash lines
" Also preserve the trailing spaces in the current line
" Uses the Mark function above
function s:RemoveTrailingBlanks()
    let l:m = s:Mark()
    " Double backslashes required because the expression is evaluated
    " before it's executed
    silent! execute "1,.-1s/\\(^-- $\\)\\|\\(\\s\\+$\\)/\\1/"
    execute l:m
    silent! execute ".+1,$s/\\(^-- $\\)\\|\\(\\s\\+$\\)/\\1/"
    execute l:m
endfunction

" Deletes current buffer without closing the window
" By Raymond Li
command Bdelete call s:BufcloseCloseIt()
command BDelete call s:BufcloseCloseIt()

function s:BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete ".l:currentBufNum)
    endif
endfunction

" Sets simple syntax folding regions
function s:SetSyntaxFolding()

    setlocal foldmethod=syntax

    " Folding syntax regions
    syn region  ketkuCurlyFold
                    \ start="{"
                    \ end="}"
                \ transparent fold

    syn region  ketkuPreprocFold
                    \ start="#if$"
                    \ start="#if .*$"
                    \ start="#ifdef$"
                    \ start="#ifdef .*$"
                    \ start="#ifndef$"
                    \ start="#ifndef .*$"
                    \ end="#endif"
                \ transparent fold
endfunction

" Sets fancy quickfix stuff for LaTeX errors
function s:SetLaTeXMake()
    setlocal efm=%E!\ LaTeX\ %trror:\ %m,
        \%E!\ %m,
        \%+WLaTeX\ %.%#Warning:\ %.%#line\ %l%.%#,
        \%+W%.%#\ at\ lines\ %l--%*\\d,
        \%WLaTeX\ %.%#Warning:\ %m,
        \%Cl.%l\ %m,
        \%+C\ \ %m.,
        \%+C%.%#-%.%#,
        \%+C%.%#[]%.%#,
        \%+C[]%.%#,
        \%+C%.%#%[{}\\]%.%#,
        \%+C<%.%#>%.%#,
        \%C\ \ %m,
        \%-GSee\ the\ LaTeX%m,
        \%-GType\ \ H\ <return>%m,
        \%-G\ ...%.%#,
        \%-G%.%#\ (C)\ %.%#,
        \%-G(see\ the\ transcript%.%#),
        \%-G\\s%#,
        \%+O(%f)%r,
        \%+P(%f%r,
        \%+P\ %\\=(%f%r,
        \%+P%*[^()](%f%r,
        \%+P[%\\d%[^()]%#(%f%r,
        \%+Q)%r,
        \%+Q%*[^()])%r,
        \%+Q[%\\d%*[^()])%r
endfunction

" Smooth scrolling
map <C-U> :call ScrollUp(1)<CR>
map <C-D> :call ScrollDown(1)<CR>
map <C-B> :call ScrollUp(0)<CR>
map <C-F> :call ScrollDown(0)<CR>

function ScrollUp(isHalf)
    if a:isHalf
        let l:lines = &scroll
    else
        let l:lines = &lines - 4
    endif

    while l:lines > 0
        execute "normal \<C-Y>"
        redraw
        let l:lines =  l:lines - 1
    endwhile
endfunction

function ScrollDown(isHalf)
    if a:isHalf
        let l:lines = &scroll
    else
        let l:lines = &lines - 4
    endif

    while l:lines > 0
        execute "normal \<C-E>"
        redraw
        let l:lines =  l:lines - 1
    endwhile
endfunction


""" Abbreviations

" Programming helps
ia #i #include
ia #d #define
ia @p @param
ia @r @return
ia @t @throws
ia @s @see
ia @l @link

" TODO markers
ia t: TODO:
ia T: TODO:
ia //t: // TODO:
ia //T: // TODO:
ia /*t: /* TODO:
ia /*T: /* TODO:
ia "t: " TODO:
ia "T: " TODO:
ia %t: % TODO:
ia %T: % TODO:
ia #t: # TODO:
ia #T: # TODO:

" FIXME markers (I use these to mark temporary code)
ia f: FIXME:
ia F: FIXME:
ia //f: // FIXME:
ia //F: // FIXME:
ia /*f: /* FIXME:
ia /*F: /* FIXME:
ia "f: " FIXME:
ia "F: " FIXME:
ia %f: % FIXME:
ia %F: % FIXME:
ia #f: # FIXME:
ia #F: # FIXME:


""" Autocommands (these are not very portable, but rather customized)

if has("autocmd")
    " Set some sensible defaults for editing source files
    augroup ketku
        au!
        " Remove trailing blanks when writing buffer
        "autocmd BufWritePre         *                               call s:RemoveTrailingBlanks()

        " Mark overlong lines (the color is optimixed for darkslategray)
        autocmd BufEnter            *                               hi rightMargin guibg=slategray | match rightMargin /\%79v/

        " Programming language stuff
        autocmd BufReadPost,BufNew  *.java                          setlocal comments=sl:/*,mb:*,elx:*/,:// makeprg=ant\ -emacs
        autocmd BufReadPost,BufNew  *.xml                           setlocal makeprg=ant\ -emacs
        "autocmd BufReadPost,BufNew  *.py,*.java,*.c,*.cpp,*.cc,*.h,*.xml setlocal sts=3 sw=3 et
        autocmd BufReadPost,BufNew  *.tex                           call s:SetLaTeXMake()
        au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

        " Use syntax folding w/these languages.
        " autocmd Syntax              java,c,cpp,xml                  call s:SetSyntaxFolding()
        autocmd BufEnter            \[Tag List\]                    setlocal foldmethod=manual
    augroup END
endif " has ("autocmd")

