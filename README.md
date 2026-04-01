# Rebecca's dotfiles

Your dotfiles are how you personalize your system. These are mine.

Forked from [holman/dotfiles](https://github.com/holman/dotfiles) and built
around a **topic-centric** architecture — each tool or area gets its own folder
with conventionally-named files that are automatically discovered.

## quick reminders

| Command | What it does |
|---------|-------------|
| `reload!` | Reload your shell configuration |
| `dot` | Run installs and keep environment up-to-date |

### where do I put aliases?

- **General purpose** → `zsh/aliases.zsh` (e.g. `ll`)
- **Work specific** → `work/aliases.zsh` (e.g. cd into work directories)
- **Tool specific** → under the relevant topic folder (e.g. `git/aliases.zsh`)

## topics

Everything's built around topic areas. If you're adding a new area — say,
"Java" — simply add a `java/` directory and put files in there.

### current topics

| Topic | What it manages |
|-------|----------------|
| `aws/` | AWS CLI |
| `data_stores/` | Databases (Postgres, Redis, etc.) |
| `functions/` | Shell utility functions |
| `gh/` | GitHub CLI |
| `git/` | Git config, aliases, completion |
| `heroku/` | Heroku CLI |
| `homebrew/` | Homebrew package manager |
| `macos/` | macOS system preferences & updates |
| `mise/` | mise version manager |
| `node/` | Node.js, nvm, Yarn |
| `php/` | PHP |
| `python/` | Python, pyenv |
| `ruby/` | Ruby, rbenv |
| `system/` | Core system env, PATH, aliases |
| `vim/` | Vim configuration |
| `vscode/` | VS Code |
| `work/` | Work-specific config |
| `xcode/` | Xcode Command Line Tools |
| `zsh/` | Zsh shell config, prompt, completion |

## components

There are a few special files in the hierarchy:

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **topic/\*.zsh**: Any files ending in `.zsh` get loaded into your
  environment.
- **topic/path.zsh**: Any file named `path.zsh` is loaded first and is
  expected to setup `$PATH` or similar.
- **topic/completion.zsh**: Any file named `completion.zsh` is loaded
  last and is expected to setup autocomplete.
- **topic/install.sh**: Any file named `install.sh` is executed when you run
  `script/install`. To avoid being loaded automatically, its extension is
  `.sh`, not `.zsh`.
- **topic/\*.symlink**: Any file ending in `*.symlink` gets symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `script/bootstrap`.

## install

```sh
git clone https://github.com/rmw/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
script/bootstrap
```

This will symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked within `~/.dotfiles`.

The main file you'll want to change right off the bat is `zsh/zshrc.symlink`,
which sets up a few paths that'll be different on your particular machine.

`dot` is a simple script that installs some dependencies, sets sane macOS
defaults, and so on. Tweak this script, and occasionally run `dot` from
time to time to keep your environment fresh and up-to-date. You can find
this script in `bin/`.

## thanks

Originally forked from [holman/dotfiles](https://github.com/holman/dotfiles),
which was in turn inspired by [Ryan Bates](http://github.com/ryanb)'
[dotfiles](http://github.com/ryanb/dotfiles).
