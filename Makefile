ifneq ($(shell git status -z),)
$(info uncommitted changes: exiting!)
all:
else

date_string := $(shell date +"%F")

commit_tag := $(shell git rev-parse --verify --short HEAD)

output_name := paper
output_name := $(output_name)-$(date_string)
output_name := $(output_name)-$(commit_tag)
output_name := $(output_name).docx

$(info output_name: $(output_name))
all:
	docker run --rm \
	--volume $(shell pwd):/workdir \
	--tty alexpenson/pandocker-alpine \
	./build.sh
endif
