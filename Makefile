ifneq ($(shell git status -z),)
$(info uncommitted changes: exiting!)
all:
else
all:
	docker run --rm \
	--volume $(shell pwd):/workdir \
	--tty alexpenson/pandocker-alpine \
	./build.sh
endif
