# purescript-lua-st

[![CI](https://github.com/purescript-lua/purescript-lua-st/actions/workflows/ci.yml/badge.svg)](https://github.com/purescript-lua/purescript-lua-st/actions/workflows/ci.yml)

The ST effect, for safe local mutation. This is the Lua fork of
[`purescript-st`](https://github.com/purescript/purescript-st) for the
[pslua](https://github.com/purescript-lua/purescript-lua) compiler backend: it
keeps the upstream PureScript API and replaces the JavaScript FFI with Lua that
runs on Lua 5.1.

## Installation

It ships in the [purescript-lua package set](https://github.com/purescript-lua/purescript-lua-package-sets):

```
spago install st
```

## Documentation

The API matches upstream, so the module docs are
[published on Pursuit](https://pursuit.purescript.org/packages/purescript-st).
