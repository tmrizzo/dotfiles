# AGENTS.md — instructions for AI coding agents working in this repository

These dotfiles are stow-managed and published to a public GitHub repository
(tmrizzo/dotfiles). Treat every rule below as mandatory.

## Secrets

- Files matching `*.vars` (notably `~/.bashrc.d/secrets.vars`) contain live
  credentials. They are gitignored — never stage, commit, push, or print
  their contents.
- Never write API keys, tokens, internal hostnames, or credentials into any
  tracked file. Use `{env:VAR}` substitution in opencode config and
  environment variables everywhere else.
- If a secret is exposed in a session, say so prominently and recommend
  rotation; do not assume history scrubbing is sufficient.
- Never print, quote, or echo secret values — not even "to verify a fix".
  Reference them by variable name only (e.g. `$OPENWEATHER_API_KEY`).
- Never pass secrets on command lines, in URLs, or as inline arguments
  (they leak into shell history, process lists, and logs). Use environment
  variables, config files with `600` permissions, or credential helpers.
- Never disable, weaken, or work around a `.gitignore` rule (no
  `git add -f` on ignored paths, no deleting ignore entries to "unblock"
  a commit).
- Templates and examples (e.g. `secrets.vars.example`) must contain only
  placeholder values — `""`, `xxxx`, or `1234567890` — never real-looking
  keys.

## Security guardrails

- **History is public too.** Before adding any file that previously lived
  outside this repo, check `git log --all -p` for the file's origin — keys
  removed from HEAD still exist in history. Report any past exposure to
  the user.
- Before every commit, review `git status` and `git diff --staged`: never
  commit a file you have not read or that the user did not author in this
  session.
- Never run history-rewriting commands (`git filter-repo`,
  `git push --force`, `git reset --hard` on shared refs) — flag the need
  and let the user decide.
- Do not commit machine-local state: undo/swap/backup dirs, font binaries,
  caches, `bookmarks`, `servers`, or anything generated at runtime. These
  belong in `.gitignore`.
- Do not commit work-related configuration, internal hostnames, VPN
  endpoints, or employer-identifying settings. Work identities live in
  gitignored files outside this repo (e.g. `~/.gitconfig-work`).
- Do not introduce `curl ... | sh` / `wget ... | bash` patterns into any
  tracked script or README. Download to a file, inspect, then execute.
- Never store credentials in `.gitconfig` (`credential.helper store` with
  plaintext, embedded tokens in remote URLs). The accepted helpers are
  `cache` or `libsecret`.
- Any new file carrying secrets-by-design must be added to `.gitignore` in
  the same commit that introduces the file.
- Shell scripts that handle secrets should `umask 077` or `chmod 600` the
  files they write.

## Publishing

- Commit freely, but **never run `git push` unless the user explicitly asks**
  in the current conversation.
- Commits are SSH-signed; do not change signing configuration.
- Assume everything committed here is world-readable the moment it is
  pushed. If a change would be embarrassing or dangerous if public, it
  does not belong in this repo.

## Repository conventions

- Every top-level directory is a GNU stow package; new packages are picked
  up automatically by `install.sh` (no package lists to update in the
  script itself — but keep the README's package list accurate).
- Top-level files (README.md, AGENTS.md, .editorconfig, .gitignore,
  install.sh) are not stowed; `install.sh` only stows directories.
- Keep bash and zsh packages in parity for shared features.
- Shell files are tab-indented; markdown uses 4 spaces (see .editorconfig).
- Validate before committing: `bash -n` for shell files, parse checks for
  TOML/YAML/INI configs.
