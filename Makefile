VIM=vim
RM=rm
CP=cp
INSTALL=install


all: $(HOME)/.bash_aliases \
	$(HOME)/.dircolors \
	$(HOME)/.vimrc \
	$(HOME)/.vim \
	$(HOME)/.gitconfig \
	$(HOME)/.rsyncignore \
	$(HOME)/.Xresources

$(HOME)/.bash_aliases: dot.bash_aliases
	$(INSTALL) $? $@
$(HOME)/.dircolors: dot.dircolors
	$(INSTALL) $? $@
$(HOME)/.vimrc: dot.vimrc
	$(INSTALL) $? $@
$(HOME)/.vim: dot.vim
	$(CP) -Rf $? $@
$(HOME)/.gitconfig: dot.gitconfig
	$(INSTALL) $? $@
$(HOME)/.rsyncignore: dot.rsyncignore
	$(INSTALL) $? $@
$(HOME)/.Xresources: dot.Xresources
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

