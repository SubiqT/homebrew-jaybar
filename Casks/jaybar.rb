cask "jaybar" do
  version "1.1.7"
  sha256 "5fa003e0afceb716a45ab18b0894b96cb9fc2568606e0f296f2a51f3d70cb6ad"

  url "https://github.com/SubiqT/jaybar/releases/download/v#{version}/jaybar-#{version}-macos.zip"
  name "jaybar"
  desc "Flutter-powered status bar for yabai"
  homepage "https://github.com/SubiqT/jaybar"

  app "jaybar.app"

  postflight do
    system_command "#{appdir}/jaybar.app/Contents/MacOS/jaybar",
                   args: ["--enable-service"]
  end

  uninstall_postflight do
    system_command "launchctl",
                   args: ["unload", "#{Dir.home}/Library/LaunchAgents/com.jaybar.plist"],
                   sudo: false
  end

  zap trash: [
    "~/Library/LaunchAgents/com.jaybar.plist",
  ]
end
