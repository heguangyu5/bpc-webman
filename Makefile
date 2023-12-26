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
		-u symfony-polyfill-php80           \
		-u symfony-contracts-translation    \
		-u symfony-component-translation    \
		-u carbon                           \
		-u webman                   \
		-d display_errors=on                                \
		-d max_execution_time=-1                            \
		-d memory_limit=1024M                               \
		-d suppress_runtime_too_many_arguments_warning=1    \
		--input-file src.list
	mv start ../

start-webman-admin:
	./bpc-prepare.sh src.list
	$(MAKE) -C ./build realstart-webman-admin

realstart-webman-admin:
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
		-u symfony-polyfill-php80           \
		-u symfony-contracts-translation    \
		-u symfony-component-translation    \
		-u carbon                           \
		-u webman                   \
		-d display_errors=on                                \
		-d max_execution_time=-1                            \
		-d memory_limit=1024M                               \
		-d suppress_runtime_too_many_arguments_warning=1    \
		--input-file src.list \
		--pseudo-class-list support\\Request \
		-u php-fileinfo             \
		-u php-gd                   \
		-u webman-captcha           \
		-u intervention-image       \
		-u webman-admin             \
		-o start-webman-admin
	mv start-webman-admin ../
