# Copilot Instructions for dotfiles

## Project Architecture

This is a **topic-centric dotfiles** repo (forked from holman/dotfiles). Each
tool or area gets its own folder under the repo root.

## File Conventions

Within each topic folder, files are discovered automatically by name:

| File | Purpose | Loaded |
|------|---------|--------|
| `path.zsh` | `$PATH` setup | First |
| `*.zsh` | Config, aliases, env vars | Second |
| `completion.zsh` | Tab completion (after `compinit`) | Last |
| `install.sh` | Install/upgrade the tool | Via `script/install` |
| `*.symlink` | Symlinked to `$HOME` (without `.symlink` extension) | Via `script/bootstrap` |

## Adding a New Tool

1. Create a new folder: `toolname/`
2. Add an `install.sh` following this pattern:
   ```sh
   if test $(command -v brew)
   then
     if test $(command -v toolname)
     then
       echo 'Upgrading toolname ...'
       brew upgrade toolname
     else
       echo 'Installing toolname ...'
       brew install toolname
     fi
   fi
   ```
3. Add a `toolname.zsh` for shell config (activation, env vars, etc.)
4. Add `path.zsh` if the tool needs PATH modifications
5. Add `completion.zsh` if the tool provides shell completions
6. Update the **topics table** in `README.md`

## Style Guidelines

- **install.sh**: No shebang needed (exception: `homebrew/install.sh`). Use
  `test` over `[[ ]]`. Check for `brew` before using it. Keep echo messages
  lowercase and simple.
- **Shell scripts**: Use `zsh` conventions in `.zsh` files. Use POSIX-ish
  shell in `.sh` files.
- **Symlinks**: Name them `filename.symlink` — they become `~/.filename`.
- **No shebang** in most scripts — they are sourced, not executed directly.

## Key Scripts

- `script/bootstrap` — Initial setup: symlinks, git config, installs
- `script/install` — Runs all `install.sh` files across topics
- `bin/dot` — Day-to-day update command (runs installs, macOS defaults)

## Important Notes

- macOS-only scripts should guard with: `if test ! "$(uname)" = "Darwin"; then exit 0; fi`
- The `system/` topic handles core env, PATH, and aliases shared across all tools
- The `zsh/` topic owns the shell itself (prompt, config, fpath, zshrc)
- Aliases go in the relevant topic folder, not in a central file
