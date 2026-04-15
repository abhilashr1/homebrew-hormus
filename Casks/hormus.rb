cask "hormus" do
  arch arm: "arm64"

  version "0.1.0"
  sha256 arm: "53503025afee8132cd841ef991e47cc371e81a341a3f82f5dc2ae7a1147af0d7"

  url "https://github.com/abhilashr1/hormus/releases/download/v#{version}/Hormus%20-%20Database%20Client-#{version}-#{arch}-mac.zip",
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
