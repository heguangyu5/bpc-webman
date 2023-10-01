start:
	./bpc-prepare.sh src.list
	$(MAKE) -C ./build realstart

realstart:
	bpc -v \
		--static \
		-c bpc.conf  \
		-u psr-log \
		-u psr-container \
		-u fastroute \
		-u monolog \
		-u workerman \
		-u webman \
		-d display_errors=on \
		--input-file src.list
	mv start ../
