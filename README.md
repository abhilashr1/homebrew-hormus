# homebrew-hormus

Official Homebrew tap for installing Hormus on macOS.

Hormus is a developer-first desktop database client for PostgreSQL and MySQL. This tap publishes the macOS cask used by:

```bash
brew install --cask abhilashr1/hormus/hormus
```

## Install

Tap the repository, then install:

```bash
brew tap abhilashr1/hormus
brew install --cask hormus
```

Or install directly in one command:

```bash
brew install --cask abhilashr1/hormus/hormus
```

## Requirements

- macOS Big Sur or newer
- Apple Silicon (`arm64`) Mac

## First Launch

Hormus is currently distributed as an unsigned, non-notarized macOS build. Homebrew can install it normally, but macOS may still block the first launch.

If Gatekeeper blocks the app, remove the quarantine attribute and open it again:

```bash
xattr -dr com.apple.quarantine "/Applications/Hormus - Database Client.app"
```

## Updating The Cask

This repository is intended to live as a separate GitHub tap repository named `homebrew-hormus`.

When publishing a new release:

1. Publish the GitHub release from the main `hormus` repository.
2. Download the Apple Silicon DMG artifact for that release.
3. Update the cask checksum and version mapping:

```bash
./scripts/update-cask.sh 0.1.3 0.1.2 "/path/to/Hormus - Database Client-0.1.2-arm64.dmg"
```

4. Commit and push the updated tap contents to `homebrew-hormus`.

## Version Mapping

Hormus releases currently track two version values in the cask:

- The GitHub release tag version, such as `v0.1.3`
- The packaged macOS artifact version embedded in the filename, such as `0.1.2`

That allows the tap to support release assets where the GitHub tag and packaged app version differ.
