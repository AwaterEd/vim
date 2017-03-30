" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" The following are examples of different formats supported.
Plugin 'tpope/vim-fugitive'
" Plugin 'L9'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'ascenator/L9', {'name': 'newL9'}
" The above are examples

Plugin 'altercation/vim-colors-solarized'
Plugin 'Lokaltog/vim-powerline'
Plugin 'majutsushi/tagbar'
Plugin 'Valloric/YouCompleteMe'
Plugin 'kshenoy/vim-signature'

Plugin 'klen/python-mode'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"----------------------------------basic
" 定义快捷键的前缀，即<leader>
let mapleader=";"
set autochdir
set nocompatible
filetype on
set number
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set ambiwidth=double
set mouse=c
set mousemodel=popup
set wrap
syntax enable " 开启语法高亮功能
syntax on " 允许用指定语法高亮配色方案替换默认方案
" encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,gbk
set termencoding=utf-8


set laststatus=2 " 总是显示状态栏
set ruler " 显示光标当前位置
" set cursorline " 高亮显示当前行/列
" set cursorcolumn
set hlsearch " 高亮显示搜索结果

" set foldmethod=indent " 基于缩进或
set foldmethod=syntax " 语法进行代码折叠
set nofoldenable " 启动 vim 时关闭折叠代码
"----------------------------------basic
" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC
nmap <leader>l :set list!<CR>
" nmap LB 0
" nmap LE $
" 配色方案
set background=dark
" colorscheme solarized
" 设置状态栏主题风格
let g:Powerline_colorscheme='solarized256'
"----------------------------
" 设置 tagbar 子窗口的位置出现在主编辑区的左边 
let tagbar_left=1 
" 设置显示／隐藏标签列表子窗口的快捷键。速记：identifier list by tag
nnoremap <leader>ilt :TagbarToggle<CR> 
" 设置标签子窗口的宽度 
let tagbar_width=32 
" tagbar 子窗口中不显示冗余帮助信息 
let g:tagbar_compact=1
" 设置 ctags 对哪些代码标识符生成标签
let g:tagbar_type_cpp = {
    \ 'kinds' : [
         \ 'c:classes:0:1',
         \ 'd:macros:0:1',
         \ 'e:enumerators:0:0', 
         \ 'f:functions:0:1',
         \ 'g:enumeration:0:1',
         \ 'l:local:0:1',
         \ 'm:members:0:1',
         \ 'n:namespaces:0:1',
         \ 'p:functions_prototypes:0:1',
         \ 's:structs:0:1',
         \ 't:typedefs:0:1',
         \ 'u:unions:0:1',
         \ 'v:global:0:1',
         \ 'x:external:0:1'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
\ }

"----------------------------
" origin .vimrc above
"----------------------------
"set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c
set statusline=\ %F%m%r%h\ %w\ \ Line:\ %l/%L:%c
function! CurDir()
    let curdir = substitute(getcwd(), '/home/zhangdingshui/', "~/", "g")
    return curdir
endfunction
" =============================================
" =============================================
" plugin
" =============================================
" 设置NerdTree
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>
nmap <leader>sa :cs add cscope.out<cr>
nmap <leader>ss :cs find s <C-R>=expand("<cword>")<cr><cr>
nmap <leader>sg :cs find g <C-R>=expand("<cword>")<cr><cr>

nmap <leader>sc :cs find c <C-R>=expand("<cword>")<cr><cr>
nmap <leader>st :cs find t <C-R>=expand("<cword>")<cr><cr>
nmap <leader>se :cs find e <C-R>=expand("<cword>")<cr><cr>
nmap <leader>sf :cs find f <C-R>=expand("<cword>")<cr><cr>
nmap <leader>si :cs find i <C-R>=expand("<cword>")<cr><cr>
nmap <leader>sd :cs find d <C-R>=expand("<cword>")<cr><cr>
" set cscopetag
" =============================================
set tags=./tags
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/global_ycm_extra_conf.py'
