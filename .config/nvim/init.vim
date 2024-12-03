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
set cursorcolumn
set mouse=

:tnoremap <A-h> <C-\><C-N><C-w>h
:tnoremap <A-j> <C-\><C-N><C-w>j
:tnoremap <A-k> <C-\><C-N><C-w>k
:tnoremap <A-l> <C-\><C-N><C-w>l

syntax region csregion start=/\/\/#region/ end=/\/\/#endregion/

":inoremap <A-h> <C-\><C-N><C-w>h
:inoremap <A-j> <C-\><C-N><C-w>j
:inoremap <A-k> <C-\><C-N><C-w>k
":inoremap <A-l> <C-\><C-N><C-w>l

lua << EOF
vim.keymap.set('n', '<A-l>'  , '<cmd>tabnext<cr>')
vim.keymap.set('n', '<A-h>'  , '<cmd>tabprevious<cr>')
vim.keymap.set('n', '<A-q>'  , '<cmd>tabclose<cr>')
vim.keymap.set('n', '<A-Tab>', '<cmd>tabclose<cr>')
vim.keymap.set('n', '<A-1>'  , '<cmd>tabfirst<cr>')
vim.keymap.set('n', '<A-2>'  , '<cmd>2tabnext<cr>')
vim.keymap.set('n', '<A-3>'  , '<cmd>3tabnext<cr>')
vim.keymap.set('n', '<A-4>'  , '<cmd>4tabnext<cr>')
vim.keymap.set('n', '<A-5>'  , '<cmd>5tabnext<cr>')
vim.keymap.set('n', '<A-6>'  , '<cmd>6tabnext<cr>')
vim.keymap.set('n', '<A-7>'  , '<cmd>7tabnext<cr>')
vim.keymap.set('n', '<A-8>'  , '<cmd>8tabnext<cr>')
vim.keymap.set('n', '<A-9>'  , '<cmd>tablast<cr>')
EOF

":nnoremap <A-h> <C-w>h
":nnoremap <A-j> <C-w>j
":nnoremap <A-k> <C-w>k
":nnoremap <A-l> <C-w>l

":noremap <C-l> <cmd>Telescope find_files<cr>
":noremap <C-j> <cmd>Telescope live_grep<cr>
":noremap <C-b> <cmd>Telescope buffers<cr>
lua << EOF
vim.keymap.set('n', '<C-j>', '<cmd>:Rg<CR>')
vim.keymap.set('n', '<C-n>', '<cmd>:Windows<CR>')
vim.keymap.set('n', '<C-l>', '<cmd>:Files<CR>')
vim.keymap.set('n', '<C-h>', '<cmd>:History<CR>')
EOF

":noremap <S-L> :e #<CR>

":noremap <C-p> :ALEGoToDefinition<CR>

"let g:ale_linter_aliases = {
"      \ 'jsx': ['css', 'javascript'],
"      \ 'javascriptreact': ['css', 'javascript']
"      \}

"let b:ale_linters = {
"     \  'javascript': ['eslint'],
"     \  'jsx': ['stylelint'],
"     \  'javascriptreact': ['stylelint'],
"     \  'html': ['angular', 'eslint'],
"     \}


"let g:deoplete#enable_at_startup = 1
"let g:ale_completion_enabled = 1
"let g:ale_c_build_dir_names = ['build', 'bin', 'build/debug', 'build/prod', 'debug']

call plug#begin()
Plug 'norcalli/nvim-colorizer.lua'
Plug 'ranjithshegde/ccls.nvim'
Plug 'raghur/vim-ghost', {'do': ':GhostInstall'}
Plug 'williamboman/mason.nvim',
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig',
Plug 'rhysd/vim-grammarous'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
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
"Plug 'dense-analysis/ale'
Plug 'sbdchd/neoformat'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'nvim-lua/plenary.nvim'
call plug#end()

imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

function! AutoSaveSession()
  if !empty(expand(glob("Session.vim"))) && exists('v:this_session') && !(len(v:this_session) == 0)
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
" autocmd FileType cpp setlocal equalprg='clang-format'

let g:lexical#spell = 1   
let g:lexical#spelllang = ['en_us','pt_br']
set termguicolors " this variable must be enabled for colors to be applied properly
colorscheme dracula

imap <A-t> :Todo<CR>
nmap <A-t> :Todo<CR>

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

set foldmethod=manual
"set foldexpr=nvim_treesitter#foldexpr()
"set nofoldenable

"let g:ale_linters_explicit = 1

lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"vim", "typescript", "javascript", "html", "tsx", "cpp", "c", "css", "html"},
  highlight = { enable = true },
  indent = { enable = true },
  auto_install = true,
  additional_vim_regex_highlighting = false
}

require'treesitter-context'.setup{
  enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
  max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
  min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
  line_numbers = true,
  multiline_threshold = 20, -- Maximum number of lines to show for a single context
  trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
  mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
  -- Separator between context and content. Should be a single character string, like '-'.
  -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
  separator = nil,
  zindex = 20, -- The Z-index of the context window
  on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
}

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

EOF

lua << EOF
  require("mason").setup()
  require("mason-lspconfig").setup {
      ensure_installed = { "lua_ls", "pyright", "cssls", "clangd" },
  }
EOF

lua << EOF
-- Setup language servers.

local lspconfig = require('lspconfig')
lspconfig.pyright.setup {}
lspconfig.cssls.setup {}
lspconfig.tsserver.setup {
  settings = { implicitProjectConfiguration = { checkJs = true } }
}
lspconfig.jdtls.setup {}
lspconfig.sqlls.setup {}


-- lspconfig.ccls.setup {
--   init_options = {
--     cache = {
--       directory = ".ccls-cache";
--     };
--   }
-- }


lspconfig.clangd.setup {
  -- cmd = { 'docker', 'run', '-i', '--rm', '-v',  vim.fn.getcwd() .. ':' .. vim.fn.getcwd(), '-w', vim.fn.getcwd(), 'clang', 'clangd', '--query-driver=/usr/bin/g++' },
  cmd = {"clangd", "--log=verbose", "--clang-tidy", "--all-scopes-completion", "--enable-config" },
  root_dir = lspconfig.util.find_git_ancestor()
}
lspconfig.lua_ls.setup {}
lspconfig.eslint.setup {}
lspconfig.html.setup {}
lspconfig.solargraph.setup {}
lspconfig.ruby_lsp.setup {}


-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

vim.o.updatetime = 250
vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
EOF

lua require'colorizer'.setup()
