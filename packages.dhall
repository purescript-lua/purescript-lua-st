let upstream-ps =
      https://github.com/purescript/package-sets/releases/download/psc-0.15.15-20240320/packages.dhall
        sha256:ae8a25645e81ff979beb397a21e5d272fae7c9ebdb021a96b1b431388c8f3c34

let upstream-lua =
      https://github.com/Unisay/purescript-lua-package-sets/releases/download/psc-0.15.15-20240336/packages.dhall
        sha256:2d548c8f4260d629ed65b9dfa83d93bf0abbeb5275a77a90a5d7c4a6df80bbe4

in  upstream-ps // upstream-lua
