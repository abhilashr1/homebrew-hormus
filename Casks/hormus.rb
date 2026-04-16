cask "hormus" do
  arch arm: "arm64"

  version "0.1.3,0.1.2"
  sha256 arm: "68ee8d61864aabed452b9795f92690ffe5aac8694a985746c3174f12439f8bb5"

  url "https://github.com/abhilashr1/hormus/releases/download/v#{version.csv.first}/Hormus.-.Database.Client-#{version.csv.second}-#{arch}.dmg",
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
