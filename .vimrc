set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
" 我的插件
Plugin 'The-NERD-Commenter'
Plugin 'rizzatti/dash.vim'
Plugin 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1 " 解决中文乱码问题
"显示行数
set nu
"保留200条历史记录
set history=200

"智能识别大小写
set ignorecase
set smartcase

"set cindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent

set is
set nohls

set ruler
syntax on

set guifont=Monaco:h16
set lines=32 columns=122

colorscheme molokai
"colorscheme default
  
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

"键盘映射
"
map <F1> :Dash<CR>
"
map <ESC><F1> :Dash!<CR>
"
map <F6> :w<CR>:e#<CR> 
"标签操作
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-n> :tabnew<CR>

"Latex相关设置
"let g:Tex_CompileRule_pdf = 'xelatex --interaction=nonstopmode $*'
":map <F9> <ESC>:w<CR><leader>ll :q<CR><leader>lv :copen<CR>
function! s:VSetSearch()
    "let temp = @m
    norm! gv"my
    let @/ = '\V' . substitute(escape(@m, '/\?'), '\n', '\\n', 'g')
    "let @m = temp
endfunction

xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>
