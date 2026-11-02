cask "push2talk" do
  version "0.1.2"
  sha256 "77f826664a9c5ba28bca27b0bacfdde5237abab462740c14ee5c4589d3de1cd4"

  url "https://github.com/ut0s/homebrew-push2talk/releases/download/v#{version}/Push2Talk-#{version}.zip"
  name "Push2Talk"
  desc "Hold right Option to use macOS Dictation, release to finish, with optional Enter submission"
  homepage "https://github.com/ut0s/homebrew-push2talk"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura
  app "Push2Talk.app"

  zap trash: "~/Library/Preferences/com.ut0s.Push2Talk.plist"

  caveats do
    <<~EOS
      First launch:
        open "#{appdir}/Push2Talk.app"

      macOS may block apps that have not been notarized by Apple.
      Only if you trust the source, verify the app signature first:
        codesign --verify --deep --strict --verbose=2 "#{appdir}/Push2Talk.app"
      Only after verification succeeds, remove quarantine and launch the app:
        xattr -dr com.apple.quarantine "#{appdir}/Push2Talk.app"
        open "#{appdir}/Push2Talk.app"
      Signature verification does not establish the developer's identity.
      If verification fails, obtain a fresh copy before proceeding.

      Setup after launch:
        1. Enable Dictation in System Settings > Keyboard > Dictation.
        2. Set the Dictation shortcut to press right Command twice.
           If you use another shortcut, select the matching one in Push2Talk.
        3. Allow Push2Talk in System Settings > Privacy & Security > Accessibility.
           If key monitoring cannot start, also check Input Monitoring.
        4. Complete initial setup and recheck permissions in Push2Talk's settings.
           Restart Push2Talk if permission changes are not reflected.

      To dictate, focus a text field, hold right Option, and speak; release to finish.
      Automatic Enter submission is off by default.
      Show these instructions again: brew info --cask ut0s/push2talk/push2talk
    EOS
  end
end
