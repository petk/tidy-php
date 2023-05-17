# tidy.php

![Test workflow](https://github.com/petk/tidy-php/actions/workflows/tests.yaml/badge.svg)

Script to tidy whitespace - trailign spaces and tabs, convert end of lines to
LF or CRLF, trim trailing final newlines into a single newline and similar.

## About

There is a recurring and never-ending issue in many code projects with trailing
whitespace, missing final newlines at the end of the files, too many redundant
final newlines, end of line characters, and similar.

Beside the multiple preferred coding styles, also certain editors behave
differently and some automatically fix these when saving files. Some utilize
`.editorconfig` file by default, and some leave files intact.

Git also provides several
[configuration options](https://git-scm.com/docs/git-config) to deal with these
issues and detect them.

According to [POSIX](http://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap03.html#tag_03_206),
a line is a sequence of zero or more non-' <newline>' characters plus a
terminating '<newline>' character. [2] Files should normally have at least one
final newline character.

[C89 standard](https://port70.net/~nsz/c/c89/c89-draft.html#2.1.1.2) and
[above](https://port70.net/~nsz/c/c99/n1256.html#5.1.1.2) mention a final newline:

> A source file that is not empty shall end in a new-line character, which shall
> not be immediately preceded by a backslash character.

Newline characters:
* LF (`\n`) (*nix and Mac, default)
* CRLF (`\r\n`) (Windows)
- CR (`\r`) (old Mac, obsolete)

Although it is not mandatory for all files to have these issues fixed, a more
consistent and homogeneous approach brings less of commit differences issues and
a better development experience in certain text editors and IDEs.

This script aims to bring an initial solution to this issue and provide a more
consistent set of source code files across the php-src repository with a
simplistic yet still useful and powerful enough approach to tidy all files in a
given Git repository using command line.

Initial functionalities:
* trim trailing whitespace (spaces and tabs)
* trim multiple final newlines and allow optional configurable maximum number of
  final newlines
* insert missing final end of line
* convert end of line characters to the default LF (\n) or the CRLF for the
  files specifically set in the `.gitattributes`.
* default predefined blacklist and whitelist for using tidy.php in a php-src
  repository and any other provided repository, directory or file

Script also provides an optional future hooking into the CI step process where
file issues can be reported and identified in an automated manner.

## Tests

Tests are written in a simplistic manner using bash and with [Bats](https://github.com/bats-core/bats-core).

```bash
./tests/test.sh
```
