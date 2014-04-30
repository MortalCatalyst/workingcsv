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
VAMActivate perlomni
VAMActivate vim-airline
VAMActivate HTML_AutoCloseTag
VAMActivate css3
VAMActivate css_color
VAMActivate mojo
" VAMActivate snipmate
VAMActivate nimrod
VAMActivate Python-mode-klen
VAMActivate delimitMate 
VAMActivate Zenburn
VAMActivate seoul256
VAMActivate The_NERD_tree
VAMActivate The_NERD_Commenter
VAMActivate Emmet
VAMActivate UltiSnips
VAMActivate UnconditionalPaste
VAMActivate Gundo
VAMActivate vim-snippets
VAMActivate jinja


colorscheme seoul256
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

" plugin commands
filetype plugin on
" filetype-indent-on
nnoremap <F5> :GundoToggle<CR>
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
au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm set ft=jinja

let user_emmet_expandabbr_key = '<c-e>'
let g:pymode = 1
let g:pymode_trim_whitespaces = 1
let g:pymode_options = 1

map <leader>n :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"

" nnoremap <F5> :GundoToggle<CR>

let mojo_disable_html = 1
let mojo_highlight_data = 1
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

