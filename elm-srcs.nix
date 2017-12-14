{ fetchzip, fetchgit }: {
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
    src = fetchgit {
      url = "https://github.com/robx/html.git";
      rev = "2ea7b8e230a79e8082c5803b80158ef4a4254470";
      sha256 = "079wk9fafld8868hv0j0v1g7jagczvcbpi4b3y7kb17xkzhs4jav";
    };
    version = "2.0.0";
  };
  "elm-lang/virtual-dom" = {
    src = fetchgit {
      url = "https://github.com/robx/virtual-dom.git";
      rev = "41853b2b8e14f8a12dedd3cc4195187fc1aff0de";
      sha256 = "";
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
    src = fetchgit {
      url = "https://github.com/robx/elm-mouse-events.git";
      rev = "e88c9f42d58e16725271c1cdcdbf4265a7b60a0a";
      sha256 = "1mnns8dr051527lijk4sdwi3y0k5i6g9rl9nzh2xdbipphhyq2wz";
    };
    version = "2.0.0";
  };
  "mpizenberg/elm-pointer-events" = {
    src = fetchgit {
      url = "https://github.com/robx/elm-pointer-events.git";
      rev = "dece13d997479bd5217e32dda204a2b862cbf6ab";
      sha256 = "1my3fx2zsh8vzgyg2vfrfgafvwbbv2m5v073im3w2cxnjf1dbg6c";
    };
    version = "1.0.5";
  };
}
