" ----------------------------------------------------------------
" $Id$
"
"
" Download <URL:http://touv.free.fr/documents/MyDotFiles/.vimrc>
"
" ----------------------------------------------------------------

" -----------------------------------------------------------
" {{{ 1. General setup
" -----------------------------------------------------------
filetype plugin indent on 
set runtimepath=$HOME/.vim,$VIMRUNTIME

" {{{ 1.1 Ligne trop Longues (:help wrap)
set nowrap
set sidescroll=5
set listchars+=precedes:<,extends:>
" }}}

set backspace=2  " enable backspace to delete anyting (includes \n) in insert mode
set nocompatible " On n'assura pas la compatiblité avec VI et c'est tant mieux !
set noerrorbells " ne fait pas un bip lors d'une erreur
set visualbell   " Fait clignoter l'écran lors d'une erreur de saisie, de commande etc...
set showmatch " Quand on tape un ), vim montre furtivement le ( correspondant.
set foldcolumn=2 " Ajoute une marge à gauche pour afficher les +/- des replis

set encoding=utf8 " Par défaut on démarre en UTF8

" {{{ 1.2 Commentaires
set com& 
set com^=sr:*\ -,mb:*\ \ ,el:*/ com^=sr://\ -,mb://\ \ ,el:///
" }}}

" }}}

" -----------------------------------------------------------
" {{{ 2 Indentation
" -----------------------------------------------------------

set shiftwidth=4   " Nombre d'espace pour une tabulation
set softtabstop=4  " if non-zero, number of spaces to insert for a <tab>
set tabstop=4      " number of spaces the tab stands for

"set cinoptions={.5s,+.5s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s " some nice options for cindenting  by FOLKE
"set smarttab      " a <tab> in an indent insets 'shiftwidth' spaces (not tabstop)
"set si            " smartindenting (clever autoindenting)
"set autoindent    " On garde d'une ligne à l'autre l'indentation d'un paragraphe
"set expandtab     " ...


" }}}


" -----------------------------------------------------------
" {{{ 3. Searching, Substituting, Completion
" -----------------------------------------------------------

set ignorecase    " On ignore la casse des caractères dans les recherches de chaînes.
set scs           " No ignorecase if Uppercase chars in search
set magic         " change the way backslashes are used in search patterns
set wrapscan      " begin search at top when EOF reached
set sm            " jump to matches during entering the pattern
set hls           " highlight all matches...
set incsearch     " ...and also during entering the pattern

"set noedcompatible " !!! turn off the fucking :s///gc toggling
set completeopt=menuone


" }}}


" -----------------------------------------------------------
" {{{ 4. Highlighting, Colors, Fonts
" -----------------------------------------------------------

if &t_Co > 2 || has("gui_running")
	syntax on " Active la coloration syntaxique quand c'est possible
endif


if has("gui_running")
		set co=98 		"Nombre de colonnes à afficher
		set lines=41 		"Nombre de lignes à afficher

		if has("win32")
			set guifont=Fixedsys:h9:cANSI
			"set guifont=Courier:h10:cANSI
		else
			"set gfn=-adobe-courier-medium-r-normal-*-*-140-*-*-m-*-iso8859-15
			set guifont=Courier\ 12
			set guioptions=gimrLtTa
		endif
endif

syn sync minlines=10000 maxlines=10000 " ??? how many lines to sync backwards


" }}}


" -----------------------------------------------------------
" {{{ 4. Statusline, Menu
" -----------------------------------------------------------


set wc=<TAB>                         " use tab for auto-expansion in menus
set wmnu                             " show a list of all matches when tabbing a command
set wildmode=list:longest,list:full  " how command line completion works
set wildignore=*.o,*.r,*.so,*.sl,*.tar,*.tgz " ignore some files for filename completion
set su=.h,.bak,~,.o,.info,.swp,.obj  " some filetypes got lower priority
set hi=2000                          " remember last 2000 typed commands
set ruler                            " show cursor position below each window
set showmode                         " shows the current status (insert, visual, ...) in statusline
set laststatus=2                     " show always statusline of last window
set shm=at                           " Abréviation des messages

" }}}


" -----------------------------------------------------------
" {{{ 5. window handling
" -----------------------------------------------------------

"if has("gui_running")
"    set mousef     " Le focus suit la souris
"    set mousemodel=popup_setpos     " Le bouton droit affiche une popup
"endif

set wh=1           " minimal number of lines used for the current window
set wmh=0          " minimal number of lines used for any window
set noequalalways  " make all windows the same size when adding/removing windows
"set splitbelow     "a new window is put below the current one

" }}}


" -----------------------------------------------------------
" {{{ 6.Sauvegarde 
" -----------------------------------------------------------

set backupdir=~/.backup        " Répertoire de sauvegarde automatique
set backup                     " On active la sauvagarde
let savevers_dirs = &backupdir " Même répertoire de sauvegarde que pour le backup classique
"set updatecount=0              " Supprime l'utilisation du fichier d'échange

" }}}

" -----------------------------------------------------------
" {{{ 7. Ligne de commandes 
" -----------------------------------------------------------

"if has("win32") || has("win16")
"    set shell=C:/cygwin/bin/bash
"    set shellcmdflag=--login\ -c
"    set shellxquote=\" 
"endif
"
if ($OS =~"Windows")
    let g:netrw_scp_cmd="\"c:\\Program Files\\PuTTY\\pscp.exe\" -q -batch"
endif 
"


" -----------------------------------------------------------
" {{{ 8. Mapping
" -----------------------------------------------------------

nmap _S :%s/^\s\+//<CR> " Supprime tout les blancs en debut de ligne

nmap _j :move .+1<CR> " Deplace la ligne courante vers le bas
nmap _k :move .-2<CR> " Deplace la ligne courante vers le haut

" Converts file format to/from unix
command Unixformat :set ff=unix
command Dosformat :set ff=dos

" On fait tourner les tampons ...
nnoremap <C-N> :bn!<CR>
nnoremap <C-P> :bp!<CR>

" Annuler aka Undo (window$'s style)
inoremap <C-Z> <C-O>u
noremap <C-Z> u

" Refaire aka Redo (window$'s style)
" Supprimer car on confit avec le scroll montant
"noremap <C-Y> <C-R>
"inoremap <C-Y> <C-O><C-R>

" Scroll vers le bas sans bouger le curseur (window$'s style)
map <C-DOWN> <C-E>
" Scroll vers le haut sans bouger le curseur (window$'s style)
map <C-UP> <C-Y>

" Tout séléctionner (window$'s style)
noremap <C-A> gggH<C-O>G
"inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G

" Indentation automatique (Emacs's style)
vnoremap <C-F>   =$
vnoremap <tab>   =
nnoremap <tab>   =$
nnoremap <C-tab> mzvip=`z

" Fermer fichier (tampon) (window$'s style)
map <C-F4> :bd<cr>
imap <C-F4> <C-O>:bd<cr>
cmap <c-F4> <c-c>:bd<cr>

" F1 : de l'aide
nnoremap <F1> :help<Space>
vmap <F1> <C-C><F1>
omap <F1> <C-C><F1>
map! <F1> <C-C><F1>

" F4 : Force la fermeture d'un tampon
map <F4> :bd!<cr>
imap <F4> <C-O>:bd!<cr>
cmap <F4> <c-c>:bd!<cr>


" F6 Supprime tout les blancs en fin de ligne
map <F6> :%s/\s\+$//<CR> 

" F7 : Mets en commentaire cf EnhancedCommentify
map <F7> <Plug>Traditionalj
imap <F7> <esc><Plug>Traditionalji

" F8 : active/désactive la navigation par tags
nnoremap <silent> <F8> :Tlist<CR>



if has("gui_running")
    "set winaltkeys=menu " alt jumps to menu

    set guioptions+=a " clipboard to autoselect

    " Shift-Fleche pour selectionner un bloc
    map <S-Up> vk
    vmap <S-Up> k
    map <S-Down> vj
    vmap <S-Down> j
    map <S-Right> v
    vmap <S-Right> l
    map <S-Left> v
    vmap <S-Left> h

    if has("win32") || has("win16")
        " ...
    else
        " Couper aka Cut (generic's style)
        vmap <S-Del> "*x

        " Copier aka Copy (generic's style)
        vmap <C-Insert> "*y
        "vmap <Return> "*y"   "Return realise la copie du bloc selectionner
        "vmap <S-Return> "*y" "Shift Return aussi
    endif
endif

" }}}


" -----------------------------------------------------------
" {{{ 9. Plugin
" -----------------------------------------------------------

" {{{ 9.1 2html

let html_use_css = 1
command Code2html :source $VIMRUNTIME/syntax/2html.vim|

"}}}



" }}}


" -----------------------------------------------------------
" {{{ 11. Commande Automatique
" -----------------------------------------------------------
if has("autocmd")
    
    " {{{ 11.1 Template
    "au BufNewFile *.xsl 0r~/.vim/templates/xsl.xsl
    au BufNewFile *.xml 0r~/.vim/templates/xml.xml
    au BufNewFile *.html 0r~/.vim/templates/html.html
    au BufNewFile *.c 0r~/.vim/templates/c.c
    au BufNewFile *.php 0r~/.vim/templates/php.php
    " }}}
    
    " {{{ 11.2 En fonction du type de fichier
    autocmd FileType text setlocal textwidth=78 nocindent
	autocmd BufNewFile,BufRead *.t2t set ft=txt2tags
	autocmd BufNewFile,BufRead *.rst set syntax=rest
    autocmd FileType html set formatoptions+=tl
    autocmd FileType css set smartindent
    autocmd FileType html,css set noexpandtab tabstop=2
    autocmd FileType c,cpp,slang set cindent
    autocmd FileType php set cindent expandtab shiftwidth=4 softtabstop=4 tabstop=4 dictionary=$HOME/.vim/dictionaries/PHP.dict
    " }}}
    
    " {{{ 11.3 En fonction du suffixe du fichier
    autocmd BufNewFile,BufRead *.pc set syntax=html ft=proc
    autocmd BufNewFile,BufRead *.xul set syntax=xml ft=xml
    " }}}
    
    " {{{ 11.4 Divers
	autocmd BufRead *\[[0-9]] set syntax=html filetype=html 
	autocmd BufEnter * lcd %:p:h   " change to directory of current file automatically
    " }}}
    
endif

"}}}


" -----------------------------------------------------------
" {{{ 12. Spécificité pour chaque language
" -----------------------------------------------------------

" {{{ 12.1 Langage C
"let c_minlines = 200
"let c_comment_strings = 1
" }}}

" {{{ 12.2 Langage PHP
let php_sql_query = 1
let php_noShortTags = 1
let php_parent_error_close = 1
let php_parent_error_open = 1
"let php_minlines=300
"let php_htmlInStrings=1
let php_folding = 1
" }}}

"}}}


" vim:fdm=marker
