set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

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

" Set the colorscheme
colorscheme default
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Key Mappings

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"make jk the hotkey to return to normal mode"
inoremap jk <Esc>

" Cntl + S to save in normal and insert mode"
nnoremap <C-S> :w<CR>
inoremap <C-S> <Esc>:w<CR>

"Ensure holding shift down too long and getting capital Q on file exit
"Doesnt make me want to kill babies
nnoremap :Q :q

"Add ; to end of line in normal and insert mode"
inoremap <leader>; <Esc><S-A>;
nnoremap <leader>; <S-A>;<Esc>

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" Autocompleting brackets and quotes
inoremap { {<CR>}<Esc>ko
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i

" Creating and moving in Splits
nnoremap <leader>ws <C-w>s
nnoremap <leader>wv <C-w>v
nnoremap <leader>ww <C-w>w
nnoremap <leader>wq <C-w>q

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

"quickly enter vim commands
inoremap <leader>jk <Esc>:

"auto edit vimrc
nnoremap <leader>vim :e $MYVIMRC<CR>

"Mapping tab to be emmet expander key"
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
