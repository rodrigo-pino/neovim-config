call plug#begin('~/.local/share/nvim/site/autoload')
" Code Parser
Plug 'nvim-treesitter/nvim-treesitter' 
 
" COC Lenguage Service Provider
Plug 'neoclide/coc.nvim',  {'branch': 'release'} 

"""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""
" Native Language Service Provider
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim' 
Plug 'williamboman/mason-lspconfig.nvim'
" Autocompletion for Native LSP
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'
" Main Plugin
Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v2.x'}
"""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""


" DAP (Debug Adapter Protocol)
Plug 'mfussenegger/nvim-dap'

" Latex in nvim
Plug 'lervag/vimtex'

" Git Integration
Plug 'tpope/vim-fugitive'
Plug 'f-person/git-blame.nvim'

" Resizing Windows
" Ctrl-e to activate
" hjkl to move
" e to change modes
Plug 'simeji/winresizer'

" Candy Eye
" Theme
Plug 'navarasu/onedark.nvim'
Plug 'Mofiqul/dracula.nvim'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'Mofiqul/vscode.nvim'
Plug 'tanvirtin/monokai.nvim'
Plug 'folke/tokyonight.nvim'

" Status Bar 
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim'

" Github Copilot
" Plug 'github/copilot.vim'
call plug#end()

"" Var settings
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching brackets.
set ignorecase              " case insensitive matching
set mouse=v                 " middle-click paste with mouse
set hlsearch                " highlight search results
set tabstop=4               " number of columns occupied by a tab character
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set termguicolors
set cursorline
"if exists('+termguicolors')
"  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"endif
"set termguicolors
filetype plugin indent on   " allows auto-indenting depending on file type
" syntax on                   " syntax highlighting
"
"" Color scheme according to time of day
if (exists('light'))
    colorscheme onehalflight
else
    colorscheme dracula
    " For dracula
    highlight DiffAdd guifg=#50fa7b guibg=#282A36
endif


" Configure the coc floating window to use the custom highlight group
let g:coc_floating_config = {
      \ 'border': 'single',
      \ 'highlight': 'WhiteBorder',
      \ }


""
autocmd ColorScheme *
      \ hi CocHoverBorder guifg=#ffffff guibg=#ffffff


"" Language Spelling!!!
" set spell
" set spelllang=en
" set spellsuggest=best,9

" Python 3 Default Provider
let g:python3_host_prog='~/.pyenv/versions/neovim/bin/python'
"
"" Linting for JavaScript? Not sure what is this
"" let g:neomake_javascript_enabled_makers = ['eslint']
"
"" vimtex config
"let g:vimtex_syntax_enabled=1
"
"
" git blamer config
let g:gitblame_enabled = 1
let g:gitblame_delay = 1000
let g:gitblame_message_template = '<author> • <summary>'
" let g:blamer_enabled = 1
" let g:blamer_delay = 1000
" let g:blamer_show_in_visual_modes = 0
" let g:blamer_show_in_insert_modes = 0
" let g:blamer_prefix = '  '
"====================CoC Configs=====================
let g:coc_global_extensions=[
     \ 'coc-rust-analyzer',
     \ 'coc-snippets',
     \ 'coc-eslint',
     \ 'coc-markdownlint',
     \ 'coc-prettier',
     \ 'coc-tsserver', 
     \ 'coc-json',
     \ 'coc-prettier',
     \ 'coc-pyright',
     \ 'coc-explorer',
     \ 'coc-toml',
     \ 'coc-vimtex',
     \ 'coc-texlab',
     \ 'coc-git',
     \ 'coc-vimlsp',
     \ 'coc-yaml',
     \ 'coc-helper',
     \ 'coc-pairs',
     \ 'coc-highlight',
     \ 'coc-solidity',
     \ 'coc-lua'
     \ ]
  " "\ 'coc-floatinput', 
  " \ 'coc-cairo',
  " \ 'coc-css',
  " \ 'coc-html',
  " \ 'coc-go',
  " \ 'coc-omnisharp', unmantained using csharp-ls instead

set cmdheight=2 " Give more space for displaying messages

" coc-explorer config
let g:coc_explorer_global_presets = {
\    'floatingLeftSide': {
\       'position': 'floating',
\       'floating-position': 'left-center',
\       'floating-width': 50,
\       'open-action-strategy': 'sourceWindow',
\    },
\}
"
"" coc-pairs config
"autocmd FileType tex let b:coc_pairs_disabled = ["'"]
"autocmd FileType haskell let b:coc_pairs_disabled = ["<"]
"
" shift width config
autocmd FileType haskell setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2
autocmd FileType json setlocal shiftwidth=2 tabstop=2

"====================Lua Configs=====================
lua <<EOF
-- treesitter configs
require 'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true
    },
}

-- Neoterm Config
-- require('neoterm').setup({
--     clear_on_run = true,
--     mode = 'vertical'
-- })

-- dap (debugger) configs
-- configslua require('dap-python').setup('~/.virtual

-- indent-blankline configs
-- require("indent_blankline").setup {
    --char = "",
    --buftype_exclude = {"terminal"},
    --show_end_of_line = true,
--}

require('lualine').setup({
    options = {theme = 'auto'}
})

require('bufferline').setup({
    options = {
        diagnostics = "coc"
    }
})

require('nvim-web-devicons').setup({
    default = true;
})

-- vim.opt.list = true
-- vim.opt.listchars:append("space:.")
-- require("indent_blankline").setup {
        -- space_char_blankline = " ",
        -- show_current_context = true,
        -- show_current_context_start = true,
    -- }

-- Dracula config
vim.o.termguicolors = true
vim.g.dracula_show_end_of_buffer = true  -- default false, Turn on or off EndOfBuffer symbol
vim.g.dracula_transparent_bg = false-- default false, enables transparent background
-- vim.cmd[[colorscheme dracula]]

EOF

"===================Custom Functions===================
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('cword')
    elseif &filetype==# 'tex'
        VimTexDocPackage
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

"Function that target the first floating windows it detects
function! s:GotoFirstFloat() abort
    for w in range(1, winnr('$'))
        let c = nvim_win_get_config(win_getid(w))
        if c.focusable && !empty(c.relative)
            execute w . 'wincmd w'
        endif
    endfor
endfunction

function! s:ToggleColumnCursor() abort
    if &cursorcolumn 
        set nocursorcolumn
    else
        set cursorcolumn
    endif
endfunction

"=======================Mappings=======================
let mapleader=","
"let maplocalleader="]"

" multilines work as single line
:nnoremap j gj
:nnoremap k gk
:vmap j gj
:vmap k gk

" delete buffer wihtout altering window layout
nnoremap <silent><leader>d :bp\|bd #<CR>

" toggle column cursor
noremap <silent> <leader>cc :<c-u>call <SID>ToggleColumnCursor()<CR>

" focus floating window
noremap <C-W><space> :<c-u>call <SID>GotoFirstFloat()<CR>

" save with Ctrl-S
nmap <silent> <C-S> :w<CR>

" easy switching between buffers
nnoremap <silent> <C-N> :bnext<CR>
nnoremap <silent> <C-P> :bprev<CR>
tnoremap <silent> <C-N> <C-\><C-N>:bnext<CR>
tnoremap <silent> <C-P> <C-\><C-N>:bprev<CR>

" coc-explorer mapping
:nnoremap <silent> <space>e :CocCommand explorer --preset floatingLeftSide<CR>
:nnoremap <silent> <space>fe :CocCommand explorer<CR>

" code actions by coc.nvim
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)
" <leader>aw code actions for current word
" <leader>aap code actions for current paragraph
" Apply codeAction to the curretn buffer
nmap <leader>ac <Plug>(coc-codeaction)
nmap <leader>qf <Plug>(coc-fix-current)
" Switch windows with Alt-hjkl in normal mode
:nnoremap ˙ <C-w>h
:nnoremap ∆ <C-w>j
:nnoremap ˚ <C-w>k 
:nnoremap ¬ <C-w>l 
" Switch windows with Alt-hjkl in insert mode
:inoremap ˙ <C-\><C-N><C-w>h
:inoremap ∆ <C-\><C-N><C-w>j
:inoremap ˚ <C-\><C-N><C-w>k 
:inoremap ¬ <C-\><C-N><C-w>l 
" Switch windows with Alt-hjkl in nvim integrated terminal
:tnoremap ˙ <C-\><C-N><C-w>h
:tnoremap ∆ <C-\><C-N><C-w>j
:tnoremap ˚ <C-\><C-N><C-w>k 
:tnoremap ¬ <C-\><C-N><C-w>l 

" Switch to normal mode in terminal mode 
:tnoremap <A-n> <C-\><C-n>

" =============== Coc-Nvim configuration =============== 
" Some servers have issues with backup files
set nobackup
set nowritebackup

" Reduce udpate time
set updatetime=300

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

"GoTo code navigation
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gt <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)

" Use K to show documentation in preview window
:nnoremap <silent> K :call <SID>show_documentation()<CR>


" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>


luafile ~/.config/nvim/dap_config.lua
"luafile ~/.config/nvim/lsp_zero_config.lua
