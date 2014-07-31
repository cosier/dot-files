" BWDA
set nocompatible
set clipboard=unnamedplus

execute pathogen#infect()
filetype plugin indent on
filetype indent plugin on

"Special Filetype case handling
"au FileType javascript call JavaScriptFold()

colorscheme solarized

au BufWritePost * :FixWhitespace
syntax on

set noswapfile
set autoindent
set smartindent

set number
set expandtab
set tabstop=2
set shiftwidth=2
set autoread

set background=dark
"set background=light
let g:Powerline_theme='short'
"let g:Powerline_colorscheme='solarized256_light'
let g:Powerline_colorscheme='solarized256_dark'

set list

" Core Shortcuts
map <leader>n :NERDTreeToggle<CR>

" Tab Management
noremap <C-n>   :tabnext<CR>
noremap <C-h>   :tabprevious<CR>
noremap <C-t>   :tabnew<CR>
"noremap <C-S-v> <C-v>

" File Management
noremap <C-f> :NERDTreeFind<CR>
noremap <C-p>c :CtrlPClearCache<CR>

" Movement
imap <C-e> <END>
nmap <C-e> <ESC>i<END>
imap <C-a> <HOME>
nmap <C-a  <ESC>i<HOME>

imap <C-j> <ESC>ji
imap <C-k> <ESC>ki
imap <C-l> <ESC>li
imap <C-h> <ESC>hi

noremap <C-Z> <ESC>:ZoomWin<CR>

" History Management
noremap <leader>a <ESC>:undo<CR>
noremap <leader>r <ESC>:redo<CR>

" File saving
nmap <C-x><C-s> <ESC>:w<CR>
imap <C-x><C-s> <ESC>:w<CR>
noremap <C-r><C-r> :source ~/.vimrc<CR>

" CtrlP Configuration
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules     " MacOSX/Linux

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

let g:session_autosave = 'yes'
let g:vim_markdown_folding_disabled=1

nnoremap <leader>. :CtrlP<cr>

" Custom Theming
hi Folded ctermbg=232
hi Folded ctermfg=244

hi SignColumn ctermbg=black
hi SignColumn ctermfg=white
hi GitGutterAdd          ctermbg=black
hi GitGutterChange       ctermbg=black
hi GitGutterDelete       ctermbg=black
hi GitGutterChangeDelete ctermbg=black

let g:gitgutter_highlight_lines = 1

