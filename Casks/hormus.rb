cask "hormus" do
  arch arm: "arm64"

  version "0.1.1,0.1.0"
  sha256 arm: "9090277669c00a867784297f484c95b827a426588ff07cfc1953950c393044b8"

  url "https://github.com/abhilashr1/hormus/releases/download/v#{version.csv.first}/Hormus%20-%20Database%20Client-#{version.csv.second}-#{arch}-mac.zip",
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
