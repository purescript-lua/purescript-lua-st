let upstream-ps =
      https://github.com/purescript/package-sets/releases/download/psc-0.15.15-20240320/packages.dhall
        sha256:ae8a25645e81ff979beb397a21e5d272fae7c9ebdb021a96b1b431388c8f3c34

let upstream-lua =
      https://github.com/Unisay/purescript-lua-package-sets/releases/download/psc-0.15.15-20240335/packages.dhall
        sha256:d2d70b8697adba3ba896e979b4860b59363833a13d66a70337c781d2e0e53ead

in  upstream-ps // upstream-lua
