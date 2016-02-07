set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

execute pathogen#infect()

set diffexpr=MyDiff()

function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

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

" Enable syntax highlighting
syntax enable

" Text, tab and Indent related
set expandtab
set smarttab

"making tab = 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set showcmd "show command in bottom bar

set cursorline "highlight current line

set lazyredraw "redraw only when we need to

set foldenable "enable folding
set foldlevelstart=10 "open most folds by default
set foldnestmax=10 "10 nested folds max
set foldmethod=indent "fold based on indent level

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

filetype plugin on
set omnifunc=syntaxcomplete#Complete

let g:neocomplete#enable_at_startup = 1

" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

"Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

let g:used_javascript_libs = 'jquery, angularjs, angularui, angularuirouter, react, flux, jasmine'

 if has("autocmd") && exists("+omnifunc") 
autocmd Filetype * 
    \	if &omnifunc == "" | 
    \	setlocal omnifunc=syntaxcomplete#Complete | 
    \	endif 
    endif 



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Key Mappings

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"make jk the hotkey to return to normal mode"
inoremap jk <Esc>

" Cntl + S to save in normal and insert mode"
nnoremap <leader>ww :w<CR>
inoremap <leader>ww <Esc>:w<CR>

"Add ; to end of line in normal and insert mode"
inoremap <leader>; <Esc><S-A>;
nnoremap <leader>; <S-A>;<Esc>
"Add ; to end of the line then move back a char
inoremap a; <Esc><S-A>;<Esc>hi{<CR>}<Esc>O
inoremap i{ <Esc>A{<CR>}<Esc>O
inoremap I{ <Esc>A{<CR>}<Esc>O

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" Autocompleting brackets and quotes
inoremap { {<CR>}<Esc>O
" Angular Expression keymap
inoremap N{ {{}}<Esc>hi
inoremap ( ()<Esc>:let leavechar=")"<CR>i
inoremap [ []<Esc>:let leavechar="]"<CR>i
inoremap ' ''<Esc>:let leavechar="'"<CR>i
inoremap " ""<Esc>:let leavechar="""<CR>i

" Jump to outside brackets or quotes
imap JO <Esc>:exec "normal f" . leavechar<CR>a

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
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

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

