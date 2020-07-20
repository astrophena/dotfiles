<div align="center">
  <br>
  <img src="images/wsl2.png" alt="WSL2 screenshot">
  <h1><a href="https://github.com/astrophena">@astrophena</a> does dotfiles</h1>
</div>

A set of configuration files that defines my computing environment.

Managed with [rcm](https://github.com/thoughtbot/rcm).

## Installation

1. [Install rcm](https://github.com/thoughtbot/rcm#installation)
   if you haven't yet.

2. Check out this repository from [GitHub](https://github.com) to `~/src/dotfiles`:

```sh
~ -> git clone https://github.com/astrophena/dotfiles ~/src/dotfiles
```

3. Install:

```sh
~ -> RCRC="$HOME/src/dotfiles/rcrc" rcup
```

# License

[MIT](LICENSE.md) © [Ilya Mateyko](https://github.com/astrophena), except files:

* `termux/font.ttf` ([license](https://github.com/tonsky/FiraCode/blob/master/LICENSE))
* `vim/colors/base16-tomorrow-night.vim` ([license](https://github.com/chriskempson/base16-vim/blob/master/LICENSE.md))
* `bin/e` ([license](https://github.com/holman/dotfiles/blob/master/LICENSE.md))
* `bin/git-credential-netrc` ([license](https://github.com/git/git/blob/master/contrib/credential/netrc/git-credential-netrc.perl#L69))
