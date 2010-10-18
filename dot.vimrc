" ----------------------------------------------------------------
"
" Touv's vimrc
"
" -----------------------------------------------------------
" {{{ Encodage et format par défaut
" -----------------------------------------------------------
set encoding=utf8
set fileformats=unix,dos,mac
set fileencoding=utf-8
scriptencoding utf-8
" }}}
"
"

" {{{ General
" -----------------------------------------------------------
filetype plugin indent on


set hidden          " Cache les buffers à la place des les décharger
set autochdir       " Set working directory to the current file
set backspace=2     " enable backspace to delete anyting (includes \n) in insert mode
set nocompatible    " On n'assura pas la compatiblité avec VI et c'est tant mieux !
set noerrorbells    " ne fait pas un bip lors d'une erreur
set visualbell      " Fait clignoter l'écran lors d'une erreur de saisie, de commande etc...
set showmatch       " Quand on tape un ), vim montre furtivement le ( correspondant.
set showcmd
set foldcolumn=2    " Ajoute une marge à gauche pour afficher les +/- des replis
set undolevels=2000 " Nombre maximum de changements qui peuvent être annulés
set spelllang=fr_fr " Langue de correction par défaut
" }}}


" {{{ Césure
" -----------------------------------------------------------
set nowrap          " pas de retour à la ligne automatique
set sidescroll=5    " (lié à nowrap) nombre minimum de colonnes qui défilent horizontalement
"set foldcolumn+=a   " reformatage automatique
"set textwidth=80    " largeur du text
"set wrapmargin=2   " Marge avant coupure
" }}}

" {{{ Caractères invisibles
" -----------------------------------------------------------
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=eol:¬,tab:▸\ ,trail:·,precedes:«,extends:»,nbsp:%
"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
" }}}


" {{{ Commentaires
" -----------------------------------------------------------
set com&
set com^=sr:*\ -,mb:*\ \ ,el:*/ com^=sr://\ -,mb://\ \ ,el:///
" }}}

" {{{ Indentation
" -----------------------------------------------------------
set shiftwidth=4   " Nombre d'espace pour une tabulation
set softtabstop=4  " if non-zero, number of spaces to insert for a <tab>
set tabstop=4      " number of spaces the tab stands for
set noexpandtab    " Tabulation génére des espaces
" }}}


" {{{ Searching, Substituting, Completion
" -----------------------------------------------------------
set ignorecase    " On ignore la casse des caractères dans les recherches de chaînes.
set scs           " No ignorecase if Uppercase chars in search
set magic         " change the way backslashes are used in search patterns
set wrapscan      " begin search at top when EOF reached
set sm            " jump to matches during entering the pattern
set hls           " highlight all matches...
set incsearch     " ...and also during entering the pattern

set completeopt+=menuone
" }}}


" {{{ Optimization
" -----------------------------------------------------------
set ttyfast       " Indicates a fast terminal connection
set nofsync       " improves performance -- let OS decide when to flush disk
" }}}

" {{{ Highlighting, Colors, Fonts
" -----------------------------------------------------------
syntax on                       " Active la coloration syntaxique quand c'est possible
set cursorline
hi CursorLine guibg=#FFEFFF
set guioptions-=T               " supprime la barre d'outils
" }}}


" {{{ Statusline
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


" {{{ Souris
" -----------------------------------------------------------
if has("gui_running")
    set mousef                      " Le focus suit la souris
    set mousemodel=popup_setpos     " Le bouton droit affiche une popup
endif
set mouse=a                         " Utilisation de la souris dans les terminaux qui le peuvent
" }}}

" {{{ Fenetres
" -----------------------------------------------------------
set wh=1           " minimal number of lines used for the current window
set wmh=0          " minimal number of lines used for any window
set noequalalways  " make all windows the same size when adding/removing windows
"set splitbelow     "a new window is put below the current one
" }}}

" {{{ Sauvegarde
" -----------------------------------------------------------
set backupdir=~/.backup        " Répertoire de sauvegarde automatique
set backup                     " On active la sauvagarde
let savevers_dirs = &backupdir " Même répertoire de sauvegarde que pour le backup classique
"set updatecount=0              " Supprime l'utilisation du fichier d'échange
" }}}

" {{{ Mapping
" -----------------------------------------------------------

let mapleader = ","            " , is easier to type than \


" copier, coller
vmap <S-Del> "*x
vmap <C-Insert> "*y
map <C-a> ggVG

" Shift-Fleche pour sélectionner un bloc
imap <S-Up> <esc>vk
map <S-Up> vk
vmap <S-Up> k
imap <S-Down> <esc>vj
map <S-Down> vj
vmap <S-Down> j
imap <S-Right> <esc>v
map <S-Right> v
vmap <S-Right> l
imap <S-Left> <esc>v
map <S-Left> v
vmap <S-Left> h

" CTRL+PAGEUP / CTRL+PAGEDOWN pour circuler entre les Tampons
nnoremap <C-PageDown> :bn!<CR>
nnoremap <C-PageUp> :bp!<CR>

" CTRL+UP / CRTL+DOWN sur une sélection déplace celle-ci (nécessite le plugin unimpared)
" http://vimcats.org/e/26
vmap <C-Up> [egv
vmap <C-Down> ]egv

" F4 : fermeture forcer d'un tampon
map <F4> :bd!<cr>
imap <F4> <C-O>:bd!<cr>
cmap <F4> <c-c>:bd!<cr>

" F7 : Mettre en commentaire cf. EnhancedCommentify
map <F7> <Plug>Traditionalj
imap <F7> <esc><Plug>Traditionalji

" F8 : Liste des tags
nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_Exit_OnlyWindow = 1		" vim se ferme si il reste uniquement la fenêtre des tags
let Tlist_Process_File_Always = 1	" activation permanente du plugin pour la barre de statut
let Tlist_Use_Right_Window = 1		" affiche les tags sur le côté droit de l'écran

" F10 : Spell check
nmap <F10> :set spell!<CR>
imap <F10> <Esc>:set spell!<CR>a

" Indentation automatique (Emacs's style)
vnoremap <tab>   =
nnoremap <tab>   =$

" Supprimer les blancs en debut de ligne ou fin de ligne
nnoremap <leader>s :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>S :%s/^\s\+//<cr>:let @/=''<CR>

" Converts file format to/from unix
command Unixformat :set ff=unix
command Dosformat :set ff=dos

" }}}


" {{{ Plugin
" -----------------------------------------------------------

source $VIMRUNTIME/ftplugin/man.vim          " Active la commande :Man

" }}}

" {{{ Commande Automatique
" -----------------------------------------------------------
if has("autocmd")

    " {{{ Template
    "au BufNewFile *.xsl 0r~/.vim/templates/xsl.xsl
    au BufNewFile *.xml 0r~/.vim/templates/xml.xml
    au BufNewFile *.html 0r~/.vim/templates/html.html
    au BufNewFile *.c 0r~/.vim/templates/c.c
    au BufNewFile *.php 0r~/.vim/templates/php.php
    " }}}

    " {{{ Configuration par type
    autocmd FileType text setlocal textwidth=78 nocindent
    autocmd FileType c,cpp,slang setlocal cindent
    autocmd FileType css setlocal smartindent expandtab ts=2 sts=2 sw=2
    autocmd FileType html setlocal formatoptions+=tl expandtab ts=2 sts=2 sw=2
    autocmd FileType javascript setlocal formatoptions+=tl noexpandtab ts=4 sts=4 sw=4
    autocmd FileType php setlocal cindent expandtab  ts=4 sts=4 sw=4 keywordprg=pman makeprg=php\ -l\ % errorformat=%m\ in\ %f\ on\ line\ %l
    " }}}

    " {{{ Traitement des extentions particulières
    autocmd BufNewFile,BufRead *.t2t setfiletype txt2tags
    autocmd BufNewFile,BufRead *.rss,*.atom,*.xul setfiletype xml
    autocmd BufNewFile,BufRead *.rst set syntax=rest
    autocmd BufNewFile,BufRead *.pc set syntax=html ft=proc
    " }}}

    " {{{ 11.4 Divers
    "    autocmd BufRead *\[[0-9]] set syntax=html filetype=html
    "    autocmd BufEnter * lcd %:p:h   " change to directory of current file automatically
    " }}}

endif

"}}}


" {{{ Pour PHP
" -----------------------------------------------------------
let php_sql_query = 1
let php_noShortTags = 1
let php_parent_error_close = 1
let php_parent_error_open = 1
let php_folding = 1
" }}}


" vim:fdm=marker
