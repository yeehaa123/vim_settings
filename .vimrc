set runtimepath^=~/.vim/bundle/ctrlp.vim

set re=1

set nocompatible                  " Must come first because it changes other options.
set nocp
call pathogen#infect()

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

runtime macros/matchit.vim        " Load the matchit plugin.

let mapleader = "\\"
let maplocalleader = ","
nnoremap <leader>v :tabedit $MYVIMRC<CR>

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.

set showmatch
set matchtime=1

set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

set ts=2 sts=2 sw=2 expandtab                    " Use spaces instead of tabs

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

command! -nargs=* Wrap set wrap linebreak nolist

" Or use vividchalk
set background=light
colorscheme solarized

set foldmethod=syntax
set foldnestmax=5

iabbrev adn and
iabbrev @@ yeehaa@codingthehumanities.com
iabbrev cdh http://codingthehumanities.com

inoremap <Tab> <C-N>
inoremap jj <esc>
inoremap <esc> <nop>
inoremap <c-d> <esc>ddi
inoremap <c-u> <esc>viwUi

noremap <space> viw

nnoremap L $
nnoremap H 0

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Down> ]egv
vmap <C-Up> [egv

" Tab mappings.
" mappings
noremap <leader>te :tabedit
noremap <leader>tt :tabnew<cr>
noremap <leader>r :register<cr>
noremap <leader>tc :tabclose<cr>
noremap <leader>to :tabonly<cr>
noremap <leader>tn :tabnext<cr>
noremap <leader>tp :tabprevious<cr>
noremap <leader>tf :tabfirst<cr>
noremap <leader>tl :tablast<cr>
noremap <leader>tm :tabmove
inoremap <C-s> <esc>:w<CR>
nnoremap <silent> <leader>d <Plug>DashSearch


nnoremap <F1> :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
inoremap <F1> <Esc>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
nnoremap <F2> :.w !pbcopy<CR><CR>
vnoremap <F2> :w !pbcopy<CR><CR>
nnoremap <F6> :GundoToggle<CR>

" XMP filter - terminal
nnoremap <buffer> <F5> <Plug>(xmpfilter-run)
xnoremap <buffer> <F5> <Plug>(xmpfilter-run)
inoremap <buffer> <F5> <Plug>(xmpfilter-run)

nnoremap <buffer> <F4> <Plug>(xmpfilter-mark)
xnoremap <buffer> <F4> <Plug>(xmpfilter-mark)

inoremap <buffer> <F4> <Plug>(xmpfilter-mark)


" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction

function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction

augroup auto_commands
  autocmd BufEnter * exe "normal zR"
  " autocmd BufWritePre,BufRead *.rb :normal gg=G
  autocmd BufNewFile,BufRead *_spec.rb compiler rspec
  autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
augroup END

if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

set directory+=,~/tmp,$TMP
