
.PHONY: all
all: build
# all: alpine redis ubuntu


build: alpine ubuntu redis
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
	@echo "  > build alpine for '$(DOCKER_USERNAME)'..."
	$(MAKE) -C $@ # $(MAKECMDGOALS)

.PHONY: ./alpine-base-net/
./alpine-base-net/:
	$(MAKE) -C $@ # $(MAKECMDGOALS)



ubuntu: | ./ubuntu-mod/
	@echo done

.PHONY: ./ubuntu-mod/
./ubuntu-mod/:
	$(MAKE) -C $@



redis: | ./redis-mod/
	@echo done

.PHONY: ./redis-mod/
./redis-mod/:
	$(MAKE) -C $@




