" Plugins à installer (:PlugInstall)
" ------- - --------- ---------------
call plug#begin(stdpath('data') . '/plugged')
"" Améliorations de VIM
Plug 'ciaranm/securemodelines'
Plug 'editorconfig/editorconfig-vim'

" Les thèmes
" --- ------
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'marko-cerovac/material.nvim'

" Améliorations de l'interface graphique
" ------------- -- ----------- ---------
Plug 'preservim/nerdtree' |
	\ Plug 'Xuyuanp/nerdtree-git-plugin' |
	\ Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'andymass/vim-matchup'

" Recherche 'Fuzzy'
" --------- -------
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Support linguistique sémantique 
" ------- ------------ ---------- 
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'ray-x/lsp_signature.nvim'
Plug 'hrsh7th/cmp-vsnip' " Seulement parce que nvim-cmp l'exige
Plug 'hrsh7th/vim-vsnip'
Plug 'tpope/vim-surround'

" Support linguistique syntaxique
" ------- ------------ ----------
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'rust-lang/rust.vim'
Plug 'rhysd/vim-clang-format'
Plug 'godlygeek/tabular'
Plug 'mattn/emmet-vim'
call plug#end()



" Variables de configuration + plugins
"--------------------------- - -------

" Windows
" -------
if has('win64') || has('win32') || has('win16')
	let &shell = 'pwsh.exe'
	let s:is_win = 1
endif


" Rust
" ----
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0

" Javascript
" ----------
let javaScript_fold=0

" Thèmes
" ------
let g:material_style = 'deep ocean'

let g:user_emmet_expandabbr_key='<Tab>'

let g:secure_modelines_allowed_items = [
	\ "textwidth",   "tw",
	\ "softtabstop", "sts",
	\ "tabstop",     "ts",
	\ "shiftwidth",  "sw",
	\ "expandtab",   "et",   "noexpandtab", "noet",
	\ "filetype",    "ft",
	\ "foldmethod",  "fdm",
	\ "readonly",    "ro",   "noreadonly", "noro",
	\ "rightleft",   "rl",   "norightleft", "norl",
	\ "colorcolumn"
\ ]

let g:lightline = {
	\ "active": {
	\   "left": [ [ "mode", "paste" ],
	\             [ "readonly", "filename", "modified" ] ],
	\   "right": [ [ "lineinfo" ],
	\              [ "percent" ],
	\              [ "fileencoding", "filetype" ] ],
	\ },
	\ "component_function": {
	\      "filename": "LightlineFilename"
	\ },
\ }

function! LightlineFilename()
	return expand('%:t') !=# '' ? @% : '[aucun fichier]'
endfunction

" Configuration VIM
"-------------- ---

colorscheme material
syntax on
hi Normal ctermbg=NONE

if has('nvim')
	set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
	set inccommand=nosplit
	noremap <C-q> :confirm qall<CR>
end

if has('win64') || has('win32') || has('win16')
	set shellcmdflag=-ExecutionPolicy\ RemoteSigned\ -NonInteractive\ -Command 
	set shellquote=\" 
	set shellxquote=  
	set shellpipe=|
	set shellredir=>
endif

if !has('gui_running')
	set t_Co=256
endif

" True Color
" ---- -----
if (match($TERM, "-256color") != -1) && (match($TERM, "screen-256color") == -1)  || has('termguicolors')
	set termguicolors
endif

" Code Folding
" ---- -------
set foldenable
set foldlevelstart=2
set foldnestmax=5
set foldmethod=indent


" Indentaion
" ----------
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

set background=dark
set noerrorbells visualbell t_vb=
set ruler

set cmdheight=2
set encoding=utf-8
set scrolloff=2
set timeoutlen=300
set updatetime=300

" https://blog.sher.pl/2014/03/21/how-to-boost-your-vim-productivity/
if executable('ag')
	set grepprg=ag\ --nogroup\ --nocolor
endif
if executable('rg')
	set grepprg=rg\ --no-heading\ --vimgrep
	set grepformat=%f:%l:%c:%m
endif

" Configurations avec LUA
" -------------- ---- ---
lua << EOF
require'lsp_cmp'
EOF

" Commande auto
" -------- ----
autocmd CursorHold,CursorHoldI *.rs :lua require'lsp_extensions'.inlay_hints {
	\ only_current_line = true 
\ }

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" command! -bang -nargs=? -complete=dir Files
"     \ call fzf#vim#files(<q-args>, {'options': [ '--layout=reverse',
" 		\ '--info=inline', '--preview',
" 		\ stdpath('data') . '/plugged'. '/fzf.vim/bin/preview.ps1 {}']
" 	\ }, <bang>0)

" Mapping des touches
" ------- --- -------
map <C-p> :FZF<CR>

" Sortir du mode terminal, sans quitter le terminal
" Notamment pour pouvoir naviguer, copier...
tnoremap <Esc> <C-\><C-n>d

nnoremap <space>    za
nnoremap <silent>   n nzz
nnoremap <silent>   N Nzz
nnoremap <silent>   * *zz
nnoremap <silent>   # #zz
nnoremap <silent>   g* g*zz

nnoremap ? ?\v
nnoremap / /\v

nnoremap <C-e> 		:NERDTreeToggle<CR>
nnoremap <C-z> 		<nop>

nnoremap <A-Down> 	:m .+1<CR>==
nnoremap <A-Up> 	:m .-2<CR>==

inoremap <A-Down>	<Esc>:m .+1<CR>==gi
inoremap <A-Up>		<Esc>:m .-2<CR>==gi

vnoremap <A-Down> 	:m '>+1<CR>gv=gv
vnoremap <A-Up> 	:m '<-2<CR>gv=gv

