call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'terryma/vim-multiple-cursors'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
Plug 'roxma/nvim-completion-manager'
Plug 'w0rp/ale'
Plug 'cohama/lexima.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ap/vim-buftabline'
Plug 'ngmy/vim-rubocop'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'jgdavey/vim-blockle'
Plug 'matze/vim-move'
Plug 'mhinz/vim-mix-format'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'airblade/vim-gitgutter' 
Plug 'tpope/vim-dispatch'
Plug 'nazo/pt.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'ervandew/supertab'
Plug 'roxma/nvim-yarp'
call plug#end()

colorscheme gruvbox
set background=dark

set hidden

set number
set relativenumber
set termguicolors

set mouse=a

set inccommand=split
set clipboard=unnamed

set expandtab
set shiftwidth=2

let mapleader="\<space>"

nmap <leader>; A;<esc>
nmap <leader>sv :source $MYVIMRC<cr>
nmap <leader>ev :vsplit $MYVIMRC<cr>
nmap <c-F> :Pt<space>

let g:python3_host_prog = '/usr/local/bin/python3'
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir = '~/.config/nvim/UltiSnips'

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
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set list

" copy file path
nmap cp :let @*=expand("%")<CR>
nmap clp :let @*=expand("%:p")<CR>

let g:rspec_command = "Dispatch bin/rspec {spec}"

nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-L> <C-W><C-L>
nmap <C-H> <C-W><C-H>

nmap <C-]> :bnext<CR>
nmap <C-[> :bprev<CR>

set termguicolors

let g:airline_theme='oceanicnext'
let g:airline_theme='dark'
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
let g:airline_skip_empty_sections = 1
let g:airline_section_b = '%{airline#util#wrap(airline#extensions#branch#get_head(),0)}'
let g:airline_section_z = ''
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline#extensions#wordcount#formatter#default#fmt = '%d w'
let g:blockle_mapping = ''

map <Leader>r :redraw!<CR>
map <Leader>s :call RunNearestSpec()<CR>
nmap <Leader>hh :noh <CR>
nmap <Leader>== gg=G
nmap <Leader>vs :vsplit <CR> 
nmap <Leader>hs :split <CR> 
nmap rcs :call RunCurrentSpecFile()<CR>
nmap rls :call RunLastSpec()<CR>
nmap <Leader>al :call RunAllSpecs()<CR>
nmap zq :wq<CR>
nmap W :w<CR>

""""""""""""
" Complete " 
""""""""""""
" " enable ncm2 for all buffers
" autocmd BufEnter * call ncm2#enable_for_buffer()
" " IMPORTANTE: :help Ncm2PopupOpen for more information
" set completeopt=noinsert,menuone,noselect"
" " suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" " found' messages
" set shortmess+=c

" " CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
" inoremap <c-c> <ESC>

" " When the <Enter> key is pressed while the popup menu is visible, it only
" " hides the menu. Use this mapping to close the menu and also start a new
" " line.
" inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" " Use <TAB> to select the popup menu:
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" " wrap existing omnifunc
" " Note that omnifunc does not run in background and may probably block the
" " editor. If you don't want to be blocked by omnifunc too often, you could
" " add 180ms delay before the omni wrapper:
" "  'on_complete': ['ncm2#on_complete#delay', 180,
" "               \ 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
" au User Ncm2Plugin call ncm2#register_source({
        " \ 'name' : 'css',
        " \ 'priority': 9, 
        " \ 'subscope_enable': 1,
        " \ 'scope': ['css','scss'],
        " \ 'mark': 'css',
        " \ 'word_pattern': '[\w\-]+',
        " \ 'complete_pattern': ':\s*',
        " \ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
        " \ })

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

"""""""""
" Elixir "
""""""""""
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['ex'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['exs'] = ''
let g:mix_format_silent_errors = 1
let g:mix_format_on_save = 1

""""""""""""""""""""""
" Remove white space "
""""""""""""""""""""""
let g:SuperTabDefaultCompletionType = "<C-n>"

""""""""""""""""""""""""""""
" Disable search highlight "
""""""""""""""""""""""""""""
highlight Search guibg=none guifg=none gui=underline

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

