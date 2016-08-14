
 let mapleader = ","  " 这个leader就映射为逗号“，”

 let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'   "配置默认的ycm_extra_conf.py
 nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>   
 let g:ycm_confirm_extra_conf = 0 "打开vim时不再询问是否加载ycm_extra_conf.py配置
 let g:ycm_collect_identifiers_from_tag_files = 1 "使用ctags生成的tags文件


 set nocompatible              " be iMproved, required
 filetype off                  " required

 "set the runtime path to include Vundle and initialize
 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()
 "alternatively, pass a path where Vundle should install plugins
 "let path = '~/some/path/here'
 "call vundle#rc(path)

 " let Vundle manage Vundle, required
 Plugin 'gmarik/vundle'

 " The following are examples of different formats supported.
 " Keep Plugin commands between here and filetype plugin indent on.
 " scripts on GitHub repos
 Plugin 'tpope/vim-fugitive'
 Plugin 'Lokaltog/vim-easymotion'
 Plugin 'tpope/vim-rails.git'
 " The sparkup vim script is in a subdirectory of this repo called vim.
 " Pass the path to set the runtimepath properly.
 Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
 " scripts from http://vim-scripts.org/vim/scripts.html
 Plugin 'L9'
 Plugin 'FuzzyFinder'
 " scripts not on GitHub
 Plugin 'git://git.wincent.com/command-t.git'
 " git repos on your local machine (i.e. when working on your own plugin)
 Plugin 'file:///home/gmarik/path/to/plugin'

 filetype plugin indent on     " required
 Bundle 'Valloric/YouCompleteMe'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"键盘命令
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <leader>w :w!<cr>
nmap <leader>f :find<cr>

" 映射全选+复制 ctrl+a
 map <C-A> ggVGY
 map! <C-A> <Esc>ggVGY
 map <F12> gg=G
 " 选中状态下 Ctrl+c 复制
 vmap <C-c> "+y
 "去空行  
 nnoremap <F2> :g/^\s*$/d<CR> 
 "比较文件  
 nnoremap <C-F2> :vert diffsplit 
 "新建标签  
 map <M-F2> :tabnew<CR>  
 "列出当前目录文件  
 map <F3> :tabnew .<CR>  
 "打开树状文件目录  
 map <C-F3> \be  
 "C，C++ 按F5编译运行
 map <F5> :call CompileRunGcc()<CR>
 func! CompileRunGcc()
     exec "w"
         if &filetype == 'c'
             exec "!g++ % -o %<"
             exec "! ./%<"
          elseif &filetype == 'cpp'
             exec "!g++ % -o %<"
             exec "! ./%<"
          elseif &filetype == 'java' 
             exec "!javac %" 
             exec "!java %<"
          elseif &filetype == 'sh'
                   :!./%
           endif
endfunc
 "C,C++的调试
  map <F8> :call Rungdb()<CR>
  func! Rungdb()
     exec "w"
     exec "!g++ % -g -o %<"
     exec "!gdb ./%<"
   endfunc






" 打开文件类型自动检测功能
   filetype on
 

 " 设置默认shell
   set shell=bash
       
         
 " 设置当文件在外部被改变时自动更新
   if exists("&autoread")
      set autoread
   endif
                   
  " 设置静音模式
     set noerrorbells
     set novisualbell
        
  " 不备份文件 
    set nobackup
    set nowb
      
 "insert模式下用退格键删除
  set bs=2
        
  "是显示状态行
  set laststatus=2
                         
  "为光标所在行添加下划线
    set cursorline
                             
  " 浅色高亮当前行
  autocmd InsertLeave * se nocul
  autocmd InsertEnter * se cul
                                      


" 设置语法高亮
  syntax enable
  syntax on
     
" 设置配色方案
  colorscheme desert
        
" 允许使用鼠标
"  set mouse=a
"  set selection=exclusive
"  set selectmode=mouse,key
             
 " 去掉vi一致性
   set nocompatible
                
  " 高亮显示匹配的括号
   set showmatch
                  

" 显示行号
  set number
   
" 检索时，忽略大小写
 set ignorecase
    
" 使用utf-8或者gbk打开文件
 set fileencodings=utf-8,gbk
         
" 检索时高亮显示匹配项
set hls
            
" 帮助系统设置为中文
if version>=603
 set helplang=cn
 set encoding=utf-8
endif
                          
" 代码折叠, zc 折叠，zo展开
 set foldmethod=syntax
                             
"标尺 
 set ruler
                                
" 显示输入的命令
 set showcmd
                                   
" 光标距离顶部和底部都保持3行距离
  set scrolloff=3
                                      
" 为C程序提供自动缩进
 set smartindent
                                        

" Sets how many lines of history VIM has to remember
 set history=500

 " Enable filetype plugins
 filetype plugin on
 filetype indent on

" Set to auto read when a file is changed from the outside
 set autoread

" With a map leader it's possible to do extra key combinations
" " like <leader>w saves the current file
 let mapleader = ","
 let g:mapleader = ","
"
" " Fast saving
nmap <leader>w :w!<cr>

 " :W sudo saves the file 
 " (useful for handling the permission-denied error)
  command W w !sudo tee % > /dev/null

" Set 7 lines to the cursor - when moving vertically using j/k
 set so=7

 " Avoid garbled characters in Chinese language windows OS
 let $LANG='en' 
 set langmenu=en
 source $VIMRUNTIME/delmenu.vim
 source $VIMRUNTIME/menu.vim

 " Turn on the WiLd menu
 set wildmenu

 "Ignore compiled files
 set wildignore=*.o,*~,*.pyc
 if has("win16") || has("win32")
     set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
     else
         set wildignore+=.git\*,.hg\*,.svn\*
         endif

         "Always show current position
         set ruler

         " Height of the command bar
         set cmdheight=2

         " A buffer becomes hidden when it is abandoned
         set hid

         " Configure backspace so it acts as it should act
         set backspace=eol,start,indent
         set whichwrap+=<,>,h,l

         " Ignore case when searching
         set ignorecase

         " When searching try to be smart about cases 
         set smartcase

         " Highlight search results
         set hlsearch

         " Makes search act like search in modern browsers
         set incsearch 

         " Don't redraw while executing macros (good performance config)
         set lazyredraw 

"         " For regular expressions turn magic on
         set magic

         " Show matching brackets when text indicator is over them
         set showmatch 

" How many tenths of a second to blink when matching brackets
 set mat=2

 " No annoying sound on errors
 set noerrorbells
 set novisualbell
 set t_vb=
 set tm=500

 " Add a bit extra margin to the left
 set foldcolumn=1


 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " => Colors and Fonts
 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " Enable syntax highlighting
 syntax enable 

 try
     colorscheme desert
     catch
     endtry

     set background=dark

     " Set extra options when running in GUI mode
     if has("gui_running")
         set guioptions-=T
         set guioptions-=e
         set t_Co=256
         set guitablabel=%M\ %t
         endif

     " Set utf8 as standard encoding and en_US as the standard language
     set encoding=utf8

     " Use Unix as the standard file type
      set ffs=unix,dos,mac


 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 "=> Files, backups and undo
 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " Turn backup off, since most stuff is in SVN, git et.c anyway...
 set nobackup
 set nowb
 set noswapfile


 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " => Text, tab and indent related
 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " Use spaces instead of tabs
 set expandtab

 " Be smart when using tabs ;)
 set smarttab

 " 1 tab == 4 spaces
 set shiftwidth=4
 set tabstop=4

 " Linebreak on 500 characters
 set lbr
 set tw=500

 set ai "Auto indent
 set si "Smart indent
 set wrap "Wrap lines


 """"""""""""""""""""""""""""""
 " => Visual mode related
 """"""""""""""""""""""""""""""
 " Visual mode pressing * or # searches for the current selection
 " Super useful! From an idea by Michael Naumann
 vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
 vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " => Moving around, tabs, windows and buffers
 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " Treat long lines as break lines (useful when moving around in them)
 map j gj
 map k gk

 " Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
 map <space> /
 map <c-space> ?

 " Disable highlight when <leader><cr> is pressed
 map <silent> <leader><cr> :noh<cr>

 " Smart way to move between windows
 map <C-j> <C-W>j
 map <C-k> <C-W>k
 map <C-h> <C-W>h
 map <C-l> <C-W>l

 " Close the current buffer
 map <leader>bd :Bclose<cr>:tabclose<cr>gT

 " Close all the buffers
 map <leader>ba :bufdo bd<cr>

 map <leader>l :bnext<cr>
 map <leader>h :bprevious<cr>

 " Useful mappings for managing tabs
 map <leader>tn :tabnew<cr>
 map <leader>to :tabonly<cr>
 map <leader>tc :tabclose<cr>
 map <leader>tm :tabmove 
 map <leader>t<leader> :tabnext 

 " Let 'tl' toggle between this and the last accessed tab
 let g:lasttab = 1
 nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
 au TabLeave * let g:lasttab = tabpagenr()


 " Opens a new tab with the current buffer's path
 " Super useful when editing files in the same directory
 map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

 " Switch CWD to the directory of the open buffer
 map <leader>cd :cd %:p:h<cr>:pwd<cr>

 " Specify the behavior when switching between buffers 
 try
   set switchbuf=useopen,usetab,newtab
    set stal=2
 catch
 endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


 " """""""""""""""""""""""""""""
 "=> Status line
 """"""""""""""""""""""""""""""
 " Always show the status line
 set laststatus=2

 " Format the status line
 set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " => Editing mappings
 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " Remap VIM 0 to first non-blank character
 map 0 ^

 " Move a line of text using ALT+[jk] or Command+[jk] on mac
 nmap <M-j> mz:m+<cr>`z
 nmap <M-k> mz:m-2<cr>`z
 vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
 vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

 if has("mac") || has("macunix")
   nmap <D-j> <M-j>
     nmap <D-k> <M-k>
       vmap <D-j> <M-j>
         vmap <D-k> <M-k>
         endif

         " Delete trailing white space on save, useful for Python and CoffeeScript ;)
        func! DeleteTrailingWS()
           exe "normal mz"
             %s/\s\+$//ge
               exe "normal `z"
               endfunc
               autocmd BufWrite *.py :call DeleteTrailingWS()
               autocmd BufWrite *.coffee :call DeleteTrailingWS()


               """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " => Ag searching and cope displaying
 "    requires ag.vim - it's much better than vimgrep/grep
 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " When you press gv you Ag after the selected text
 vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

 " Open Ag and put the cursor in the right position
 map <leader>g :Ag 

 " When you press <leader>r you can search and replace the selected text
 vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

 " Do :help cope if you are unsure what cope is. It's super useful!
 "
 " When you search with Ag, display your results in cope by doing:
 "   <leader>cc
 "
 " To go to the next search result do:
 "   <leader>n
 "
 " To go to the previous search results do:
 "   <leader>p
 "
 map <leader>cc :botright cope<cr>
 map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
 map <leader>n :cn<cr>
 map <leader>p :cp<cr>

 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " => Spell checking
 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " Pressing ,ss will toggle and untoggle spell checking
 map <leader>ss :setlocal spell!<cr>

 " Shortcuts using <leader>
 map <leader>sn ]s
 map <leader>sp [s
 map <leader>sa zg
 map <leader>s? z=


 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " => Misc
 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " Remove the Windows ^M - when the encodings gets messed up
 noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

 " Quickly open a buffer for scribble
 map <leader>q :e ~/buffer<cr>

 " Quickly open a markdown buffer for scribble
 map <leader>x :e ~/buffer.md<cr>

 " Toggle paste mode on and off
 map <leader>pp :setlocal paste!<cr>




 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " => Helper functions
 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 function! CmdLine(str)
     exe "menu Foo.Bar :" . a:str
         emenu Foo.Bar
             unmenu Foo
             endfunction 

             function! VisualSelection(direction, extra_filter) range
                 let l:saved_reg = @"
                     execute "normal! vgvy"

                         let l:pattern = escape(@", '\\/.*$^~[]')
                             let l:pattern = substitute(l:pattern, "\n$", "",")

    if a:direction == 'gv'
        call CmdLine("Ag \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Returns true if paste mode is enabled
 function! HasPaste()
     if &paste
             return 'PASTE MODE  '
                 endif
                     return ''
                     endfunction

" Don't close window, when deleting a buffer
 command! Bclose call <SID>BufcloseCloseIt()
 function! <SID>BufcloseCloseIt()
 let l:currentBufNum = bufnr("%")
 let l:alternateBufNum = bufnr("#")

 if buflisted(l:alternateBufNum)
   buffer #
 else
   bnext
 endif

 if bufnr("%") == l:currentBufNum
    new
 endif

 if buflisted(l:currentBufNum)
     execute("bdelete!:currentBufNum)
  endif
  endfuncti
"Make VIM remember position in file after reopen
"if has("autocmd")
"au BufReadPost * if line("'\"")> 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif
