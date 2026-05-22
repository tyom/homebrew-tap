# tyom/homebrew-tap

Homebrew tap for [tyom](https://github.com/tyom)'s tools.

## Available formulae

### [repo-intel](https://github.com/tyom/repo-intel)

Generate a self-contained HTML contributor-stats dashboard for any git repo.

```bash
brew install tyom/tap/repo-intel
```

### [kcm](https://github.com/tyom/kcm)

Keychain Master — secure secret management for macOS with `.env` integration.

```bash
brew install tyom/tap/kcm
```

## Usage

```bash
brew tap tyom/tap          # add the tap (optional; install does it for you)
brew install tyom/tap/<formula>
```

> Each formula is bumped automatically by its source repo's release workflow on every
> tagged release — do not hand-edit the files in `Formula/`. See the
> [repo-intel](https://github.com/tyom/repo-intel/blob/main/.github/workflows/release.yml)
> and [kcm](https://github.com/tyom/kcm/blob/main/.github/workflows/release.yml)
> release workflows.
