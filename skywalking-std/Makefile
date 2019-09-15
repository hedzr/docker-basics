
.PHONY: help all
all: help
## help: show this screen
help: Makefile
	@echo
	@echo " Choose a command run in "$(PROJECTNAME)":"
	@echo
	@sed -n 's/^##//p' $< | column -t -s ':' |  sed -e 's/^/ /'
	@echo

## start: run docker-compose containers as a daemon, =run-as-daemon
start:
	@docker-compose up -d

## run-as-daemon: run docker-compose containers as a daemon
run-as-daemon:
	@docker-compose up -d

## run: run docker-compose containers under current console
run:
	@docker-compose up

## logs: capture the logging outputs
logs:
	@docker-compose logs -f $@

## stop: stop the docker-compose containers
stop:
	@docker-compose stop

## clear: clear the running/stopped containers, clear its networks/volumes/...
clear: stop
	@docker-compose rm -f
	@docker-compose down -v



