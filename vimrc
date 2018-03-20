call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'powerline/powerline'
Plug 'vim-syntastic/syntastic'
Plug 'Valloric/YouCompleteMe'
Plug 'kien/ctrlp.vim'
call plug#end()


python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set t_Co=256

set number
set ruler

let python_highlight_all=1
syntax on

let g:ycm_autoclose_preview_window_after_completion=1
