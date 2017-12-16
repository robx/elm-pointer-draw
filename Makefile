.PHONY: all build format

all: build

build:
	elm-make Main.elm --yes --output ./static/Main.js

format:
	elm-format --yes .

.PHONY: deps
deps:
	cd elm-pointer-events && elm-make --yes
	elm-make --yes || true
	./patch.sh mpizenberg/elm-pointer-events 1.0.4 $(shell pwd)/elm-pointer-events
