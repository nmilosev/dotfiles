call plug#begin()
Plug 'kien/ctrlp.vim'
Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdcommenter'
Plug 'davidhalter/jedi-vim'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'dense-analysis/ale'
Plug 'morhetz/gruvbox'
call plug#end()

" Some basic stuff
set number
set showmatch
syntax on

set <A-1>=`
nmap <A-1> :NERDTreeToggle<CR>

set <F13>=
noremap <F13> :call NERDComment(0,"toggle")<CR>
" So that NERDCommenter can automatically decide how to comment a particular filetype
filetype plugin on

let jedi#show_call_signatures = 0
let jedi#documentation_command = "<F10>"
autocmd FileType python setlocal completeopt-=preview

set mouse=a
let g:jedi#goto_command = "<C-LeftMouse>"
map <C-b> <C-LeftMouse>

set updatetime=100

set foldmethod=indent
set foldlevelstart=99
nnoremap - za
map _ zM
map + zR 

set scrolloff=5
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set t_Co=256
set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set modelines=0   " Disable modelines as a security precaution
set nomodeline
set ruler

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json
  autocmd BufRead,BufNewFile aliases.local,zshrc.local,*/zsh/configs/* set filetype=sh
  autocmd BufRead,BufNewFile gitconfig.local set filetype=gitconfig
  autocmd BufRead,BufNewFile tmux.conf.local set filetype=tmux
  autocmd BufRead,BufNewFile vimrc.local set filetype=vim
augroup END

" Softtabs, 2 spaces
set tabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces

syntax on

autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> :w<CR>:exec '!python' shellescape(@%, 1)<CR>

autocmd vimenter * ++nested colorscheme gruvbox
set background=dark

ca tn tabnew
ca th tabp
ca tl tabn
ca pi Pyimport
