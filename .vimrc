set nocompatible

filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized' " I'm not sure im actually using this
Plugin 'tomasr/molokai' "same here, this is also a colour
Plugin 'vim-airline/vim-airline' "status bars
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree' " explorer \t
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'vim-syntastic/syntastic' " code validation
Plugin 'majutsushi/tagbar' "\b to open
Plugin 'ctrlpvim/ctrlp.vim' " autosuggest
Plugin 'airblade/vim-gitgutter' " side bar info
Plugin 'tpope/vim-fugitive' " git in vim
Plugin 'Raimondi/delimitMate' " autoclose
Plugin 'christoomey/vim-tmux-navigator' " pane management, not sure I'm using this
Plugin 'ntpeters/vim-better-whitespace' " shows useless space clearly
Plugin 'godlygeek/tabular' " auto indent
Plugin 'HTML-AutoCloseTag'
Plugin 'Valloric/YouCompleteMe' " auto suggest
Plugin 'joonty/vdebug' " xdebug
Plugin 'scrooloose/nerdcommenter' " comment/uncomment lines
Plugin 'tobyS/vmustache' " templateing engine used by other plugins
Plugin 'SirVer/ultisnips' " snippets
Plugin 'tobyS/pdv' " phpdocs

call vundle#end()

filetype plugin indent on

syntax on

colorscheme neverland

set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set smarttab

set number
set cursorline
set backspace=indent,eol,start
set ruler " show coordinates
set wildmenu " enhanced cmd line completion
set noshowmode " don't show the vim mode

set incsearch " highlight search
set hlsearch " keep highlighted

syntax on

" symbols in the sign column
hi clear SignColumn

set mouse=r " enable mouse

" plugin-specific stuff

set background=dark

" ----- bling/vim-airline settings -----
" Always show statusbar
set laststatus=2

" Fancy arrow symbols
let g:airline_powerline_fonts = 1

" Show PASTE if in paste mode
let g:airline_detect_paste=1

" Show airline for tabs too
let g:airline#extensions#tabline#enabled = 1

" Use the solarized theme for the Airline status bar
let g:airline_powerline_fonts = 1

" ----- jistr/vim-nerdtree-tabs -----
" Open/close NERDTree Tabs with \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>

" ----- vim-syntastic/syntastic settings -----
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_php_checkers = ['php']
let g:syntastic_python_checkers = ['python']
let g:syntastic_scss_checkers = ['scss']
let g:syntastic_twig_checkers = ['twig']
let g:syntastic_javascript_checkers = ['javascript']
let g:syntastic_dockerfile_checkers = ['dockerfile']
let g:syntastic_css_checkers = ['css']
let g:syntastic_xhtml_checkers = ['xhtml']
let g:syntastic_html_checkers = ['w3']
let g:syntastic_sql_checkers = ['sql']

" ----- xolox/vim-easytags settings -----
" Where to look for tags files
set tags=./tags;,~/.vimtags
" Sensible defaults
"let g:easytags_cmd = '/usr/bin/ctags'
"let g:easytags_events = ['BufReadPost', 'BufWritePost']
"let g:easytags_async = 1
"let g:easytags_by_filetype = "/.vim/tags"
"let g:easytags_dynamic_files = 1
"let g:easytags_resolve_links = 1
"let g:easytags_suppress_ctags_warning = 1

" ----- majutsushi/tagbar settings -----
" Open/close tagbar with \b
nmap <silent> <leader>b :TagbarToggle<CR>

" ----- ctrlp-vim/ctrp-vim settings -----
let g:ctrp_working_path_mode = '~/projects/'

" ----- airblade/vim-gitgutter settings -----
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1

" ----- Raimondi/delimitMate settings -----
let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" ----- YouCompletMe settings -----
let g:ycm_server_python_interpreter = '/usr/bin/python'

" ----- UltiSnips settings -----
let g:UltiSnipsExpandTrigger="<c-z>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" ----- pvd settings -----
let g:pdv_template_dir = $HOME . "/.vim/bundle/pdv/templates_snip"

nnoremap <buffer> <c-l> :call pdv#DocumentWithSnip()<CR>
