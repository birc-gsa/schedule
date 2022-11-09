SUBDIRS:=projects weeks

all: $(SUBDIRS)

FORCE:
$(SUBDIRS): FORCE
	echo Processing $@
	$(MAKE) -C $@

