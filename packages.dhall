{-
Welcome to your new Dhall package-set!

Below are instructions for how to edit this file for most use
cases, so that you don't need to know Dhall to use it.

## Use Cases

Most will want to do one or both of these options:
1. Override/Patch a package's dependency
2. Add a package not already in the default package set

This file will continue to work whether you use one or both options.
Instructions for each option are explained below.

### Overriding/Patching a package

Purpose:
- Change a package's dependency to a newer/older release than the
    default package set's release
- Use your own modified version of some dependency that may
    include new API, changed API, removed API by
    using your custom git repo of the library rather than
    the package set's repo

Syntax:
where `entityName` is one of the following:
- dependencies
- repo
- version
-------------------------------
let upstream = --
in  upstream
  with packageName.entityName = "new value"
-------------------------------

Example:
-------------------------------
let upstream = --
in  upstream
  with halogen.version = "master"
  with halogen.repo = "https://example.com/path/to/git/repo.git"

  with halogen-vdom.version = "v4.0.0"
  with halogen-vdom.dependencies = [ "extra-dependency" ] # halogen-vdom.dependencies
-------------------------------

### Additions

Purpose:
- Add packages that aren't already included in the default package set

Syntax:
where `<version>` is:
- a tag (i.e. "v4.0.0")
- a branch (i.e. "master")
- commit hash (i.e. "701f3e44aafb1a6459281714858fadf2c4c2a977")
-------------------------------
let upstream = --
in  upstream
  with new-package-name =
    { dependencies =
       [ "dependency1"
       , "dependency2"
       ]
    , repo =
       "https://example.com/path/to/git/repo.git"
    , version =
        "<version>"
    }
-------------------------------

Example:
-------------------------------
let upstream = --
in  upstream
  with benchotron =
      { dependencies =
          [ "arrays"
          , "exists"
          , "profunctor"
          , "strings"
          , "quickcheck"
          , "lcg"
          , "transformers"
          , "foldable-traversable"
          , "exceptions"
          , "node-fs"
          , "node-buffer"
          , "node-readline"
          , "datetime"
          , "now"
          ]
      , repo =
          "https://github.com/hdgarrood/purescript-benchotron.git"
      , version =
          "v7.0.0"
      }
-------------------------------
-}
let upstream =
      https://github.com/purescript/package-sets/releases/download/psc-0.15.7-20230408/packages.dhall
        sha256:eafb4e5bcbc2de6172e9457f321764567b33bc7279bd6952468d0d422aa33948

in  upstream
  with homogeneous =
    { dependencies =
        [ "arrays"
          , "assert"
          , "control"
          , "effect"
          , "enums"
          , "foldable-traversable"
          , "foreign-object"
          , "lists"
          , "maybe"
          , "partial"
          , "prelude"
          , "tuples"
          , "typelevel-prelude"
          , "unsafe-coerce"
          , "variant"
          ]
    , repo = "https://github.com/paluh/purescript-homogeneous.git"
    , version = "v0.4.0"
    }
  with hyrule =
    { dependencies =
        [ "arrays"
          , "control"
          , "datetime"
          , "debug"
          , "effect"
          , "either"
          , "filterable"
          , "foldable-traversable"
          , "js-timers"
          , "maybe"
          , "newtype"
          , "now"
          , "ordered-collections"
          , "prelude"
          , "refs"
          , "st"
          , "tuples"
          , "unsafe-coerce"
          , "unsafe-reference"
          , "web-events"
          , "web-html"
          , "web-uievents"
          , "monoid-extras"
          ]
    , repo =
        "https://github.com/mikesol/purescript-hyrule.git"
    , version = "v2.0.0"
    }
  with halogen-vdom =
    { dependencies =
      [ "bifunctors"
      , "effect"
      , "foreign"
      , "foreign-object"
      , "maybe"
      , "prelude"
      , "refs"
      , "tuples"
      , "unsafe-coerce"
      , "web-html"
      ]
    , repo =
        "ssh://git@ssh.bitbucket.juspay.net/picaf/purescript-halogen-vdom.git"
    , version = "v3.1.0"
    }
  with tracker =
    { dependencies =
      [ "effect"
      , "prelude"
      , "presto"
      , "arrays"
      , "debug"
      , "foldable-traversable"
      , "foreign"
      , "foreign-generic"
      , "foreign-object"
      , "maybe"
      , "strings"
      ]
    , repo = "ssh://git@ssh.bitbucket.juspay.net/picaf/purescript-tracker.git"
    , version = "v2.1.26"
    }
  with backtrack =
    { dependencies =
      [ "control", "effect", "prelude", "tailrec", "transformers" ]
    , repo = "https://github.com/juspay/purescript-backtrack.git"
    , version = "update/github-purescript-backtrack-repo"
    }
  with foreign-generic =
    { dependencies =
      [ "arrays"
      , "assert"
      , "bifunctors"
      , "console"
      , "control"
      , "effect"
      , "either"
      , "exceptions"
      , "foldable-traversable"
      , "foreign"
      , "foreign-object"
      , "identity"
      , "lists"
      , "maybe"
      , "newtype"
      , "partial"
      , "prelude"
      , "record"
      , "strings"
      , "transformers"
      , "tuples"
      , "typelevel-prelude"
      , "unsafe-coerce"
      ]
    , repo =
        "ssh://git@ssh.bitbucket.juspay.net/fram/purescript-foreign-generic.git"
    , version = "v12.0.1"
    }
  with presto =
    { dependencies =
      [ "aff"
      , "avar"
      , "datetime"
      , "effect"
      , "either"
      , "exceptions"
      , "exists"
      , "foldable-traversable"
      , "foreign"
      , "foreign-generic"
      , "foreign-object"
      , "free"
      , "identity"
      , "maybe"
      , "newtype"
      , "parallel"
      , "prelude"
      , "record"
      , "transformers"
      , "tuples"
      , "unsafe-coerce"
      ]
    , repo = "ssh://git@ssh.bitbucket.juspay.net/picaf/purescript-presto.git"
    , version = "v2.2.3"
    }
  with presto-dom =
    { dependencies =
      [ "effect"
      , "prelude"
      , "hyrule"
      , "halogen-vdom"
      , "tracker"
      , "aff"
      , "arrays"
      , "control"
      , "either"
      , "exceptions"
      , "foldable-traversable"
      , "foreign"
      , "foreign-generic"
      , "foreign-object"
      , "functions"
      , "integers"
      , "js-timers"
      , "lists"
      , "maybe"
      , "newtype"
      , "refs"
      , "presto"
      , "strings"
      , "transformers"
      , "tuples"
      , "typelevel-prelude"
      , "unsafe-coerce"
      , "web-dom"
      , "web-events"
      ]
    , repo =
        "ssh://git@ssh.bitbucket.juspay.net/picaf/purescript-presto-dom.git"
    , version = "ny-to-react"
    }
  with ui-components =
    { dependencies = [ "console", "effect", "prelude", "presto", "presto-dom" ]
    , repo = "ssh://git@ssh.bitbucket.juspay.net/picaf/ui-components.git"
    , version = "event-recorder"
    }
  with hyper-buffer =
    { dependencies =
      [ "console"
      , "effect"
      , "prelude"
      , "presto"
      , "tracker"
      , "js-uri"
      , "aff"
      , "avar"
      , "either"
      , "foldable-traversable"
      , "foreign"
      , "foreign-generic"
      , "foreign-object"
      , "integers"
      , "lists"
      , "maybe"
      , "nonempty"
      , "strings"
      , "transformers"
      ]
    , repo = "ssh://git@ssh.bitbucket.juspay.net/picaf/hyper-buffer.git"
    , version = "v2.2.9"
    }
  with purescript-stack =
    { dependencies = [ "tuples", "console", "maybe", "lists" ]
    , repo = "https://github.com/ashutoshdas96/purescript-stack"
    , version = "v1.0.0"
    }
  with lite-decode =
    { dependencies =
      [ "arrays"
      , "console"
      , "either"
      , "foreign"
      , "foreign-generic"
      , "foreign-object"
      , "maybe"
      , "newtype"
      , "prelude"
      , "transformers"
      , "typelevel-prelude"
      , "unsafe-coerce"
      , "control"
      ]
    , repo = "ssh://git@ssh.bitbucket.juspay.net/picaf/hyper-decoder.git"
    , version = "v1.1.2"
    }
  with record-extras =
    { dependencies =
      [ "typelevel-prelude"
      , "record"
      , "functions"
      , "lists"
      , "arrays"
      , "prelude"
      , "tuples"
      ]
    , repo = "https://github.com/justinwoo/purescript-record-extra.git"
    , version = "v5.0.1"
    }
  with purs-react =
    { dependencies =
      [ "aff"
      , "avar"
      , "console"
      , "debug"
      , "effect"
      , "either"
      , "exceptions"
      , "foreign"
      , "foreign-object"
      , "maybe"
      , "prelude"
      , "record"
      , "tuples"
      , "unsafe-coerce"
      , "react-basic-hooks"
      ]
    , repo = "ssh://git@ssh.bitbucket.juspay.net/picaf/purs-react.git"
    , version = "ny-to-react"
    }
  with react-basic-hooks =
    { dependencies =
      [ "aff"
      , "aff-promise"
      , "bifunctors"
      , "console"
      , "control"
      , "datetime"
      , "effect"
      , "either"
      , "exceptions"
      , "foldable-traversable"
      , "functions"
      , "indexed-monad"
      , "integers"
      , "maybe"
      , "newtype"
      , "now"
      , "nullable"
      , "ordered-collections"
      , "prelude"
      , "react-basic"
      , "refs"
      , "tuples"
      , "type-equality"
      , "unsafe-coerce"
      , "unsafe-reference"
      , "web-html"
      ]
    , repo =
        "ssh://git@ssh.bitbucket.juspay.net/picaf/purescript-react-basic-hooks.git"
    , version = "v9.2.1"
    }

