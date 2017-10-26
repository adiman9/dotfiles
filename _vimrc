"    git clone https://github.com/tpope/vim-commentary 
"    git clone https://github.com/othree/javascript-libraries-syntax.vim 
"    git clone https://github.com/tpope/vim-surround 
"    git clone https://github.com/pangloss/vim-javascript
"

set nocompatible
filetype off  

"execute pathogen#infect()

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-fugitive'
" Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'mattn/emmet-vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-syntastic/syntastic'
Plugin 'christoomey/vim-tmux-navigator'    
Plugin 'tpope/vim-commentary'
Plugin 'ervandew/supertab'
Plugin 'SirVer/ultisnips'
Plugin 'leafgarland/typescript-vim'
Plugin 'mustache/vim-mustache-handlebars'
" Plugin 'wookiehangover/jshint.vim'
Plugin 'Valloric/YouCompleteMe'

" Plugin 'prabirshrestha/asyncomplete.vim'
" Plugin 'prabirshrestha/async.vim'
" Plugin 'prabirshrestha/vim-lsp'
" Plugin 'prabirshrestha/asyncomplete-lsp.vim'
" Plugin 'yami-beta/asyncomplete-omni.vim'
" Plugin 'runoshun/tscompletejob'
" Plugin 'prabirshrestha/asyncomplete-tscompletejob.vim'

call vundle#end()  
filetype plugin indent on

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Consolas 8
  elseif has("gui_photon")
    set guifont=Consolas:s8
  elseif has("gui_kde")
    set guifont=Consolas/8/-1/5/50/0/0/0/1/0
  elseif has("x11")
    set guifont=-*-courier-medium-r-normal-*-*-180-*-*-m-*-*
  else
    set guifont=Consolas:h8:cDEFAULT
  endif
endif

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:SuperTabDefaultCompletionType = '<C-j>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""    START CUSTOM SETTINGS

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader=" "

set t_Co=256
" Set the colorscheme
colorscheme mopkai
highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=white guibg=NONE guifg=white

" Set the hybrid numbering system. Shows absolute number of current line plus
" relative numbers of all other lines.
set relativenumber
set number

highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" Enable syntax highlighting
syntax enable

let g:UltiSnipsEditSplit="vertical"

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

"Enable yanking to system clipboard
"set clipboard=unnamedplus

" Text, tab and Indent related
set expandtab
set smarttab

"making tab = 2 spaces
set shiftwidth=2
set tabstop=2
set softtabstop=2

" setting mapping delay and keycode delay respectively
set timeoutlen=500 ttimeoutlen=0

" Linebreak on 500 characters
set lbr
set tw=500

set showcmd "show command in bottom bar

set cursorline "highlight current line

set lazyredraw "redraw only when we need to

set foldenable "enable folding
set foldlevelstart=10 "open most folds by default
set foldnestmax=10 "10 nested folds max
set foldmethod=syntax "fold based on indent level

set ai "auto indent
set si "smart indent
set wrap "Wrap lines

"set backspace to work as it should
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_typescript_checkers = ['tslint']
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]

" filetype plugin on
set omnifunc=syntaxcomplete#Complete

"Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Javascript formatting using Prettier
autocmd FileType javascript set formatprg=prettier\ --stdin

let g:used_javascript_libs = 'jquery, angularjs, angularui, angularuirouter, react, flux, jasmine'

 if has("autocmd") && exists("+omnifunc") 
autocmd Filetype * 
    \	if &omnifunc == "" | 
    \	setlocal omnifunc=syntaxcomplete#Complete | 
    \	endif 
    endif 


autocmd StdinReadPre * let s:std_in=1
autocmd vimenter * NERDTree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

let g:airline#extensions#tabline#enabled = 1


command! Maketags !ctags -R --exclude=.git --exclude=node_modules

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Key Mappings

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"inoremap i{ <Esc>A{<CR>}<Esc>O
"inoremap I{ <Esc>A{<CR>}<Esc>O
"
" Autocompleting brackets and quotes
"inoremap { {<CR>}<Esc>O
" Angular Expression keymap
"inoremap N{ {{}}<Esc>hi
"inoremap ( ()<Esc>:let leavechar=")"<CR>i
"inoremap [ []<Esc>:let leavechar="]"<CR>i
"inoremap ' ''<Esc>:let leavechar="'"<CR>i
"inoremap " ""<Esc>:let leavechar="""<CR>i

" Jump to outside brackets or quotes
"imap JO <Esc>:exec "normal f" . leavechar<CR>a

"noremap a; <Esc><S-A>;<Esc>hi{<CR>}<Esc>O






nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprev<CR>
nnoremap <leader>bq :bp<bar>sp<bar>bn<bar>bd<CR>


"make jk the hotkey to return to normal mode"
inoremap jk <Esc>

" Cntl + S to save in normal and insert mode"
nnoremap <leader>ww :w<CR>
inoremap <leader>ww <Esc>:w<CR>

"Add ; to end of line in normal and insert mode"
inoremap <leader>; <Esc><S-A>;
nnoremap <leader>; <S-A>;<Esc>
"Add ; to end of the line then move back a char

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" Quicker window movement
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>h <C-w>h
nnoremap <leader>l <C-w>l

"quickly enter vim commands
inoremap <leader>jk <Esc>:
inoremap <leader>JK <Esc>:

"auto edit vimrc
nnoremap <leader>vim :e $MYVIMRC<CR>

"Easy close
nnoremap <leader>q :q<CR>
nnoremap <leader><leader>q :q!<CR>

"open new file easily
nnoremap <leader>o :e<space>

"open new file in splits
nnoremap <leader>v :vsplit<space>
nnoremap <leader>s :split<space>

"Mapping tab to be emmet expander key"
" imap <expr> <C-u> emmet#expandAbbrIntelligent("\<C-u>")
imap q<tab> <C-y>,

let g:EasyMotion_do_mapping = 0 " Disable default mappings

nmap s <Plug>(easymotion-overwin-f)
nmap s <Plug>(easymotion-overwin-f2)

let g:EasyMotion_smartcase = 1

map <leader><leader>j <Plug>(easymotion-j)
map <leader><leader>k <Plug>(easymotion-k)

" enabling key map to allow cntl+c/v copy pasting
vnoremap <C-c> "+y
vnoremap <C-c><C-c> "+yy
inoremap <C-v> <Esc>"+p
nnoremap <C-v> "+p

"commenting
nmap <C-_> gcc
nmap co gc

" Fugitive Shortcuts
"""""""""""""""""""""""""""""""""""""
nmap <silent> <leader>gs :Gstatus<cr>
nmap <leader>df :Gdiff<cr>
"nmap <silent><leader>gr :Gread<cr>
nmap <silent><leader>gb :Gblame<cr>

inoremap <C-p><leader> :b<space>
nnoremap <C-p><leader> :b<space>
inoremap <C-p>v :vsplit<CR>:b<space>
nnoremap <C-p>v :vsplit<CR>:b<space>
