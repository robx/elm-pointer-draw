.PHONY: all build format

all: build

build:
	elm-make Main.elm --yes --output ./static/Main.js

format:
	elm-format --yes .
