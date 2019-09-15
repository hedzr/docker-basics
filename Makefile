
.PHONY: all
## all: build all docker containers
all: help


## build: build all basic docker containers
build: alpine ubuntu redis
	# hold it
	@echo "  > build for '$(DOCKER_USERNAME)'..."

## lint: verify the source codes (never used)
lint:
	@echo "  > lint '$(GITHUB_TOKEN)'..."

## test: test the syntax (never used)
test:
	@echo "  > test ..."

## publish: publish docker containers (never used)
publish:
	@echo "  > publish ..."






## alpine: build 'alpine' docker container
alpine: | ./alpine-base/ ./alpine-base-net/
	@echo done

.PHONY: ./alpine-base/
./alpine-base/:
	@echo "  > build alpine for '$(DOCKER_USERNAME)'..."
	$(MAKE) -C $@ # $(MAKECMDGOALS)

.PHONY: ./alpine-base-net/
./alpine-base-net/:
	$(MAKE) -C $@ # $(MAKECMDGOALS)


## ubuntu: build 'ubuntu-mod' docker container
ubuntu: | ./ubuntu-mod/
	@echo done

.PHONY: ./ubuntu-mod/
./ubuntu-mod/:
	$(MAKE) -C $@


## redis: build 'redis' docker container
redis: | ./redis-mod/
	@echo done

.PHONY: ./redis-mod/
./redis-mod/:
	$(MAKE) -C $@





## run-monitor: run 'monitor' containers
run-monitor:
	(cd ./monitor; $(MAKE) $(or $(cmd),start))
	# cmd=$(or $(cmd),start))
	@echo open grafana at: http://localhost:13000

.PHONY: ./monitor/ run-monitor
./monitor/:
	@echo '    @: $@'
	@echo '  cmd: $(or $(cmd),start)'
	$(MAKE) -C $@ $(or $(cmd),start)


## run-nacos: run 'nacos' containers. (could be: make run-nacos cmd=start,stop,logs,run,clear)
run-nacos: | ./nacos-std/
	@echo open nacos web ui at: http://localhost:8848/nacos

.PHONY: ./nacos-std/ run-nacos
./nacos-std/:
	$(MAKE) -C $@ $(or $(cmd),start)


## run-zipkin: run 'zipkin' containers. (could be: make run-zipkin cmd=start,stop,logs,run,clear)
run-zipkin: | ./zipkin-std/
	@echo open zipkin web ui at: http://localhost:9411/

.PHONY: ./zipkin-std/ run-zipkin
./zipkin-std/:
	$(MAKE) -C $@ $(or $(cmd),start)







.PHONY: printvars info help all
## printvars: print all envvars
printvars:
	$(foreach V, $(sort $(filter-out .VARIABLES,$(.VARIABLES))), $(info $(v) = $($(v))) )
	# Simple:
	#   (foreach v, $(filter-out .VARIABLES,$(.VARIABLES)), $(info $(v) = $($(v))) )

print-%:
	@echo $* = $($*)

## info: dump alternate envvars
info:
	@echo "     DOCKER_OPTS: $(DOCKER_OPTS)"
	@echo

## help: show this screen
help: Makefile
	@echo
	@echo " Choose a command run in "$(PROJECTNAME)":"
	@echo
	@sed -n 's/^##//p' $< | column -t -s ':' |  sed -e 's/^/ /'
	@echo


