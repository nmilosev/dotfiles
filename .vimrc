" vim-plug setup
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

set encoding=utf-8

call plug#begin()
Plug 'kien/ctrlp.vim'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'preservim/tagbar'
Plug 'itchyny/vim-cursorword'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-dispatch'
Plug 'Yggdroot/indentLine'
Plug 'wincent/vim-clipper'
Plug 'wellle/context.vim'
Plug 'madox2/vim-ai'
Plug 'haishanh/night-owl.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
call plug#end()

" Some basic stuff
set number
set showmatch
syntax on

nmap <silent> <C-T> :NERDTreeToggle<CR>
nmap <silent> <C-Y> :TagbarToggle<CR>

set <F13>=
noremap <F13> :call nerdcommenter#Comment(0,"toggle")<CR>
" So that NERDCommenter can automatically decide how to comment a particular filetype
filetype plugin on

autocmd FileType python setlocal completeopt-=preview

set mouse=a
map <C-b> <C-LeftMouse>

set updatetime=50

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

set tabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Display extra whitespace
set listchars=tab:▸\ ,trail:·
set list

" Use one space, not two, after punctuation.
set nojoinspaces


if has('termguicolors')
    set termguicolors
endif

set background=dark

colorscheme night-owl

ca tn tabnew
ca th tabp
ca tl tabn
ca pi Pyimport
ca tb TagbarToggle
ca Format LspDocumentFormat

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
let g:ack_use_dispatch = 1
set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir

let g:ClipperAuto=0
let g:vim_json_conceal=0

let initial_prompt =<< trim END
>>> system

When outputting source code, do not use markdown formatting.

END
let g:vim_ai_token_file_path = '~/.vim/gemini.token'
let g:vim_ai_chat = {
\  "engine": "chat",
\  "options": {
\    "endpoint_url": "https://generativelanguage.googleapis.com/v1beta/openai/chat/completions",
\    "enable_auth": 1,
\    "model": "gemini-1.5-flash",
\    "max_tokens": 0,
\    "request_timeout": 20,
\    "temperature": 0.2,
\    "selection_boundary": "",
\    "initial_prompt": initial_prompt,
\  },
\  "ui": {
\    "code_syntax_enabled": 0,
\    "populate_options": 0,
\    "open_chat_command": "preset_right",
\    "scratch_buffer_keep_open": 0,
\    "paste_mode": 1
\  },
\}
let g:vim_ai_complete = g:vim_ai_chat
let g:vim_ai_edit = g:vim_ai_chat

let g:lsp_diagnostics_virtual_text_enabled = 0
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_diagnostics_echo_delay = 10
let g:lsp_diagnostics_float_cursor = 0
let g:lsp_diagnostics_float_delay = 1000
let g:lsp_diagnostics_highlights_enabled = 0
let g:lsp_document_highlight_enabled = 0
imap <c-space> <Plug>(asyncomplete_force_refresh)
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
