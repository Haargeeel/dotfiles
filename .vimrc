
" stuff on start
syntax enable
filetype plugin indent on
set number
set encoding=UTF-8
autocmd VimEnter * if !argc() | NERDTree | endif
autocmd VimEnter * wincmd p
autocmd VimEnter * highlight LineNr ctermfg=grey
" autocmd VimEnter * colorscheme beans
" autocmd VimEnter * colorscheme github

" Remove trailing whitespace while keeping cursor position
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
" autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" colorscheme
if has("gui_running")
  set guifont=Mensch:h14
  set antialias
  colorscheme solarized
  set background=light
else
  set guifont=Menlo:h12
  colorscheme default
endif

" tabs
set tabstop=2
set shiftwidth=2
set expandtab

set backspace=2

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
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0
" let g:syntastic_javascript_checkers = ['standard']

" jsx (react) stuff
let g:jsx_ext_required = 0

" set up control p
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_user_command = 'fd --type f --color=never "" %s'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|build'

" Make PowerLine appear if not split window
set laststatus=2

" set vim to chdir for each file
if exists('+autochdir')
  set autochdir
else
  autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
endif

" style the indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=lightgray ctermbg=233
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgray  ctermbg=234

" ***************************
" **********mapping**********
" ***************************
let mapleader = ","

" sudo save this file
cnoremap sudow w !sudo tee % >/dev/null

" use jj instead of ESC
imap jj <esc>

" jump on the tab on the left
" nmap <left> :tabprevious<RETURN>
" jump on the pane on the left
nmap <left> <C-w>W

" jump to the tab on the right
" nmap <right> :tabnext<RETURN>
" jump to the pane on the right
nmap <right> <C-w>w

" jump on the tab on the left
nmap <c-h> :tabprevious<RETURN>

" jump to the tab on the right
nmap <c-l> :tabnext<RETURN>

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

" open same file again in a second pane
nmap <leader>hs :split<RETURN>

" yank whole file
nmap <leader>y :%y<RETURN>

" shortcut for console.log()
imap <leader>c console.log()<ESC>i

" shortcut for util-inspect
vmap <leader>in ysrequire('util').inspect(<ESC>pea, { depth: null })<ESC>

" copy selected text into clipboard
vmap <leader>p :w !pbcopy<RETURN><RETURN>

" copy previous selected text again to the default register
nmap <leader>p pgvy

" clear search highlighting
nmap <silent> <leader>/ :noh<RETURN>

" reverse shift j for comma seperated stuff
nmap <S-k> f,a<RETURN><ESC>

" super nervige shift k stoppen - BEST MAPPING EVER!
vmap <S-k> <Nop>

" insert normal tab when pressing shift tab
inoremap <S-Tab> <C-V><Tab>

" visual shifting (does not exit Visual Mode)
vnoremap < <gv
vnoremap > >gv

" find and jump
nmap <leader>f <leader><leader>s

" react automatically add bind on class functions
nmap <leader>bind 0wvey/super(<RETURN>othis.<ESC>pa = this.<ESC>pa.bind(this)<ESC>,/

" configure todo
nmap <leader>todo :setf markdown<RETURN>:Goyo<RETURN>

" activate folding
nmap <leader>z :set foldmethod=syntax<RETURN>

" transform a React functional component to a Component class
nmap <leader>cast /import React<RETURN>wea, { Component }<ESC>/export default<RETURN>vf(sconst <ESC>f)C = this.props<ESC>Oclass <C-R>%<ESC>vbhs extends Component {<RETURN>render () {<ESC>/this.props<RETURN>oreturn<ESC>JGo}<RETURN>}<RETURN><ESC>Goexport default <C-R>%<ESC>vbhxggVG=

" sort selected words alphabetically
vmap <leader>s :!xargs -n1 \| sort \| xargs<RETURN>

" save swap files in a special directory
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" Latex stuff
" Goyo gives the page a clean style goyo.vim
" limelight highlights the paragraph your cursor is on limelight.vim
" LaTeX-Box does the heavy shit
" nmap <leader>master <ESC>:Goyo<RETURN>:Limelight<RETURN>:colorscheme solarized<RETURN>:Latexmk<RETURN>
" let g:LatexBox_split_type="new"
" let g:LatexBox_latexmk_async=1
" let g:LatexBox_latexmk_preview_continuously=1
" let g:LatexBox_viewer = "open -a Skim"
" let g:LatexBox_latexmk_options = "-pvc"
" let g:LatexBox_quickfix=0
" imap <leader>e \emph{}<ESC>i
" imap <leader>t {\ttfamily }<ESC>i
" nmap <leader>m <ESC>:LatexTOCToggle<RETURN>
" imap <leader>m <ESC>:LatexTOCToggle<RETURN>
" nmap <leader>ag :Goyo<RETURN>
" nmap <leader>al :Limelight<RETURN>
" nmap <leader>as :colorscheme solarized<RETURN>
" nmap <leader>am :Latexmk<RETURN>
" let g:syntastic_ignore_files=['\.tex$']
" let g:tq_enabled_backends=["woxikon_de"]
" let g:tq_language=['de']

" setup pathogen to manage your plugins
call pathogen#infect()
