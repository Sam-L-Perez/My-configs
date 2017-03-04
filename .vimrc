"My (somewhat) retarded .vimrc

"By Sam Perez.

"Heavily inspired by the defualt .vimrc by Bram Moolenaar (his quotes will be
"doubled for convenience) 


"Even more Heavily inspired by dougblack.io's 'A good Vimrc' article


"Brams 8.0 commands for evim, (vim in permanent Insert mode)


if v:progname =~? "evim"
  finish
endif
"A set of vim configurations in high demand
source $VIMRUNTIME/defaults.vim

if has("vms")  
  set nobackup		"" do not keep a backup file, use versions instead
else
  set backup		"" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	"" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  "" Switch on highlighting the last used search pattern.
  set hlsearch
endif

"" Only do this part when compiled with support for autocommands.
if has("autocmd")

  "" Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  "" For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent		"" always set autoindenting on

endif "" has("autocmd")

"" Add optional packages.
"vividchalk theme

colorscheme vividchalk

"syntax processing


syntax enable


set tabstop=3 " the amount of tabspaces for non-input mode 



set softtabstop=3 " same as above but only for input mode



set expandtab    " gets rid of the movement restrictions for the tab button by 
" -inputing spaces VERY useful




set number " gives line number on the backside of the screen VERY useful`



set showcmd "shows last command in bottom bar




set wildmenu " menu interface for finding files using a wildcard expression 



set lazyredraw " makes redrawing (unkown to me atm) only automatic for excepional circumstances



set showmatch " highlinght matching parenthesis (and friends) statement



set incsearch " search as letters are entered


" move verticallly in two line sentences VERY USEFUL

nnoremap j gj
nnoremap k gk


" the rest of the key bindings

nnoremap qq :q!
nnoremap <F5> :GundoToggle<CR>  

"PLUGIN MANAGER vim-plug
" PlugInstall = install 
" PlugUpdate  = update


call plug#begin('~/.vim/plugged')
Plug 'sjl/gundo.vim' 

Plug 'http://github.com/ctrlpvim/ctrlp.vim'


call plug#end()

" CtrlP settings

let g:ctrlp_match_window = 'bottom,order:ttb'

"Tmux-specific settings

if exists ('$TMUX')


        let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>//"


        let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>//"

else

        let &t_SI = "\<Esc>]50;CursorShape=1\x7"

        let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif 

" The matchit plugin makes the % command work better, but it is not backwards
" compatible.



if has('syntax') && has('eval')
  packadd matchit
endif



" THINGS TO INVESTIGATE

"mksession/buffers
