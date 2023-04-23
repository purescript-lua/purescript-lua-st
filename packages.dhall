let upstream-ps =
      https://github.com/purescript/package-sets/releases/download/psc-0.15.8-20230422/packages.dhall
        sha256:53dd9dfa0c0c3e8bd922dc49dfb3661bc8475c7166f079831440bb586b3cc052

let upstream-lua =
      https://github.com/Unisay/purescript-lua-package-sets/releases/download/psc-0.15.8-20230422-draft6/packages.dhall
        sha256:43bb60760ade6aa4d3b56e6b93bca61955fd2b5754b90e82b55c284f841cc497

in  upstream-ps // upstream-lua
