# .bashrc

# Activer les couleurs
if [ -x /usr/bin/dircolors ]; then
	eval `/usr/bin/dircolors -b ~/.dircolors`
	alias ls="ls -h --color=auto"
	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

# Vim forever
if [ -x /usr/share/vim/vimcurrent/macros/less.sh ]; then
	alias more=/usr/share/vim/vimcurrent/macros/less.sh
	export MANPAGER="/bin/sh -c \"unset PAGER;col -b -x | \
				  vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
				  -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
				  -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""
fi

# Tailles de fichier "humaines"
alias du='du -h'
alias df='df -h'

# Raccourcis 
alias ll="ls -l"
alias mv='mv -i'
alias psu='ps -u thouveni'
alias v="gvim --"
alias n="nautilus ."
alias sync="rsync -CbutPr --exclude-from=/home/thouveni/.rsyncignore"
alias realpath='readlink -f'


# Garde fou 
alias rm="~/local/bin/supprime"

# Quelques Fonctions
function synchro {
# $1 source
# $2 destination
if [ "x$1" != "x" ] && [ "x$2" != "x" ]; then
        n1=`basename $1`
        n2=`basename $2`
        d1=`dirname $1`
        d2=`dirname $2`
        p1="$d1/$n1/"
        p2="$d2/$n2/"
        if [ -d $p1 ] && [ -d $p2 ] && [ $n1 = $n2 ]; then
                find $p1 -name "*~"  -exec rm -f {} \;
                find $p2 -name "*~" -exec rm -f {} \;

                #rsync -CbutPr --delete $p1 $p2
                rsync -vCutPr --delete $p1 $p2
        else
                echo "Sorry bad arguments. Try again !"
        fi
else
        echo "Too few arguments. Try again !"
fi
}

# STOW
export PATH=$HOME/local/bin:${PATH:=}
export MANPATH=$HOME/local/man:${MANPATH:=}
export LD_LIBRARY_PATH=$HOME/local/lib:${LD_LIBRARY_PATH:=}

#gnu pod
export IPOD_MOUNTPOINT=/mnt/IPOD/

# CVS for gna.org
export CVS_RSH=ssh
alias cvs-mp="cvs -d touv@cvs.gna.org:/cvs/mediapret"
alias cvs-mp-web="cvs -d touv@cvs.gna.org:/cvs/mediapret.homepage"
