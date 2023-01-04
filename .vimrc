set nocp

filetype plugin on
packadd! matchit

"fix arrow keys problem mac
"~ start ~
    :set notimeout          " don't timeout on mappings
    :set ttimeout           " do timeout on terminal key codes
    :set timeoutlen=100 
" ~ end ~

"run the script at absolute path run.sh when writing a tex file
" :autocmd BufWritePost *.tex silent! !/Users/marius/Desktop/uws/master_thesis/master_dissertation/run.sh %:p 

"run 
" :autocmd BufWritePost *.tex silent! !/Users/marius/Desktop/uws/master_thesis/master_dissertation/run.sh %:p 
" :au FocusGained * :redraw!


set number
set backspace=indent,eol,start
syntax on
set background=dark    " Setting dark mode
set tabstop=2
set shiftwidth=2
set smartindent
set autoindent


if has("autocmd")
  augroup templates
"	autocmd BufNewFile *.java 0r ~/.vim/templates/Java_Skeleton.java
		  autocmd BufNewFile *.java
			 \ exe "normal O \npublic class " . expand('%:t:r') .
			 \ "{\n\n\tpublic " . expand('%:t:r') . "(){\n}\n\n" .
			 \ "public static void main(String[] args){\n}\n\n} \<Esc>1G"
 augroup END
endif

if has("autocmd")
  augroup templates
    autocmd BufNewFile *.html 0r ~/.vim/templates/Html_Skeleton.html
  augroup END
endif

if has("autocmd")
  augroup templates
    autocmd BufNewFile *.js 0r ~/.vim/templates/Javascript.js
  augroup END
endif

if has("autocmd")
  augroup templates
    autocmd BufNewFile *.tex 0r ~/.vim/templates/latexTemplate.tex
  augroup END
endif

if has("autocmd")
  augroup templates
    autocmd BufNewFile *.php 0r ~/.vim/templates/PhpTemplate.php
  augroup END
endif


:set number relativenumber

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END


" ignore executable code
set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.*
let NERDTreeRespectWildIgnore=1

nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><A-1> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><A-2> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" Don't copy the line numbers
se mouse+=a
