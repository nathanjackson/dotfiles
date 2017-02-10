" Nathan's Vim Settings

set nocompatible
filetype off

" Vundle Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" airline
Plugin 'vim-airline/vim-airline'

" command-t - fast file navigation
Plugin 'wincent/command-t'

" SuperTab
Plugin 'ervandew/supertab'

" vim-go
Plugin 'fatih/vim-go'

" gocode
Plugin 'nsf/gocode', {'rtp': 'vim/'}

" javacomplete2
Plugin 'artur-shaik/vim-javacomplete2'

" Syntastic
Plugin 'vim-syntastic/syntastic'

call vundle#end()

filetype plugin indent on
set tabstop=4 shiftwidth=4 expandtab
if has("gui_running")
    set background=light
else
    set background=dark
endif

" Always show airline
set laststatus=2

" Syntastic
let g:syntastic_go_checkers = ['go']
let g:go_fmt_fail_silently = 1

" Configure supertab
let g:SuperTabDefaultCompletionType = "context"

" javacomplete2
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" Custom Go Key Mappings
autocmd FileType go map <F5> :GoRun<CR>
