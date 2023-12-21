start:
	./bpc-prepare.sh src.list
	$(MAKE) -C ./build realstart

realstart:
	bpc -v \
		--static \
		-c bpc.conf  \
		-u psr-log                  \
		-u psr-container            \
		-u fastroute                \
		-u monolog                  \
		-u workerman                \
		-u doctrine-inflector       \
		-u illuminate-contracts     \
		-u illuminate-container     \
		-u illuminate-support       \
		-u illuminate-events        \
		-u illuminate-pagination    \
		-u illuminate-database      \
		-u webman                   \
		-d display_errors=on                                \
		-d suppress_runtime_too_many_arguments_warning=1    \
		--input-file src.list
	mv start ../
