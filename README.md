# homebrew-hormus

Homebrew tap for installing Hormus on macOS.

## Publish

Create a separate GitHub repository named `homebrew-hormus` and push the contents of this directory there.

The tap name will then be:

```bash
brew tap abhilashr1/hormus
```

## Install

```bash
brew install --cask hormus
```

Or in one command without a prior tap:

```bash
brew install --cask abhilashr1/hormus/hormus
```

## Current limitation

Hormus is not Apple-notarized yet. Homebrew can install the app cleanly, but Gatekeeper may still block the first launch on macOS.

If that happens:

```bash
xattr -dr com.apple.quarantine "/Applications/Hormus - Database Client.app"
```

## Release update flow

1. Build and publish a GitHub Release from the main `hormus` repo.
2. Download or reuse the generated macOS zip artifact.
3. Run the helper script in this tap repo:

```bash
./scripts/update-cask.sh 0.1.0 "/path/to/Hormus - Database Client-0.1.0-arm64-mac.zip"
```

4. Commit and push the updated cask to `homebrew-hormus`.

## Notes

- The current cask supports Apple Silicon (`arm64`) Macs only.
- The URL format assumes release assets are uploaded to:
  `https://github.com/abhilashr1/hormus/releases/tag/v<version>`
