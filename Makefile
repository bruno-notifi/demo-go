SHELL := sh

MAKEFLAGS   += --warn-undefined-variables
MAKEFLAGS   += --no-builtin-rule

GOENV=GOOS=linux GOARCH=$(shell go env GOARCH) CGO_ENABLED=0 GO111MODULE=on

help: ## help 
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

db: ## db
	env $(GOENV) go build -o $@ ./db

app: ## app
	env $(GOENV) go build -o $@ ./app
