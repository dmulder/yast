SUBDIRS = yast-core libyui libyui-ncurses

all: yast-ycp-ui-bindings yast-python-bindings yast-ruby-bindings

.PHONY: yast-ycp-ui-bindings yast-python-bindings yast-ruby-bindings yast-perl-bindings

yast-perl-bindings:
	ln -fs $(srcdir)/yast-ycp-ui-bindings/src ycp-ui
	pushd $@; $(MAKE); popd

yast-ycp-ui-bindings:
	ln -fs $(srcdir)/libyui/src yui
	ln -fs $(srcdir)/yast-core/wfm/src wfm
	pushd $@; $(MAKE) DEVTOOLSBINDIR=../../yast-core/base/tools/devtools; popd

yast-python-bindings:
	ln -fs $(srcdir)/yast-ycp-ui-bindings/src ycp-ui
	sed 's/__attribute__ ((deprecated)) //g' $(srcdir)/yast-core/libycp/src/include/ycp/YCPMap.h > yast-python-bindings/src/YCPMap.h
	pushd $@; $(MAKE); popd

yast-ruby-bindings:
	ln -fs $(srcdir)/yast-core/scr/src $(srcdir)/scr
	pushd $@; cmake -DCMAKE_CXX_FLAGS="-I../../../yast-core/liby2util-r/src/include -I../../../yast-core/libycp/src/include -I../../../yast-core/libscr/src/include -I../../.." -DCMAKE_PREFIX_PATH=../ -DCMAKE_INSTALL_PREFIX=$(prefix) CMakeLists.txt && $(MAKE) --trace; popd

clean-local:
	pushd yast-ycp-ui-bindings; $(MAKE) clean; popd
	pushd yast-python-bindings; $(MAKE) clean; popd
	pushd yast-ruby-bindings; $(MAKE) clean; popd

install-exec-hook:
	pushd yast-ycp-ui-bindings; $(MAKE) install; popd
	pushd yast-python-bindings; $(MAKE) install; popd
	pushd yast-ruby-bindings; $(MAKE) install; popd
	pushd yast-rake; rake install; popd
	pushd yast-yast2; rake install; popd

CLEANFILES = ycp-ui wfm scr yui
