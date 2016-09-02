" System Default
syntax on
set nocompatible
set splitbelow
set splitright
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set number
set hlsearch
set ignorecase
set smartcase
set noeb vb t_vb=
au GUIEnter * set vb t_vb=
set incsearch
set laststatus=2
set backspace=2
set autoindent

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

filetype off

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

" All of your Plugins must be added before the following line
call vundle#end()            " required

" NERDtree
map <C-n> :NERDTreeToggle<CR>

" Indent Lines
let g:indentLine_char = '│'

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

let g:syntastic_error_symbol = '❌ '
let g:syntastic_style_error_symbol = '⁉️ '
let g:syntastic_warning_symbol = '⚠️ '
let g:syntastic_style_warning_symbol = '💩 '

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

function! StrTrim(txt)
  return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction

let b:syntastic_javascript_eslint_exec = StrTrim(system('npm-which eslint'))

" Rubocop, Reek and Ruby-Lint integration
let g:syntastic_ruby_rubocop_exec =  "~/.rbenv/shims/rubocop"
let g:syntastic_ruby_checkers = ['rubocop', 'ruby-lint', 'reek']
let g:syntastic_ruby_exec = '~/.rbenv/shims/ruby'
let b:syntastic_mode = "passive"
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes':[],'passive_filetypes': [] }
