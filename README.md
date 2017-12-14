# elm-pointer-draw

A small demo drawing app in elm, to test elm-pointer-events.

Build using `make build`, which requires [Nix](https://nixos.org/nix/).
Then visit `static/index.html`.

## Demo

A demo is live at http://robx.github.io/elm-pointer-draw/plain/ (master branch)
and http://robx.github.io/elm-pointer-draw/capture/ (capture branch).

## Pointer capture

The branch `capture` uses `setPointerCapture` to capture pointer up
events anywhere on screen. This is implemented in branches across
the dependencies `elm-lang/virtual-dom`, `elm-lang/html`,
`mpizenberg/elm-mouse-events`, `mpizenberg/elm-pointer-events` and
`mpizenberg/elm-pep`.
