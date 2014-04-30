" BWDA
set nocompatible
set clipboard=unnamedplus

execute pathogen#infect()
filetype plugin indent on

"#colorscheme solarized
colorscheme ron

au BufWritePost * :FixWhitespace
syntax on

set noswapfile

set number
set expandtab
set tabstop=2
set shiftwidth=2

"set background=dark
set background=light
let g:Powerline_theme='short'
let g:Powerline_colorscheme='solarized256_light'
colorscheme Tomorrow-Night-Eighties
set list

" Core Shortcuts
map <C-n> :NERDTreeToggle<CR>

" Tab Management
noremap <Home> :tabprevious<CR>
noremap <End> :tabnext<CR>
noremap <C-S-v> <C-v>

let g:session_autosave = 'yes'
let g:vim_markdown_folding_disabled=1

nnoremap <leader>. :CtrlPTag<cr>

function SmoothScroll(up)
  if a:up
    let scrollaction="^Y"
  else
    let scrollaction="^E"
  endif
  exec "normal " . scrollaction
  redraw
  let counter=1
  while counter<&scroll
    let counter+=1
    sleep 10m
    redraw
    exec "normal " . scrollaction
  endwhile
endfunction

nnoremap <C-U> :call SmoothScroll(1)<Enter>
nnoremap <C-S> :call SmoothScroll(0)<Enter>
inoremap <C-U> <Esc>:call SmoothScroll(1)<Enter>i
inoremap <C-D> <Esc>:call SmoothScroll(0)<Enter>i
