" ----------------------------------------------------------------
"
" Touv's vimrc
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
" }}}

set hidden          " Cache les buffers à la palce des les décharger
set autochdir       " Set working directory to the current file
set backspace=2     " enable backspace to delete anyting (includes \n) in insert mode
set nocompatible    " On n'assura pas la compatiblité avec VI et c'est tant mieux !
set noerrorbells    " ne fait pas un bip lors d'une erreur
set visualbell      " Fait clignoter l'écran lors d'une erreur de saisie, de commande etc...
set showmatch       " Quand on tape un ), vim montre furtivement le ( correspondant.
set foldcolumn=2    " Ajoute une marge à gauche pour afficher les +/- des replis
set undolevels=2000 " Nombre maximum de changements qui peuvent être annulés
set encoding=utf8   " Par défaut on démarre en UTF8
set fileencoding=utf-8
if version >= 700
	set listchars=eol:$,tab:>-,trail:.,extends:>,precedes:<,nbsp:% " :help 'list
    set nofsync " improves performance -- let OS decide when to flush disk
else
    set listchars=eol:$,tab:>-,trail:.,extends:>,precedes:< " : help 'list
endif


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

syntax on " Active la coloration syntaxique quand c'est possible


set cursorline
hi CursorLine guibg=#FFEFFF
set guioptions-=T " supprime la barre d'outils

" }}}


" -----------------------------------------------------------
" {{{ 4. Statusline, Menu
" -----------------------------------------------------------


set wc=<TAB>                         " use tab for auto-expansion in menus
set wildmenu                         " show a list of all matches when tabbing a command
set wildmode=list:longest,list:full  " how command line completion works
set wildignore=*.o,*.r,*.so,*.sl,*.tar,*.tgz " ignore some files for filename completion
set su=.h,.bak,~,.o,.info,.swp,.obj  " some filetypes got lower priority
set history=200                      " remember last 2000 typed commands
set ruler                            " show cursor position below each window
set showmode                         " shows the current status (insert, visual, ...) in statusline
set laststatus=2                     " show always statusline of last window
set shm=at                           " Abréviation des messages
" }}}


" -----------------------------------------------------------
" {{{ 5. window handling
" -----------------------------------------------------------

if has("gui_running")
    set mousef     " Le focus suit la souris
    set mousemodel=popup_setpos     " Le bouton droit affiche une popup
endif


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


set ttyfast                    " Indicates a fast terminal connection
set mouse=a                    " Utilisation de la souris dans les terminaux qui le peuvent


"if has("win32") || has("win16")
"    set shell=C:/cygwin/bin/bash
"    set shellcmdflag=--login\ -c
"    set shellxquote=\"
"endif
"
"if ($OS =~"Windows")
"    let g:netrw_scp_cmd="\"c:\\Program Files\\PuTTY\\pscp.exe\" -q -batch"
"endif
" }}}


" -----------------------------------------------------------
" {{{ 8. Mapping
" -----------------------------------------------------------

" {{{ 8.1 Mapping pour copier, couper, coller, sélectionner, annuler

vmap <S-Del> "*x
vmap <C-Insert> "*y
map <C-a> ggVG

if has("gui_running")
    " Shift-Fleche pour selectionner un bloc
    map <S-Up> vk
    vmap <S-Up> k
    map <S-Down> vj
    vmap <S-Down> j
    map <S-Right> v
    vmap <S-Right> l
    map <S-Left> v
    vmap <S-Left> h
endif
map <C-u> u
" }}}

" {{{ 8.2 Mapping pour Onglets:
"" }}}

" {{{ 8.3 Mapping pour scroller
" Scroll vers le bas sans bouger le curseur (window$'s style)
map <C-DOWN> <C-E>
" Scroll vers le haut sans bouger le curseur (window$'s style)
map <C-UP> <C-Y>
" }}}

" {{{ 8.4 Mapping pour les Tampons
nnoremap <C-PageDown> :bn!<CR>
nnoremap <C-PageUp> :bp!<CR>
"nnoremap <C-N> :bn!<CR>
"nnoremap <C-P> :bp!<CR>
"" }}}

" {{{ 8.5 Mapping des touches de fonctions

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

" F7 : Mets en commentaire cf. EnhancedCommentify
map <F7> <Plug>Traditionalj
imap <F7> <esc><Plug>Traditionalji

" F8 : Liste des tags
nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_Exit_OnlyWindow = 1		" vim se ferme si il reste uniquement la fenêtre des tags
let Tlist_Process_File_Always = 1	" activation permanente du plugin pour la barre de statut
let Tlist_Use_Right_Window = 1		" affiche les tags sur le côté droit de l'écran

" F10 : Spell check
function! ToggleSpell()
    if !exists("b:spell")
        setlocal spell spelllang=fr
        let b:spell = 1
    else
        setlocal nospell
        unlet b:spell
    endif
endfunction
 
nmap <F10> :call ToggleSpell()<CR>
imap <F10> <Esc>:call ToggleSpell()<CR>a


" }}}

" {{{ 8.6 Raccourcis clavier

" Indentation automatique (Emacs's style)
vnoremap <tab>   =
nnoremap <tab>   =$

" Supprime tout les blancs en debut de ligne
nmap _S :%s/^\s\+//<CR>

" Converts file format to/from unix
command Unixformat :set ff=unix
command Dosformat :set ff=dos

" close 
map <C-w> :bd!<CR>

" }}}

" }}}


" -----------------------------------------------------------
" {{{ 9. Plugin
" -----------------------------------------------------------

" Active la commande :Man
source $VIMRUNTIME/ftplugin/man.vim

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
    autocmd FileType php set cindent expandtab shiftwidth=4 softtabstop=4 tabstop=4 keywordprg=pman
    " }}}

    " {{{ 11.3 En fonction du suffixe du fichier
    autocmd BufNewFile,BufRead *.pc set syntax=html ft=proc
    autocmd BufNewFile,BufRead *.xul set syntax=xml ft=xml
    " }}}

    " {{{ 11.4 Divers
"    autocmd BufRead *\[[0-9]] set syntax=html filetype=html
"    autocmd BufEnter * lcd %:p:h   " change to directory of current file automatically
    " }}}

endif

"}}}


" -----------------------------------------------------------
" {{{ 12. Spécificité pour chaque language
" -----------------------------------------------------------

" {{{ 12.1 Langage C
let c_minlines = 200
let c_comment_strings = 1
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
