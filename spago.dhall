{ name = "purescript-lua-st"
, dependencies = [ "effect", "partial", "prelude", "tailrec", "unsafe-coerce" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs" ]
, backend =
    ''
    pslua \
    --foreign-path . \
    --ps-output output \
    --lua-output-file dist/Control_Monad_ST.lua \
    --entry Control.Monad.ST
    ''
}
