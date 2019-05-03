
set mouse=n

" nocompatible must be first ( use the real vimpower )
set nocompatible

" show linenumbers
set number


" for case insensitive searches
set ignorecase


" backup rules
set backup " enable backup files (.txt~)
"set undofile " enable persistent undo

silent execute '!mkdir -p $HOME/.vim/tmp/backup'
set backupdir=$HOME/.vim/tmp/backup " where to store backup
silent execute '!mkdir -p $HOME/.vim/tmp/swap'
set directory=$HOME/.vim/tmp/swap " where to store swap
silent execute '!mkdir -p $HOME/.vim/tmp/views'
set viewdir=$HOME/.vim/tmp/views " where to store view
silent execute '!mkdir -p $HOME/.vim/tmp/undo'
set undodir=$HOME/.vim/tmp/undo " where to store undo 


" syntax
syntax on " enable syntax highlighting
" filetype
filetype off " enable filetype detection
filetype plugin on " enable filetype plugins
filetype indent on " enable filetype indentation

" colorscheme
set background=dark " indicate we'll use dark background
colorscheme elflord " example colorscheme, is default available, many more can be added

" set the Monokai theme
" colorscheme monokai
"set t_Co=256  " vim-monokai now only support 256 colours in terminal.
"let g:monokai_term_italic = 1
"let g:monokai_gui_italic = 1


" tabstop settings
set tabstop=4 " a tab will be represented with 4 columns
set softtabstop=4 " <tab> is pressed in insert mode 4 columns
set shiftwidth=4 " indentation is 4 columns
"set noexpandtab " tabs are tabs, do not replace with spaces


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe' " code completion engine for Vim
Plugin 'scrooloose/nerdtree' " NERDTree
Plugin 'editorconfig/editorconfig-vim' " EditorConfig plugin for Vim
Plugin 'mattn/emmet-vim' " emmet for vim
Plugin 'othree/html5.vim' " HTML5 omnicomplete and syntax for vim
Plugin 'StanAngeloff/php.vim' " An up-to-date Vim syntax for PHP
Plugin 'Shougo/vimproc.vim' " Interactive command execution in Vim. 
Plugin 'leafgarland/typescript-vim' " Typescript syntax files for Vim 
Plugin 'groenewege/vim-less' " vim syntax for LESS (dynamic CSS) 
Plugin 'isruslan/vim-es6' " vim ES6(JavaScript) snippets and syntax highlighting

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" === Highlighting ===

" Syntax highlighting
syntax on

" Highliht matching brackets
set showmatch


" Enable omnicompletion for syntax
set ofu=syntaxcomplete#Complete

" Make the completion menu behave like in an IDE
set completeopt=longest,menuone,preview

" Hide mouse pointer while typing
set mousehide
set mousemodel=popup

" Highlight current line
set cursorline

"
" associate unknow filetypes
" 	syntax:
" 		 au BufRead,BufNewFile *.type setfiletype type " associate if unknow
" 		 au BufRead,BufNewFile *.type set filetype=type " forc association
augroup filetypedetect
    au BufRead,BufNewFile *.ts set filetype=typescript
	au BufRead,BufNewFile *.scss set filetype=scss.css
augroup END

" Set current line color, disable on terminal
hi CursorLine ctermbg=Black ctermfg=NONE cterm=None

" Close autoclomplete highlight window after selection be done
autocmd CompleteDone * pclose

" Makes Sass function names starting with a keyword be highlighted correctly
autocmd FileType scss set iskeyword+=-

" autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" to properly overwrite the vim's default php syntax
function! PhpSyntaxOverride()
	hi! def link phpDocTags  phpDefine
	hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
	autocmd!
	autocmd FileType php call PhpSyntaxOverride()
	autocmd FileType php set matchpairs=(:),{:},[:]
augroup END

" The default is 100 lines.
let php_minlines=500


" Define YCM global configuration file.
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
