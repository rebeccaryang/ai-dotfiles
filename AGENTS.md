# Repository Guidelines

## Project Structure & Module Organization
- Root: shell and tool configs (e.g., `.zshrc`, `.bashrc`, `.gitconfig`, `Brewfile`).
- `scripts/`: setup utilities (`macos.sh`, `symlink.sh`, `strap-after-setup.sh`, `vscode-extensions.sh`).
- `.config/`: tool configs (e.g., `mise/config.toml`, `tombi/config.toml`).
- `vscode/`: editor settings and extension lists.
- CI: `.github/workflows/ci.yml` runs checks and `bootstrap.sh` flows on macOS/Linux.

## Build, Test, and Development Commands
- `mise run check` — code quality suite (Prettier, ShellCheck, shfmt, Tombi).
- `mise run format` — apply formatters (Prettier, shfmt, Tombi).
- `bash bootstrap.sh` — bootstrap a machine; prefer a VM or throwaway environment when testing.
- Example: `source <(mise activate zsh)` to ensure tools are on `PATH` in interactive shells.

## Coding Style & Naming Conventions
- EditorConfig: LF, final newline, 2‑space indent; Python uses 4 spaces.
- Shell: format with `shfmt`; lint with `shellcheck` (some zsh files are excluded from shfmt).
- JSON/Markdown: format with Prettier; commit/tag messages wrapped at 72 cols.
- File naming: shell scripts use kebab‑case with `.sh` (e.g., `vscode-extensions.sh`).

## Testing Guidelines
- No unit tests; rely on static checks and CI.
- Run `mise run check` locally before opening a PR.
- To validate bootstrapping, run `bash bootstrap.sh` on a fresh macOS/Linux VM. Do not run destructive changes on your primary machine.

## Commit & Pull Request Guidelines
- Commits: imperative present‑tense subject ≤50 chars; body wrapped at 72 cols. See `.gitmessage` for structure.
- Sign commits if possible (SSH signing supported in `.gitconfig`).
- PRs: concise description, linked issues, notable risk/rollback notes. Include sample commands or before/after snippets (e.g., changed `scripts/*.sh` behavior or VSCode settings).

## Security & Configuration Tips
- Never commit secrets or private keys; manage `.ssh/` and `.gnupg/` outside VCS.
- Review `Brewfile` changes carefully; large diffs can affect bootstrap reproducibility.
- Use `STRAP_*` env vars when invoking `bootstrap.sh` to test alternative sources/branches.
