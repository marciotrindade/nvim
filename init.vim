call plug#begin('~/.vim/plugged')
Plug 'Konfekt/FastFold'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ervandew/supertab'
Plug 'google/vim-searchindex'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'jgdavey/vim-blockle'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'kana/vim-textobj-user'
Plug 'matze/vim-move'
Plug 'mhinz/vim-mix-format'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'sheerun/vim-polyglot'
Plug 'terryma/vim-multiple-cursors'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'w0rp/ale'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
if has('nvim')
  Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
" Themes!
Plug 'morhetz/gruvbox'
Plug 'nightsense/snow'
Plug 'hzchirs/vim-material'
Plug 'drewtempelmeyer/palenight.vim' " slow :(
Plug 'dracula/vim'
Plug 'whatyouhide/vim-gotham'
Plug 'mhartington/oceanic-next'
Plug 'ryanoasis/vim-devicons' " must be the last one
call plug#end()

if exists('&inccommand')
  set inccommand=split
endif

set <F20>=j
set <F21>=k
vmap <F20> <Plug>MoveBlockDown
vmap <F21> <Plug>MoveBlockUp
nmap <F20> <Plug>MoveLineDown
nmap <F21> <Plug>MoveLineUp

set background=dark
let g:rspec_command = "Dispatch bin/rspec {spec}"
let g:deoplete#enable_at_startup = 1
let g:dracula_italic=0
colorscheme gruvbox

let g:oceanic_next_terminal_bold = 1
  let g:oceanic_next_terminal_italic = 1
let g:airline_theme='oceanicnext'
let g:material_style='palenight'
let g:airline_theme='dark'
let mapleader = " "

if executable('ag')
  if !exists(":Ag")
    set grepprg=ag\ --nogroup\ --nocolor
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif
set termguicolors
let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ 's'  : 'S',
    \ }
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:airline_section_b = '%{airline#util#wrap(airline#extensions#branch#get_head(),0)}'
let g:airline_section_z = ''
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline#extensions#wordcount#formatter#default#fmt = '%d w'
let g:blockle_mapping = ''
let g:mix_format_on_save = 1
let g:mix_format_silent_errors = 1
let g:rustfmt_autosave = 1

set autowrite     " Automatically :write before running commands
set backspace=2   " Backspace deletes like most programs in insert mode
set expandtab
set foldmethod=indent
set history=50
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set mouse=a
set nobackup
set nofoldenable
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set nowritebackup
set number
set numberwidth=5
set regexpengine=1
set ruler         " show the cursor position all the time
set shiftround
set shiftwidth=2
set showcmd       " display incomplete commands
set splitbelow
set splitright
set tabstop=2
set ttyfast
set clipboard=unnamed
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set list

if !exists(":YankCurrentFilePath")
  command YankCurrentFilePath let @+ = expand("%")
endif


map <Leader>fmt :call LanguageClient#textDocument_formatting()<CR>
map <Leader>rd :redraw!<CR>
map <Leader>s :call RunNearestSpec()<CR>
nmap <Leader>hh :noh <CR>
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <Leader>al :call RunAllSpecs()<CR>
nnoremap <Leader>hs :split <CR> 
nnoremap <Leader>vs :vsplit <CR> 
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Down> :echoe "Use j" <CR> 
nnoremap <Up> :echoe "Use k"<CR> 
nnoremap <Right> :echoe "Use l"<CR>
nnoremap W :w<CR>
nnoremap fb :e# <CR> 
nnoremap rcs :call RunCurrentSpecFile()<CR>
nnoremap rls :call RunLastSpec()<CR>
nnoremap yfp :YankCurrentFilePath<CR>
nnoremap zq :wq<CR>
vnoremap <C-c> "+y
autocmd StdinReadPre * let s:std_in=1
au InsertLeave * set nopaste

set number

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,elixir,rust,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()


set hidden
" to make eli-ls work, visit these pages:
" https://github.com/JakeBecker/elixir-ls and 
" https://github.com/autozimu/LanguageClient-neovim/issues/234
" To make it solargraph work, just run gem install solargraph
" See https://github.com/castwide/solargraph
let g:LanguageClient_serverCommands = {
      \ 'ruby': ['solargraph', 'stdio'],
      \ 'rust': ['~/.cargo/bin/rustup', 'run', 'nightly', 'rls'],
      \ 'elixir': ['eli-ls'] 
      \ }

let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['ex'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['exs'] = ''
let g:SuperTabDefaultCompletionType = "<c-n>"
if ('nvim')
  hi Search guibg=none guifg=none gui=underline
else
  " set Vim-specific sequences for RGB colors
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

nmap <leader>; A;<esc>
nmap <leader>sv :source $MYVIMRC<cr>
nmap <leader>ev :vsplit $MYVIMRC<cr>

nmap <C-]> :bnext<CR>
nmap <C-[> :bprev<CR>

" copy file path
nmap cp :let @*=expand("%")<CR>
nmap clp :let @*=expand("%:p")<CR>

nmap <Leader>vs :vsplit <CR> 
nmap <Leader>hs :split <CR> 
map <Leader>r :redraw!<CR>


""""""""""""
" NERDTree 
""""""""""""
" enable line numbers
let NERDTreeShowLineNumbers=0
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal nonumber
" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-B> :NERDTreeToggle<CR>

"""""""""""""
" Commenter "
"""""""""""""
let g:NERDSpaceDelims = 1

""""""""""""""
" Move block "
""""""""""""""
let g:move_key_modifier = 'C'

""""""""""""""
" Open files "
""""""""""""""
map <C-p> :FZF<CR>


""""""""""""""""""""""
" Remove white space "
""""""""""""""""""""""
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,elixir,rust,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SWITCH BETWEEN TEST AND PRODUCTION CODE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! OpenTestAlternate()
  let new_file = AlternateForCurrentFile()
  exec ':e ' . new_file
endfunction
function! AlternateForCurrentFile()
  let current_file = expand("%")
  let new_file = current_file
  let in_spec = match(current_file, '^spec/') != -1
  let going_to_spec = !in_spec
  let in_app = match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<workers\>') != -1 || match(current_file, '\<views\>') != -1 || match(current_file, '\<helpers\>') != -1  || match(current_file, '\<services\>') != -1 || match(current_file, '\<graphql\>') != -1 
  if going_to_spec
    if in_app
      let new_file = substitute(new_file, '^app/', '', '')
    end
    let new_file = substitute(new_file, '\.e\?rb$', '_spec.rb', '')
    let new_file = 'spec/' . new_file
  else
    let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
    let new_file = substitute(new_file, '^spec/', '', '')
    if in_app
      let new_file = 'app/' . new_file
    end
  endif
  return new_file
endfunction
nmap <leader>. :call OpenTestAlternate()<cr>
