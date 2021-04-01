set list
set listchars=tab:··,trail:•
set hidden
set laststatus=2
set tabstop=2
set shiftwidth=2
set expandtab
set nu rnu
set nowrap
set so=999

:tnoremap <A-h> <C-\><C-N><C-w>h
:tnoremap <A-j> <C-\><C-N><C-w>j
:tnoremap <A-k> <C-\><C-N><C-w>k
:tnoremap <A-l> <C-\><C-N><C-w>l
:inoremap <A-h> <C-\><C-N><C-w>h
:inoremap <A-j> <C-\><C-N><C-w>j
:inoremap <A-k> <C-\><C-N><C-w>k
:inoremap <A-l> <C-\><C-N><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l

:inoremap <A-o> <C-\><C-N>:tabp<CR>
:inoremap <A-p> <C-\><C-N>:tabn<CR>
:tnoremap <A-o> <C-\><C-N>:tabp<CR>
:tnoremap <A-p> <C-\><C-N>:tabn<CR>
:nnoremap <A-o> :tabp<CR>
:nnoremap <A-p> :tabn<CR>

call plug#begin()
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'jonsmithers/vim-html-template-literals'
Plug 'vuciv/vim-bujo'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'leafgarland/typescript-vim'
Plug 'honza/vim-snippets'
Plug 'peitalin/vim-jsx-typescript'
Plug 'SirVer/ultisnips'
Plug 'styled-components/vim-styled-components', {'branch': 'main'}
Plug 'quabug/vim-gdscript'
Plug 'editorconfig/editorconfig-vim'
Plug 'dart-lang/dart-vim-plugin'
call plug#end()

map <C-l> :NERDTreeToggle<CR>

nmap <A-CR> <Plug>BujoAddnormal
imap <A-CR> <Plug>BujoAddinsert
nmap <A-BS> <Plug>BujoChecknormal
imap <A-BS> <Plug>BujoCheckinsert
imap <A-t> :Todo<CR>
nmap <A-t> :Todo<CR>

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:NERDTreeWinSize=50

set omnifunc=syntaxcomplete#Complete

let g:deoplete#enable_at_startup = 1
