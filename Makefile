
.PHONY: all
all: build
# all: alpine redis ubuntu


build: alpine
	# hold it
	@echo "  > build for '$(DOCKER_USERNAME)'..."

lint:
	@echo "  > lint '$(GITHUB_TOKEN)'..."

test:
	@echo "  > test ..."

publish:
	@echo "  > publish ..."



alpine: | ./alpine-base/ ./alpine-base-net/
	@echo done

.PHONY: ./alpine-base/
./alpine-base/:
	$(MAKE) -C $@ # $(MAKECMDGOALS)

.PHONY: ./alpine-base-net/
./alpine-base-net/:
	$(MAKE) -C $@ # $(MAKECMDGOALS)



redis: | ./redis-mod/
	@echo done

.PHONY: ./redis-mod/
./redis-mod/:
	$(MAKE) -C $@



ubuntu: | ./ubuntu-mod/
	@echo done

.PHONY: ./ubuntu-mod/
./ubuntu-mod/:
	$(MAKE) -C $@



