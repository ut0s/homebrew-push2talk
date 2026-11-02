# Push2Talk

macOS 13 or later. Hold right Option to start macOS Dictation; release to finish. Automatic Enter submission is optional and off by default.

```sh
brew tap ut0s/push2talk
brew install --cask push2talk
open -a Push2Talk
```

Enable Dictation in System Settings → Keyboard and set its shortcut to right Command twice.
Grant Push2Talk Accessibility permission and complete setup in the menu bar.
The app settings support other double-press Dictation shortcuts.

## First launch

Ad-hoc builds are not notarized by Apple and macOS may block downloaded copies.
For a copy from a source you trust, verify its signature first:

```sh
codesign --verify --deep --strict --verbose=2 /Applications/Push2Talk.app
```

Only after verification succeeds, remove quarantine from this app and launch it:

```sh
xattr -dr com.apple.quarantine /Applications/Push2Talk.app
open -a Push2Talk
```

If verification fails, obtain a fresh copy before proceeding.
Developer ID signed and notarized builds do not normally need this step.

## Update

```sh
brew update
brew upgrade --cask push2talk
```

If Accessibility permission stops working after an update, re-register Push2Talk
in System Settings and restart the app.
