" System Default
syntax on
set nocompatible
set splitbelow
set splitright
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set ignorecase
set smartcase
set noeb vb t_vb=
au GUIEnter * set vb t_vb=
set incsearch
set laststatus=2
set backspace=2
set number
set title " change the terminal's title

filetype on        " Enable filetype detection
filetype indent on " Enable filetype-specific indenting
filetype plugin on " Enable filetype-specific plugin

" :help new-omni-completion :help compl-omni
set omnifunc=syntaxcomplete#Complete

" Mapping
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" 80 Characters Bar
if exists('+colorcolumn')
  let &colorcolumn="80"
  highlight ColorColumn ctermbg=236
endif

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" vim +PluginInstall +qall - install from command line
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
" Plugin Config
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'slim-template/vim-slim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mattn/emmet-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'janko-m/vim-test'
Plugin 'kien/ctrlp.vim'
Bundle 'vim-ruby/vim-ruby'
Plugin 'Yggdroot/indentLine'
Plugin 'mhinz/vim-signify'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-rails'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" NERDtree
map <C-n> :NERDTreeToggle<CR>

" Indent Lines
" let g:indentLine_char = '│'

" Syntastic
noremap <leader>c :SyntasticCheck<CR>
let g:syntastic_quiet_messages = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_save = 0
let g:syntastic_check_on_w = 0
let g:syntastic_javascript_checkers = ['eslint']

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Rubocop, Reek and Ruby-Lint integration
let g:syntastic_ruby_rubocop_exec =  "~/.rbenv/shims/rubocop"
let g:syntastic_ruby_checkers = ['rubocop', 'ruby-lint', 'reek']
let g:syntastic_ruby_exec = '~/.rbenv/shims/ruby'
let b:syntastic_mode = "passive"
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes':[],'passive_filetypes': [] }

" Tests
"let test#ruby#rspec#executable = 'docker-compose -f ~/Projects/cerc/docker-compose.test.yml run core bundle exec rspec'
"let test#ruby#rspec#executable = 'docker-compose run core bundle exec rspec'
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" Autoremove whitespaces
autocmd BufWritePre * %s/\s\+$//e

" Vim ruby - :help ft-ruby-syntax
let ruby_space_errors = 1
let ruby_operators = 1
let ruby_foldable_groups = 'if case %'
" imap <S-CR>    <CR><CR>end<Esc>-cc

autocmd FileType ruby compiler ruby

" Vim slim
autocmd BufNewFile,BufRead *.slim setlocal filetype=slim

" Folding
setlocal foldmethod=indent
set foldlevelstart=20
autocmd Syntax rb,html normal zR
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Tmux
