{-
Welcome to a Spago project!
You can edit this file as you like.

Need help? See the following resources:
- Spago documentation: https://github.com/purescript/spago
- Dhall language tour: https://docs.dhall-lang.org/tutorials/Language-Tour.html

When creating a new Spago project, you can use
`spago init --no-comments` or `spago init -C`
to generate this file without the comments in this block.
-}
{ name = "my-project"
, dependencies =
  [ "aff"
  , "arrays"
  , "avar"
  , "backtrack"
  , "bifunctors"
  , "console"
  , "control"
  , "datetime"
  , "debug"
  , "effect"
  , "either"
  , "enums"
  , "exceptions"
  , "foldable-traversable"
  , "foreign"
  , "foreign-generic"
  , "foreign-object"
  , "free"
  , "functions"
  , "halogen-vdom"
  , "homogeneous"
  , "hyrule"
  , "integers"
  , "js-date"
  , "js-timers"
  , "lazy"
  , "lists"
  , "lite-decode"
  , "maybe"
  , "newtype"
  , "nonempty"
  , "now"
  , "nullable"
  , "numbers"
  , "open-memoize"
  , "ordered-collections"
  , "partial"
  , "prelude"
  , "presto"
  , "presto-dom"
  , "purescript-stack"
  , "purs-react"
  , "react-basic"
  , "react-basic-hooks"
  , "record"
  , "record-extras"
  , "refs"
  , "strings"
  , "tracker"
  , "transformers"
  , "tuples"
  , "ui-components"
  , "unfoldable"
  , "unsafe-coerce"
  , "web-events"
  , "hyper-buffer"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
