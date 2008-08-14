# .bashrc

# Set up ls command:
eval `/usr/bin/dircolors -b ~/.dircolors`

#gnu pod
export IPOD_MOUNTPOINT=/mnt/IPOD/

# Set some alias
alias rm="~/local/bin/supprime"
alias ls="ls --color=tty"
alias ll="ls -l"
alias mv='mv -i'
alias psu='ps -u thouveni'
alias sync="rsync -CbutPr --exclude-from=/home/thouveni/.rsyncignore"

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

# CVS for gna.org
export CVS_RSH=ssh
alias cvs-mp="cvs -d touv@cvs.gna.org:/cvs/mediapret"
alias cvs-mp-web="cvs -d touv@cvs.gna.org:/cvs/mediapret.homepage"
