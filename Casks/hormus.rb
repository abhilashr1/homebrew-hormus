cask "hormus" do
  arch arm: "arm64"

  version "0.1.1"
  sha256 arm: "84acf59353781d9bbecf95fc8bc0c5f440bcb9a616976d50e6caaf2d1906f392"

  url "https://github.com/abhilashr1/hormus/releases/download/v#{version}/Hormus.-.Database.Client-0.1.0-#{arch}.dmg",
      verified: "github.com/abhilashr1/hormus/"
  name "Hormus"
  desc "Developer-first desktop database client"
  homepage "https://github.com/abhilashr1/hormus"

  depends_on arch: :arm64
  depends_on macos: ">= :big_sur"

  app "Hormus - Database Client.app"

  caveats do
    <<~EOS
      Hormus is currently distributed as an unsigned, non-notarized macOS build.

      Homebrew installs the app bundle, but macOS may still block first launch.
      If that happens, clear the quarantine attribute and open the app again:

        xattr -dr com.apple.quarantine "/Applications/Hormus - Database Client.app"
    EOS
  end

  zap trash: [
    "~/Library/Application Support/Hormus - Database Client",
    "~/Library/Logs/Hormus - Database Client",
    "~/Library/Preferences/com.hormus.databaseclient.plist",
    "~/Library/Saved Application State/com.hormus.databaseclient.savedState",
  ]
end
