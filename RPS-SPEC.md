Ruby Packaging Standard, 0.5-draft
==================================

The aim of [this document](http://chneukirchen.github.com/rps) is
two-fold.  First, to specify a common structure of how a Ruby package
distributed as source (that is, but not limited to, development
directories, version-controlled repositories, .tar.gz, Gems, ...)
should conform to.

Second, to document common and proven ways to structure Ruby packages,
and to point out certain anti-patterns that sneaked into common use.
It is by intent not to innovate.

(See [RFC 2119](http://www.ietf.org/rfc/rfc2119.txt) for use of
MUST, SHOULD, SHALL.)

## General

Project names SHOULD only contain underscores as separators in their names.

If a project is an enhancement, plugin, extension, etc. for some other
project it SHOULD contain a dash in the name between the original name
and the project's name.

File names and directory structure SHOULD correspond like this:

    Library: foo-bar
    Directory: lib/foo/bar
    Namespace: Foo::Bar
    
    Library: foo_bar
    Directory: lib/foo_bar
    Namespace: FooBar

## Library files

Library code MUST reside in `lib/`.

Libraries SHOULD use a directory as namespace, e.g. `lib/foo.rb` and
`lib/foo/**`.  (And, see above, thus limit their code to a module `Foo`.)

Libraries SHOULD NOT require code of the project that are outside of `lib/`.

Libraries MUST NOT `require 'rubygems'` or modify the `$LOAD_PATH`,
unless they are specifically made for doing that (e.g. package managers).

Ruby library files MUST end with `.rb.`

Library files SHOULD be installed with mode 0644.

## Executables

Executables MUST reside in `bin/`.

Ruby executables SHOULD have a shebang line using `env`:

    #!/usr/bin/env ruby

Executables SHOULD NOT require code of the project that are outside of `lib/`.

Executables SHOULD NOT `require 'rubygems'` or modify the `$LOAD_PATH`.

Executable files SHOULD NOT end with `.rb`.

Executable files SHOULD be installed with mode 0755.

## Extensions to core classes

Extensions to core classes are methods that extend the Ruby core classes like
String or Array.

Extensions to core classes MUST reside in the `core_ext/` subdirectory of the
library directory, e.g. `lib/foo/core_ext/`.

Each file in `core_ext/` SHOULD contain code that extends only one class.

Each file in `core_ext/` SHOULD be named after the class it extends, e.g.
`core_ext/string.rb` for String extensions.

## Extensions

Extensions are directories which contain a `extconf.rb`.

Extensions SHOULD reside in `ext/`.

Extensions SHOULD be buildable with `ruby extconf.rb; make`.

Files ending with `.so`, `.dylib`, `.bundle`, `.dll`, `.exe` are
considered compiled extensions to be installed.

Extensions SHOULD be installed into an architecture-specific directory.

## Data files

Data files and resources of the project belong to `data/$projectname`.

Data files SHOULD be found at runtime using:

    require 'rbconfig'
    require 'rbconfig/datadir'
    path = Config.datadir('$projectname')

XXX find a way to make this work from checkouts, and with several
package management mechanisms being used.

## Tests

Tests SHOULD reside in `test/` or `spec/`.

## History

* 09apr2010: First initial draft.
* 10apr2010: Fix binary permissions.
* 10apr2010: Add data files.
* 11apr2010: Formatting, more detail on Extensions and Data files.
