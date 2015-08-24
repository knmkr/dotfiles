EMACS=emacs-24.5

usage:
	@echo "USAGE: make [*.el | *.elc]"

.el.elc:
	$(EMACS) -batch -f batch-byte-compile $*.el

# auto-install.el:
# 	curl -O http://www.emacswiki.org/emacs/download/auto-install.el

# ac-python.el:
# 	curl -O http://chrispoole.com/downloads/ac-python.el

# css-mode.el:
# 	curl -O http://www.garshol.priv.no/download/software/css-mode/css-mode.el

# ruby-electric.el:
# 	curl -O https://raw.github.com/ruby/ruby/trunk/misc/ruby-electric.el

# ruby-block.el:
# 	curl -O http://www.emacswiki.org/emacs/download/ruby-block.el

# yaml-mode.el:
# 	curl -O https://raw.github.com/yoshiki/yaml-mode/master/yaml-mode.el

# minibuf-isearch.el:
# 	curl -O http://www.sodan.org/~knagano/emacs/minibuf-isearch/minibuf-isearch.el

# session.el:
# 	curl -L -O http://sourceforge.net/projects/emacs-session/files/session/2.2a/session-2.2a.tar.gz
# 	tar zxvf session-2.2a.tar.gz
# 	cp session/lisp/session.el .
# 	rm -r session session-2.2a.tar.gz

# flymake-cursor.el:
# 	curl -O http://www.emacswiki.org/emacs/download/flymake-cursor.el

# migemo:
# 	curl -O http://0xcc.net/migemo/migemo-0.40.tar.gz
# 	gzip -dc migemo-0.40.tar.gz | tar xvf -
# 	# cd migemo-0.40; ./configure && make && make install

elisp.d:
	mkdir elisp.d

# org-mode: org-latest.tar.gz
# 	cd elisp.d; tar zxvf org-latest.tar.gz
# 	cd elisp.d/org-mode; make
# 	rm elisp.d/org-latest.tar.gz

# org-latest.tar.gz: elisp.d
# 	cd elisp.d; curl -O http://orgmode.org/org-latest.tar.gz

# scala-mode:
# 	cd elisp.d; git clone https://github.com/scala/scala-dist.git
# 	cd elisp.d/scala-dist/tool-support/src/emacs/; make
# 	cd elisp.d; mv scala-dist/tool-support/src/emacs/ scala-mode
# 	cd elisp.d; rm -rf scala-dist/

# jedi:
# 	mkdir jedi
# 	cd jedi; git clone git://github.com/tkf/emacs-jedi
# 	cd jedi; git clone git://github.com/kiwanami/emacs-deferred
# 	cd jedi; git clone git://github.com/kiwanami/emacs-epc
# 	cd jedi; git clone git://github.com/kiwanami/emacs-ctable
# 	cd jedi/emacs-jedi; virtualenv env && source env/bin/activate && pip install jedi epc
