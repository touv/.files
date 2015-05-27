VIM=vim
RM=rm
CP="cp -Rf"
LN=ln -s
INSTALL=install


all: $(HOME)/.rsync  $(HOME)/.gitconfig 

#$(HOME)/.bash_aliases: bash_aliases
#	$(INSTALL) $? $@
#$(HOME)/.dircolors: dircolors
#	$(INSTALL) $? $@
$(HOME)/.rsync: rsync
	ln -s `pwd`/$? $@
$(HOME)/.gitconfig: gitconfig
	ln -s `pwd`/$? $@
$(HOME)/.jshintrc: jshintrc
	ln -s `pwd`/$? $@
$(HOME)/.npmrc: npmrc
	ln -s `pwd`/$? $@
#$(HOME)/.Xresources: Xresources
#	$(INSTALL) $? $@


# html: ${SRCFILES} 
#     @list='$?'; for p in $$list; do \
#       if test -f $$p; then \
#         echo "To html... $$p ";  \
#         ${VIM} -n -c TOhtml -c x -c x $$p ;\
#         $(INSTALL) $$p $(DESTDIR); \
#         $(INSTALL) $$p.html $(DESTDIR); \
#         ${RM} $$p.html; \
#       fi; \
#     done

