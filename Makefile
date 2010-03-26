NAME=kodama

PLATFORMS=linux macosx mingw

$(PLATFORMS) clean:
	make -C dokidoki-support $@ NAME="../$(NAME)"
