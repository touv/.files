VIM=vim
RM=rm
CP=cp
INSTALL=install


all: $(HOME)/.bash_aliases \
	$(HOME)/.dircolors \
	$(HOME)/.vimrc \
	$(HOME)/.rsync \
	$(HOME)/.gitconfig \
	$(HOME)/.Xresources

$(HOME)/.bash_aliases: bash_aliases
	$(INSTALL) $? $@
$(HOME)/.dircolors: dircolors
	$(INSTALL) $? $@
$(HOME)/.vimrc: vimrc
	$(INSTALL) $? $@
	$(CP) -Rf vim/* $(HOME)/.vim/ 
$(HOME)/.rsync: rsync
	$(CP) -Rf $? $@
$(HOME)/.gitconfig: gitconfig
	$(INSTALL) $? $@
$(HOME)/.Xresources: Xresources
	$(INSTALL) $? $@


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

