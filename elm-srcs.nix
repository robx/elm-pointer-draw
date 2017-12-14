{ fetchzip }: {
  "elm-lang/core" = {
    src = fetchzip {
      url = "https://github.com/elm-lang/core/archive/5.1.1.zip";
      sha256 = "0iww5kfxwymwj1748q0i629vyr1yjdqsx1fvymra6866gr2m3n19";
    };
    version = "5.1.1";
  };
  "elm-lang/dom" = {
    src = fetchzip {
      url = "https://github.com/elm-lang/dom/archive/1.1.1.zip";
      sha256 = "181yams19hf391dgvjxvamfxdkh49i83qfdwj9big243ljd08mpv";
    };
    version = "1.1.1";
  };
  "elm-lang/html" = {
    src = fetchzip {
      url = "https://github.com/elm-lang/html/archive/2.0.0.zip";
      sha256 = "08mxkcb1548fcvc1p7r3g1ycrdwmfkyma24jf72238lf7j4ps4ng";
    };
    version = "2.0.0";
  };
  "elm-lang/virtual-dom" = {
    src = fetchzip {
      url = "https://github.com/elm-lang/virtual-dom/archive/2.0.4.zip";
      sha256 = "1zydzzhpxivpzddnxjsjlwc18kaya1l4f8zsgs22wkq25izkin33";
    };
    version = "2.0.4";
  };
  "evancz/elm-graphics" = {
    src = fetchzip {
      url = "https://github.com/evancz/elm-graphics/archive/1.0.1.zip";
      sha256 = "05v39472l5zl5kv2jqggqnaz6vhlwnjhnkq2x50ijf36z1gmh5wb";
    };
    version = "1.0.1";
  };
  "mpizenberg/elm-mouse-events" = {
    src = fetchzip {
      url = "https://github.com/mpizenberg/elm-mouse-events/archive/2.0.0.zip";
      sha256 = "12k0kajd08l848yd0693585smffdbfwaz90fq6fm56ibyi874k55";
    };
    version = "2.0.0";
  };
  "mpizenberg/elm-pointer-events" = {
    src = fetchzip {
      url = "https://github.com/mpizenberg/elm-pointer-events/archive/1.0.5.zip";
      sha256 = "0vg8xi3syqdkq1qihg68vj91lfam88ag4pmzrladp131n1cr9fqw";
    };
    version = "1.0.5";
  };
}
