
" stuff on start
syntax enable
filetype plugin indent on
set number
autocmd VimEnter * if !argc() | NERDTree | endif
autocmd VimEnter * wincmd p
autocmd VimEnter * highlight LineNr ctermfg=grey
" autocmd VimEnter * colorscheme beans
" autocmd VimEnter * colorscheme github

" colorscheme
set guifont=Menlo:h12
"colorscheme solarized

" tabs
set tabstop=2
set shiftwidth=2
set expandtab

" 80 lines
set colorcolumn=80
highlight ColorColumn ctermbg=red guibg=lightgrey

" for vertical split, with the pipe dividers hidden
:hi clear vertsplit
:hi vertsplit ctermbg=grey ctermfg=grey

set scrolloff=10
set hlsearch
set incsearch
set ic

" nerdcommenter
let g:NERDSpaceDelims = 1

" syntastic stuff
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
" let g:syntastic_javascript_checkers = ['standard']

" jsx (react) stuff
let g:jsx_ext_required = 0

" set up control p
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|build'

" Make PowerLine appear if not split window
set laststatus=2

" set vim to chdir for each file
if exists('+autochdir')
  set autochdir
else
  autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
endif

" ***************************
" **********mapping**********
" ***************************
let mapleader = ","

" use jj instead of ESC
imap jj <esc>

" jump on the pane on the left
nmap <left> <C-w>W

" jump to the pane on the right
nmap <right> <C-w>w

" scroll 5 lines up
nmap <up> 5<C-y>

" scroll 5 lines down
nmap <down> 5<C-e>

" jump on the pane on the left
nmap <S-h> <C-w>W

" jump to the pane on the right
nmap <S-l> <C-w>w

" open nerdtree
nmap <leader>n :NERDTree<RETURN>

" open last open file from this pane
nmap <leader>g :e#<RETURN>

" open same file again in a second pane
nmap <leader>vs :vsplit<RETURN>

" yank whole file
nmap <leader>y :%y<RETURN>

" shortcut for console.log()
imap <leader>c console.log()<ESC>i

" copy selected text into clipboard
vmap <leader>p :w !pbcopy<RETURN><RETURN>

" clear search highlighting
nmap <leader>/ :noh<RETURN>

" reverse shift j for comma seperated stuff
nmap <S-k> f,a<RETURN><ESC>

" super nervige shift k stoppen - BEST MAPPING EVER!
vmap <S-k> <Nop>

" insert normal tab when pressing shift tab
inoremap <S-Tab> <C-V><Tab>

" visual shifting (does not exit Visual Mode)
vnoremap < <gv
vnoremap > >gv

" react automatically add bind on class functions
nmap <leader>bind 0wvey/super(props)<RETURN>othis.<ESC>pa = this.<ESC>pa.bind(this)<ESC>,/

" save swap files in a special directory
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" Latex break in case of emergency
"let g:LatexBox_latexmk_async=1
"let g:LatexBox_latexmk_preview_continuously=1
"let g:LatexBox_viewer = "open -a Skim"
"let g:LatexBox_latexmk_options = "-pvc"
"let g:LatexBox_quickfix=2
"let g:LatexBox_quickfix=3
"imap <leader>e \emph{}<ESC>i
"imap <leader>t {\ttfamily }<ESC>i
"nmap <leader>m <ESC>:LatexTOCToggle<RETURN>
"imap <leader>m <ESC>:LatexTOCToggle<RETURN>

" setup pathogen to manage your plugins
call pathogen#infect()
