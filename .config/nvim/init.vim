set list
set listchars=tab:··,trail:•
set hidden
set laststatus=2
set tabstop=2
set shiftwidth=2
set expandtab
set nu
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

:noremap <C-l> :Files<CR>
:noremap <C-k> :GFiles<CR>
:noremap <C-j> :Rg<CR>
:noremap <C-n> :Windows<CR>

:noremap <S-L> :e #<CR>


let b:ale_linters = {
      \  'javascript': ['eslint'],
      \  'html': ['angular', 'eslint'],
      \}



"let g:deoplete#enable_at_startup = 1
let g:ale_completion_enabled = 1
let g:ale_c_build_dir_names = ['build', 'bin', 'build/debug', 'build/prod']

call plug#begin()
Plug 'rhysd/vim-grammarous'
Plug 'preservim/vim-lexical'
Plug 'leafOfTree/vim-vue-plugin'
Plug '2072/PHP-Indenting-for-VIm'
Plug 'kana/vim-operator-user'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug '2072/PHP-Indenting-for-VIm'
Plug 'bfrg/vim-cpp-modern'
Plug 'tpope/vim-fugitive'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
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
Plug 'dense-analysis/ale'
Plug 'sbdchd/neoformat'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()


imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

function! AutoSaveSession()
  if !empty(expand(glob("Session.vim")) && exists(v:this_session))
    echo "Saving"
    mksession! Session.vim
  endif
endfunction

au VimLeave * :call AutoSaveSession()

augroup lexical
  autocmd!
  autocmd FileType markdown,mkd call lexical#init()
  autocmd FileType textile call lexical#init()
  autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END

let g:neoformat_try_formatprg = 1
autocmd FileType cpp setlocal equalprg='clang-format'

let g:lexical#spell = 1   
let g:lexical#spelllang = ['en_us','pt_br']
set termguicolors " this variable must be enabled for colors to be applied properly
colorscheme dracula

nmap <A-CR> <Plug>BujoAddnormal
imap <A-CR> <Plug>BujoAddinsert
nmap <A-BS> <Plug>BujoChecknormal
imap <A-BS> <Plug>BujoCheckinsert
imap <A-t> :Todo<CR>
nmap <A-t> :Todo<CR>

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"let g:ale_linters_explicit = 1



set omnifunc=ale#completion#OmniFunc
