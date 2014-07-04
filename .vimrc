" put this line first in ~/.vimrc
set nocompatible | filetype indent plugin on | syn on

fun! SetupVAM()
  let c = get(g:, 'vim_addon_manager', {})
  let g:vim_addon_manager = c
  let c.plugin_root_dir = expand('$HOME', 1) . '/.vim/vim-addons'
  " most used options you may want to use:
  " let c.log_to_buf = 1
  " let c.auto_install = 0
  let &rtp.=(empty(&rtp)?'':',').c.plugin_root_dir.'/vim-addon-manager'
  if !isdirectory(c.plugin_root_dir.'/vim-addon-manager/autoload')
    execute '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager '
        \       shellescape(c.plugin_root_dir.'/vim-addon-manager', 1)
  endif
  call vam#ActivateAddons([], {'auto_install' : 0})
endfun

call SetupVAM()
VAMActivate matchit.zip vim-addon-commenting
VAMActivate perl
" VAMActivate vim-django
VAMActivate vim-ruby
VAMActivate rails
" VAMActivate Rubytest
" VAMActivate perlomni
" VAMActivate mojo
VAMActivate vim-airline
VAMActivate HTML_AutoCloseTag
" VAMActivate css3
VAMActivate css_color
" VAMActivate mojo
" VAMActivate snipmate
VAMActivate nimrod
VAMActivate Python-mode-klen
VAMActivate delimitMate 
VAMActivate Zenburn
VAMActivate seoul256
VAMActivate The_NERD_tree
" VAMActivate The_NERD_Commenter
VAMActivate Emmet
VAMActivate UltiSnips
" VAMActivate UnconditionalPaste
VAMActivate Gundo
VAMActivate vim-snippets
VAMActivate jinja
VAMActivate vim-autopep8
VAMActivate vim-ipython
VAMActivate EasyMotion
VAMActivate surround
VAMActivate notes
VAMActivate genutils
VAMActivate github:henrik/vim-ruby-runner
VAMActivate Supertab
VAMActivate Syntastic
" VAMActivate Vdebug
VAMActivate calmar256-lightdark
VAMActivate github:jmcomets/vim-pony

set t_Co=256
colorscheme seoul256 

nnoremap <silent> <space>d :exec 'colorscheme' (g:colors_name ==# 'seoul256') ? 'calmar256-light' : 'seoul256'<CR>

set number
set foldmethod=indent
set foldlevel=99
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>
set wildmenu
set wildmode=list:longest,full

"Notes
"let g:notesRoot = '~/Documents/Notes'
let g:notes_directories = ['~/Documents/Notes']

" vmap <C-c> "py
" nmap <C-c> "pyiw
" vmap <C-p> "pp
" nmap <C-p> "pP
" imap <C-p> <Esc>"ppa"

map <Space>c <Plug>(easymotion-w)
"map <leader>r :!ruby %<cr>

"add in end and jump into do, while, if etc on SHIFT + ENTER(not working)
" imap <S-CR>    <CR><CR>end<Esc>-cc


" plugin commands
filetype plugin on
" filetype-indent-on
nnoremap <F6> :GundoToggle<CR>

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType ruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
" au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm set ft=jinja

autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2

"Cycle buffers <F2> and <F3>
map <F2> :bprevious<CR>
map <F3> :bnext<CR>


let user_emmet_expandabbr_key = '<c-e>'
" Pymode
let g:pymode = 1
" let g:pymode_trim_whitespaces = 1
" let g:pymode_options = 1
" let g:pymode_quickfix_minheight = 3
" let g:pymode_quickfix_maxheight = 6
" let g:pymode_python = 'python3'
" map <leader>n :NERDTreeToggle<CR>
" de_python = 'python'
let g:NERDTreeWinPos = "right"
nmap ,n :NERDTreeFind<CR>
nmap ,m :NERDTreeToggle<CR>

" Move between screens
" http://robots.thoughtbot.com/post/48275867281/vim-splits-move-faster-and-more-naturally
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"let mojo_disable_html = 1
"let mojo_highlight_data = 1
"filetype = perl

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

"Stop delays in resolving ruby/jruby
let g:ruby_path=system('which --skip-tilde ruby')
" let g:syntastic_quiet_messages = 1
