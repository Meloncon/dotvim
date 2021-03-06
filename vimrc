filetype off

"Packages
packadd minpac
call minpac#init()
call minpac#add('https://github.com/tpope/vim-rails.git')
call minpac#add('https://github.com/tpope/vim-fugitive.git')
call minpac#add('https://github.com/tpope/vim-surround.git')
call minpac#add('https://github.com/tpope/vim-unimpaired.git')
call minpac#add('https://github.com/scrooloose/nerdtree.git')
call minpac#add('https://github.com/Xuyuanp/nerdtree-git-plugin.git')
call minpac#add('https://github.com/ctrlpvim/ctrlp.vim.git')
call minpac#add('https://github.com/mileszs/ack.vim.git')
"call minpac#add('https://github.com/maralla/completor.vim.git')
call minpac#add('https://github.com/SirVer/ultisnips.git')
call minpac#add('https://github.com/honza/vim-snippets.git')
call minpac#add('https://github.com/godlygeek/tabular.git')
call minpac#add('https://github.com/Raimondi/delimitMate.git') "Might be able to replace this with Coc plugin
call minpac#add('https://github.com/mattn/emmet-vim.git')
call minpac#add('https://github.com/rust-lang/rust.vim.git')
call minpac#add('https://github.com/xolox/vim-misc.git')
call minpac#add('https://github.com/xolox/vim-session.git')
call minpac#add('https://github.com/vimwiki/vimwiki')
call minpac#add('https://github.com/kchmck/vim-coffee-script.git')
call minpac#add('https://github.com/scrooloose/nerdcommenter.git')
call minpac#add('https://github.com/zah/nim.vim.git')
call minpac#add('https://github.com/rhysd/vim-crystal.git')
call minpac#add('https://github.com/vim-airline/vim-airline.git')
call minpac#add('https://github.com/vim-airline/vim-airline-themes.git')
call minpac#add('https://github.com/tyrannicaltoucan/vim-quantum.git')
"call minpac#add('https://github.com/lcolaholicl/vim-v.git')
"call minpac#add('https://github.com/arrufat/vala.vim.git')
"call minpac#add('https://github.com/cespare/vim-toml.git')
"call minpac#add('https://github.com/vim-syntastic/syntastic.git')
call minpac#add('https://github.com/nvie/vim-flake8.git')
call minpac#add('https://github.com/PieterjanMontens/vim-pipenv')
"call minpac#add('https://github.com/pangloss/vim-javascript.git')
"call minpac#add('https://github.com/MaxMEllon/vim-jsx-pretty.git')
"call minpac#add('https://github.com/dense-analysis/ale.git')
call minpac#add('https://github.com/neoclide/coc.nvim.git')
call minpac#add('https://github.com/dart-lang/dart-vim-plugin')
call minpac#add('https://github.com/posva/vim-vue')
"call minpac#add('https://github.com/dracula/vim')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap Q !!sh<CR>

set nocompatible
filetype plugin indent on
syntax on
let mapleader = ","
set laststatus=2               "  Always show status line.
set linespace=0                "  No extra spaces between rows
set nu                         "  Line numbers on
set showmatch                  "  show matching brackets/parenthesis
set number                     "  Line numbers are good
set relativenumber             "  Setup relative line numbers
set backspace=indent,eol,start "  Allow backspace in insert mode
set history=10000              "  Store lots of :cmdline history
set hidden
set showcmd                    "  Show incomplete cmds down the bottom
set showmode                   "  Show current mode down the bottom
set autoread                   "  Reload files changed outside vim
set nowrap                     "  wrap long lines
set t_Co=256
set pastetoggle=<F12>          "  pastetoggle (sane indentation on pastes)
set novb                       "  Set the no visual bell to prevent flashing when saving"
autocmd FileType c,cpp,java,php,js,python,twig,xml,yml,coffee autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
set hlsearch                   " highlight matches
set incsearch                  " incremental searching
set ignorecase smartcase                 " searches are case insensitive...
set backupdir=~/.vim/tmp
set directory=~/.vim/tmp
set cursorline
set cmdheight=1
" Fix slow O inserts
set timeout timeoutlen=1000 ttimeoutlen=0
set nojoinspaces

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh())

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" :
" \<C-g>u\<CR>")

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" ================ Indentation ======================
set ts=2  " Tabs are 2 spaces
set bs=2  " Backspace over everything in insert mode
set shiftwidth=2  " Tabs under smart indent
set nocp incsearch
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr
set cindent
set autoindent
set smarttab
set expandtab

" ================ Folds ============================
set foldmethod=indent   "fold based on syntax
set foldnestmax=3       "deepest fold is 10 levels
set nofoldenable        "dont fold by default
" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Matt's Custom Settings
"set background=dark

" Enable true color 启用终端24位色
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set termguicolors
colorscheme quantum
"colorscheme dracula
set guifont=Fira\ Mono\ Medium\ 11

"colorscheme railscasts
"set guifont=Andale\ Mono\ 9

"This line is here to override the rails cast theme color for code folding...
"sucks as it's some horrible color
highlight Folded guifg=DarkGreen guibg=Black 
highlight Folded ctermbg=black
highlight Folded ctermfg=darkgrey
hi NonText ctermbg=none
hi Normal guibg=NONE ctermbg=NONE

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Copy & Paste
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set clipboard=unnamedplus
let NERDTreeMouseMode = 3

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Mappins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>sf <esc>:w<cr>
map <Leader>config <esc>:e ~/.ssh/config<cr>
map <Leader>qa <esc>:qa<cr>
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>
map <C-t> <esc>:tabnew<CR>
nmap <Leader>bi :source ~/.vimrc<cr>:call minpac#update()<cr>
nmap <Leader>bs :source ~/.vimrc<cr>:BundleSearch<cr>
nmap <Leader>bc :source ~/.vimrc<cr>:call minpac#clean()<cr>
map <Leader>vie :tabe ~/.vimrc<CR>
map <Leader>vi :e ~/.vimrc<CR>
map <Leader>n :NERDTreeToggle<cr>
nmap <Leader>ff :NERDTreeFind<CR>
map <Leader>vs :botright vne <CR>
map <Leader>wb :bel new <CR>
map <Leader>wn :new<CR>
nmap <S-h> 0
nmap <S-l> $
vmap <S-h> 0
vmap <S-l> $
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
map <Leader>sr :%s///g<left><left>
nnoremap <Leader><space> :noh<cr>
nnoremap <Leader>v V`]
inoremap jj <ESC>
nnoremap <C-p> :CtrlP<cr>


noremap <Leader>a :Ack <cword> <cr>
noremap <Leader>as :AckFromSearch -r [app/* config/* lib/* spec/* vendor/*] <cr>
noremap <Leader>ay "ayiw
noremap <Leader>by "byiw
noremap <Leader>cy "cyiw
noremap <Leader>ap "ap
noremap <Leader>bp "bp
noremap <Leader>cp "cp

vmap <Leader>ay "ay
vmap <Leader>by "by
vmap <Leader>cy "cy
vmap <Leader>ax "ax
vmap <Leader>bx "bx
vmap <Leader>cx "cx

noremap <Leader>cf :confirm bd<cr>
noremap <Leader>h :tabprevious<cr>
noremap <Leader>l :tabnext<cr>
nmap <Leader>te :Tabularize /=<CR>
vmap <Leader>te :Tabularize /=<CR>
nmap <Leader>tc :Tabularize /:<CR>
vmap <Leader>tc :Tabularize /:<CR>
nmap <Leader>tq :Tabularize /"<CR>
vmap <Leader>tq :Tabularize /"<CR>
nmap <Leader>t :Tabularize /
vmap <Leader>t :Tabularize /
"nmap <Leader>nm :%s/<C-V><C-M>//g
vmap <Leader>ft :s/</\r</g<cr>

"Pane resizing
nmap <C-Down> <C-w>4+
nmap <C-Up> <C-w>4-
nmap <C-Left> <C-w>4>
nmap <C-Right> <C-w>4<

"semi colon
vnoremap <Leader>; <ESC>A;<ESC>gv
nnoremap <Leader>; A;<ESC>

let g:session_autosave = 'no'

nnoremap <Leader>ss :SaveSession  
nnoremap <Leader>os :OpenSession 

"map <Leader>cc f,a<CR><ESC>
noremap <Leader>cc :s/, /,\r/g<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Date and Time Stamps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F5> "=strftime("%c")<CR>P
inoremap <F5> <C-R>=strftime("%c")<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Vim-Wiki
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Leader>we <Plug>VimwikiVSplitLink
let g:vimwiki_url_maxsave=0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Git mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <Leader>ga :! git add .<cr>
noremap <Leader>gad :! git add -A .<cr>
noremap <Leader>gaf :! git add %<cr>
noremap <Leader>gcm :! git commit -m "
noremap <Leader>gb :! git branch<cr>
noremap <Leader>gcb :! git checkout 
noremap <Leader>gccb :! git checkout -b
noremap <Leader>gs :! git status<cr>
noremap <Leader>grf :! git reset %<cr>
noremap <Leader>gr :! git reset .<cr>
noremap <Leader>gln :! git log --oneline -n 2<cr>
noremap <Leader>gll :! git log --oneline --graph --all --decorate<cr>
noremap <Leader>gl :! git log<cr>
noremap <Leader>gm :! git merge 
noremap <Leader>gmt :! git mergetool --tool=meld<cr>
noremap <Leader>gcf :! git checkout %<cr>
noremap <Leader>gd :! git diff %<cr>
noremap <Leader>gp :! git push<cr>
noremap <Leader>gls :! git log --stat<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rails commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <F3> :Autoformat<CR>
nmap <Leader>ric :r! 
nmap <Leader>rr :r! rake routes<CR>
nmap <Leader>rv :RVview<CR>
nmap <Leader>rvc :RVcontroller<CR>
nmap <Leader>rmi :RVmigration<CR>
nmap <Leader>rm :RVmodel<CR>
nmap <Leader>rs :AV<CR>
nmap <Leader>rb :! sh rebuild.sh<CR>
nmap <Leader>rft ?it \"<CR>f,vfdhhx
nmap <Leader>aft ?it \"<CR>/do<CR>hi, focus: true<ESC>

nmap <Leader>fa Hli Fixed --Vx/#<CR>, kpkddo<ESC>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Editor control commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Leader>tn :tabnew<CR>
nnoremap <Leader>r :%s/<C-R>=expand('<cword>')<CR>/
noremap ' `
nnoremap vv ^vg_

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"CTags stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"http://vim-taglist.sourceforge.net/manual.html
nmap <Leader>ct :Rtags<cr>
"nmap <A-]> :sp <CR>:exec("tag ".expand("<cword>"))<CR>zz
"nmap <C-]> :vs  <CR>:exec("tag ".expand("<cword>"))<CR>zz 
"nnoremap <Leader>tag :TlistToggle<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"HTML put tags on new lines
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap <Leader>ft :s/</\r</g<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Zencoding plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:user_emmet_expandabbr_key = '<c-e>'
let g:user_emmet_mode ='a'
let g:use_emmet_complete_tag    = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Code folding Not working for some reason.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldlevelstart=0
" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za

" "Focus" the current line.  Basically:
"
" 1. Close all folds.
" 2. Open just the folds containing the current line.
" 3. Move the line to a little bit (15 lines) above the center of the screen.
" 4. Pulse the cursor line.  My eyes are bad.
"
" This mapping wipes out the z mark, which I never use.
"
" I use :sus for the rare times I want to actually background Vim.
nnoremap <c-z> mzzMzvzz15<c-e>`z:Pulse<cr>

"nnoremap <Leader>f0 :set foldlevel=0<CR>
"nnoremap <Leader>f1 :set foldlevel=1<CR>
"nnoremap <Leader>f2 :set foldlevel=2<CR>
"nnoremap <Leader>f3 :set foldlevel=3<CR>
"nnoremap <Leader>f4 :set foldlevel=4<CR>
"nnoremap <Leader>f5 :set foldlevel=5<CR>
"nnoremap <Leader>f6 :set foldlevel=6<CR>
"nnoremap <Leader>f7 :set foldlevel=7<CR>
"nnoremap <Leader>f8 :set foldlevel=8<CR>
"nnoremap <Leader>f9 :set foldlevel=9<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Better code indentation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap < <gv
vnoremap > >gv

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keep search matches in the middle of the window.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap G Gzz

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" source the vim rc as soon as it's saved
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"au BufWritePost .vimrc so ~/.vimrc
" Save when losing focus
"au FocusLost * :silent! wall

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Abbreviations
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iabbr teh the
iabbr shoudl should
iabbr nto not
iabbr updatign updating

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='bubblegum'
"let g:airline_powerline_fonts=1
let g:airline#extensions#branch#enabled=1
let g:airline_powerline_fonts = 1
" Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list=1
"let g:syntastic_auto_loc_list=1
"let g:syntastic_check_on_open=1
"let g:syntastic_check_on_wq=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Ultisnips
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"rust plugin settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rust_recommended_style = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Python settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let python_highlight_all=1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"removed the status line so changing the colors to make eyes hurt less
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi StatusLine ctermbg=white ctermfg=black


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vimwiki
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Adding these since they seem to be overwritten or the timeout changes above
"are making it so you have to do it too fast to be able to use these.
noremap gl* :VimwikiChangeSymbolTo *<CR>
noremap gL* :VimwikiChangeSymbolInListTo *<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"NERDTree Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeShowHidden=1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Nim Plugin Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
fun! JumpToDef()
  if exists("*GotoDefinition_" . &filetype)
    call GotoDefinition_{&filetype}()
  else
    exe "norm! \<C-]>"
  endif
endf

" Jump to tag
nn <M-g> :call JumpToDef()<cr>
ino <M-g> <esc>:call JumpToDef()<cr>i

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"CTRLP configuration
" sudo apt-get install silversearcher-ag
" ref : https://github.com/ggreer/the_silver_searcher
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-p> :CtrlP<cr>
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

if executable('ag')
  let g:ackprg = 'ag --nogroup --nocolor --column'
  "let g:ackprg = 'ag --vimgrep'
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"this has to be at the bottom.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set iskeyword+=-

