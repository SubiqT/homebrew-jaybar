cask "jaybar" do
  version "1.0.0"
  sha256 "REPLACE_WITH_ACTUAL_SHA256"

  url "https://github.com/SubiqT/jaybar/releases/download/v#{version}/jaybar-#{version}-macos.zip"
  name "jaybar"
  desc "Flutter-powered status bar for yabai"
  homepage "https://github.com/SubiqT/jaybar"

  app "jaybar.app"

  zap trash: [
    "~/Library/LaunchAgents/com.jaybar.plist",
  ]
end
