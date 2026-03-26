.PHONY: build test logs dist
.DEFAULT_GOAL: help

NO_COLOR = \033[0m
INFO_COLOR = \033[34m
SUCCESS_COLOR = \033[32m
ERROR_COLOR = \033[31m

help:
	@awk -F ':|##' '/^[^\t].+?:.*?##/ {printf "\033[36m%-30s\033[0m %s\n", $$1, $$NF}' $(MAKEFILE_LIST)

clean:
	@rm -rf vendor/bundle .bundle Gemfile.lock

install: ## Install project
	@bundle config set --local path vendor/bundle
	@bundle install

start: ## Start server and client
	@bundle exec jekyll serve --livereload --port 4000
