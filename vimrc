set nocompatible 

" easier leader, default is \
let mapleader=","

" sane backspace (forgot what it does otherwise)
set backspace=indent,eol,start

" Create no temporary files
set nobackup
set nowritebackup
set directory=/tmp/
set noswapfile

" Allow buffers to be hidden with unsaved changes
set hidden  

" Enable syntax highlighting
syntax on  

" Allow cursor to go to invalid places (good idea?)
set virtualedit=all   

" default tabs settings
set ts=4 sts=4 sw=2 expandtab

" keep a buffer of some lines at the bottom and top of the window
set scrolloff=4

" show the current mode and command and cursor coordinates
set showmode
set showcmd
set ruler

" always split to the right of the current window or below it
set splitright
set splitbelow

" Don't jump to first character when paging
set nostartofline

" highlight current cursor position
set cursorline
"set cursorccolumn

" show line numbers
set number

" sane movement with wrap enabled
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Make Control key and a direction switch between windows (like C-W h, etc) (use zoom instead of meta key and a direction to focus)
nmap <silent> <C-k> <C-W><C-k>
nmap <silent> <C-j> <C-W><C-j>
nmap <silent> <C-h> <C-W><C-h>
nmap <silent> <C-l> <C-W><C-l>
" used to use these, might change back
"map <C-h> <C-w>h
"map <C-j> <C-w>j
"map <C-k> <C-w>k
"map <C-l> <C-w>l

" Easier escaping
imap jj <Esc>

" Easier horizontal scrolling
nmap <silent> <C-o> 10zl
nmap <silent> <C-i> 10zh

" Training, might want to do same with hjkl if I don't pick up easy motion fast enough
inoremap <Left> <NOP>
inoremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>

" Easier (for me) indentation for lines in visual mode
vmap <S-TAB> <gv
vmap <TAB> >gv

" Search config (incremental, highlight as we go, ignore case)
set hlsearch
set incsearch
set ignorecase
set smartcase

" turn off wrap
set nowrap

" clear currently highlighted items easily
nmap <silent> <leader>n :set invhls<CR>:set hls?<CR>

" Make command completion better
set wildmode=longest,list,full
set wildmenu

" Toggle view of list characters
set nolist
set listchars=tab:\ ·,eol:¬
set listchars+=trail:·
set listchars+=extends:»,precedes:«
map <silent> <F12> :set invlist<CR>

" Easy editing of vimrc
nnoremap <leader>re :e ~/.vim/vimrc<CR>

" Emacs style saving in vim
noremap <C-x><C-s> :update<CR>
vnoremap <C-x><C-s> <C-C>:update<CR>
inoremap <C-x><C-s> <C-O>:update<CR>

" Quickly turn on linewrapping (http://vimcasts.org/episodes/soft-wrapping-text/)
command! -nargs=* Wrap set wrap linebreak nolist
            
" Easier new tabs
nnoremap <C-n> :tabnew<CR>

" Toggle back and forth to last open file / position (might use LEADER LEADER for easy motion instead)
" TODO


" Dependencies
"-----------------------------------------------------------------------------
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Motion commands without the numbers
Bundle 'Lokaltog/vim-easymotion'
let g:EasyMotion_leader_key='<LocalLeader>'

" Colour scheme, font, chrome
Bundle 'altercation/vim-colors-solarized'
if has("gui_running")
	"set guioptions=cMg " nothing
	set guioptions-=T " remove icon bar
	colorscheme solarized
	set background=dark
	set guifont=Liberation\ Mono:h12
end

" Focus on the current window temporarily
Bundle 'ZoomWin'
noremap <leader>o :ZoomWin<CR>
vnoremap <leader>o <C-C>:ZoomWin<CR>
inoremap <leader>o <C-O>:ZoomWin<CR>

" bufexplorer

" ack

Bundle 'kien/ctrlp.vim'
let g:ctrlp_max_height = 30
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height = 20
let g:ctrlp_match_window_reversed = 1
let g:ctrlp_switch_buffer = 'e'
" <f5> clear cache
" <c-f> <c-b> change mode (mru, buffers, files)
" <c-d> toggle filename / path matching
" <c-y> create file
" <c-z> to mark files and <c-o> to open them
" <Enter> to MRU in normal mode

" Better file explorer
Bundle 'scrooloose/nerdtree'
" Allows you to type `rs` on a node to start serving railo from that directory
Bundle 'oscarduignan/vim-nerdtree-serve-railo'
let NERDTreeQuitOnOpen=1
let NERDTreeShowBookmarks=1
" https://gist.github.com/scrooloose/4989844
function! NERDTreeFindOrToggle()
    if nerdtree#treeExistsForTab() && nerdtree#isTreeOpen()
        NERDTreeToggle
    else
        NERDTreeFind
    endif
endfunction
nnoremap <leader>d :call NERDTreeFindOrToggle()<CR>
nnoremap <leader>b :NERDTreeFromBookmark 

" surround

" matchit (what are macros?)

" CFML-10-Vim or whatever is best (need to experiment)

" Moving lines around easier (org-mode style)
Bundle 'tpope/vim-unimpaired'
nmap <S-Up> [e
nmap <S-Down> ]e
vmap <S-Up> [egv
vmap <S-Down> ]egv


if has("autocmd")
  " This is probably in your .vimrc already. No need to duplicate!
  filetype plugin indent on
 
  " Set File type to 'text' for files ending in .txt
  autocmd BufNewFile,BufRead *.txt setfiletype text
 
  " Enable soft-wrapping for text files
  autocmd FileType text,markdown,html setlocal wrap linebreak nolist autoindent
endif


" stuff to go through below
" ----------------------------------------------------------------------------

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
"map <Leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
"map <Leader>s :split <C-R>=expand("%:p:h") . '/'<CR>
"map <Leader>v :vnew <C-R>=expand("%:p:h") . '/'<CR>


" Indent Guides( doesn't work!?)
"Bundle 'Indent-Guides'
"let g:indent_guides_guide_size = 1
