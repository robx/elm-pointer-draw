.PHONY: all build format

all: build

build:
	nix-build

format:
	elm-format --yes src
