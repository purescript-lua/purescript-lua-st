{ name = "purescript-lua-st"
, dependencies = [ "partial", "prelude", "tailrec", "unsafe-coerce" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs" ]
, backend =
    ''
    pslua \
    --foreign-path . \
    --ps-output output \
    --lua-output-file dist/Control_Monad_ST_Class.lua \
    --entry Control.Monad.ST.Class
    ''
}
