<div align="center">
  <br>
  <img src="docs/images/xubuntu.png" alt="Xubuntu screenshot">
  <h1><a href="https://github.com/astrophena">@astrophena</a> does dotfiles</h1>
  <p>Managed with [rcm](https://github.com/thoughtbot/rcm).</p>
</div>

<div align="center">
  <h2>Installation</h2>
</div>

<div align="center">
  <h3>Automatic</h3>
</div>

Run this ([source code](install.sh)):

        $ curl -fsSL https://git.io/JUsjr | bash

<div align="center">
  <h3>Manually</h3>
</div>

1. [Install rcm](https://github.com/thoughtbot/rcm#installation)
   if you haven't yet.

2. Check out this repository from [GitHub](https://github.com) to `~/src/dotfiles`:

        $ git clone https://github.com/astrophena/dotfiles ~/src/dotfiles

3. Install:

        $ RCRC="$HOME/src/dotfiles/rcrc" rcup -f

<div align="center">
  <h2>Updating</h2>
</div>

Just run `u`. It will pull the latest changes, symlink new files and reload `~/.bashrc`.

<div align="center">
  <h2>License</h2>
</div>

[MIT](LICENSE.md) © [Ilya Mateyko](https://github.com/astrophena), except files:

* `config/git/message` ([license](https://github.com/thoughtbot/dotfiles/blob/master/LICENSE))
* `termux/font.ttf` ([license](https://github.com/tonsky/FiraCode/blob/master/LICENSE))
* `bin/e` ([license](https://github.com/holman/dotfiles/blob/master/LICENSE.md))
* `bin/git-credential-netrc` ([license](https://github.com/git/git/blob/master/contrib/credential/netrc/git-credential-netrc.perl#L69))
