VIM=vim
RM=rm
MKDIR=mkdir
INSTALL=install


all: $(HOME)/.bash_aliases \
	$(HOME)/.dircolors \
	$(HOME)/.vimrc \
	$(HOME)/.vim \
	$(HOME)/.gitconfig \
	$(HOME)/.Xresources

$(HOME)/.bash_aliases: dot.bash_aliases
	$(INSTALL) $? $@
$(HOME)/.dircolors: dot.dircolors
	$(INSTALL) $? $@
$(HOME)/.vimrc: dot.vimrc
	$(INSTALL) $? $@
$(HOME)/.vim: dot.vim
	$(INSTALL) -d $? $@
$(HOME)/.gitconfig: dot.gitconfig
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

