# homebrew-glimmer

Homebrew tap for [Glimmer](https://github.com/Se7enbrc/glimmer) - a native
game-streaming client for Sunshine and Moonlight hosts.

## Install

```bash
brew tap se7enbrc/glimmer
brew trust --tap se7enbrc/glimmer   # Homebrew asks this of every third-party tap
brew install --cask glimmer
```

Apple silicon, macOS 26 (Tahoe) or newer. The cask installs the notarized
Developer ID build; Glimmer keeps itself up to date via Sparkle, so `brew
upgrade` is not required (the cask is bumped on each release anyway).

See the [main repo](https://github.com/Se7enbrc/glimmer) for details.
