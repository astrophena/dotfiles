# `~/src/dotfiles`

this is astrophena's dotfiles.

## supported environments

* [google cloud shell](https://cloud.google.com/shell)
* [git for windows](https://gitforwindows.org)
* [termux](https://termux.com)
* [ubuntu](https://ubuntu.com)

## git for windows notes

set `MSYS` environment variable to: `winsymlinks:nativestrict`.

## install

run `bin/dot`. it will symlink the appropriate files in `~/src/dotfiles` to home directory,
install some dependencies, and so on.  occasionally run `bin/dot` from time to
time to keep your environment fresh and up-to-date.
