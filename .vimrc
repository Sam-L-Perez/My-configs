"My (somewhat) retarded .vimrc



"By Sam Perez.



"Heavily inspired by the defualt .vimrc by Bram Moolenaar (his quotes will be
"doubled for convenience) 




"Even more Heavily inspired by dougblack.io's 'A good Vimrc' article


"Brams 8.0 commands for evim, (vim in permanent Insert mode)

" NOTE AS OF NOW THIS ONLY WORKS WITH the computer USER!

if v:progname =~? "evim"
  finish
endif
"A set of vim configurations in high demand

source $VIMRUNTIME/defaults.vim

"Start of Bram's commenting

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

"" End of Bram's commenting



"vividchalk theme

colorscheme vividchalk

"syntax processing


syntax enable


set tabstop=3 " the amount of tabspaces for non-input mode 



set softtabstop=3 " same as above but only for input mode



set expandtab    " gets rid of the movement restrictions for the tab button by 
" -inputing spaces VERY useful




set number  "gives line number on the backside of the screen VERY useful`


set showcmd " show command at the bottom


set wildmenu " menu interface for finding files using a wildcard expression 



set lazyredraw " makes redrawing (unkown to me atm) only automatic for excepional circumstances

set showmatch " Highlight matching variables

set incsearch " search as letters are entered


set laststatus=2 " for lightline.vim to work correctly


" move verticallly in two line sentences VERY USEFUL
nnoremap j gj
nnoremap k gk


" the rest of the key bindings

nnoremap qq :q!

"changing 'force quit' to 'qq'


" press <F5> for gundo


nnoremap <F5> :GundoToggle<CR>  

" .vimrc/.zshrc keybindings


nnoremap <leader>ev :

"Lightline config



"PLUGIN MANAGER vim-plug
" PlugInstall = install 
" PlugUpdate  = update


call plug#begin('~/.vim/plugged')

Plug 'sjl/gundo.vim' "a vim redo fuction manager

Plug 'itchyny/lightline.vim' "a very nice powerbar

Plug 'geoffharcourt/vim-matchit' "enhanced '%' options


Plug 'tpope/vim-eunuch' "adding some basic shell commands to vim
"I.e ':Sudoedit' edits files as root 
"    ':Remove' removes BOTH local buffer and physical file 
"        as well as basic UNIX commands like 
"                  ':Rename' ':Chmod' and 'Mkdir'
"        
"          the full list of commands can be found at
"          http://vimawesome.com/plugin/eunuch-vim 

"       WARNING 
"          :Sudoedit/:Sudowrite doesn't seem to work
"          
"                    Investigate ASAP
"


        


                 "Dependency plugins 
         "basically plugins needed for other plugins that i don't really need by themselves (fucking tounge twister) 
             
                              



   " Lightline Configuration as copied from-
   " https://github.com/itchyny/lightline.vim


 let g:lightline = {
   \  'colorscheme': 'wombat',
   \ }















call plug#end()

"Tmux-specific settings that i shamelessly stole from dougblack.io

if exists ('$TMUX')


        let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>//"


        let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>//"

else

        let &t_SI = "\<Esc>]50;CursorShape=1\x7"

        let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif 

" The matchit plugin makes the % command work better, but it is not backwards
"compatible.

"same as the matchit plugin

                "due to ease i am now loading matchit through a third-party plugin manager



if has('syntax') && has('eval')
"  packadd matchit
endif



" THINGS TO INVESTIGATE



"mksession/buffers


