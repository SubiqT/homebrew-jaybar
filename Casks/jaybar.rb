cask "jaybar" do
  version "1.0.11"
  sha256 "8b9be3781aaf99ea773c0894dced41e7584bd56e95a2987d385a27e1cafd551f"

  url "https://github.com/SubiqT/jaybar/releases/download/v#{version}/jaybar-#{version}-macos.zip"
  name "jaybar"
  desc "Flutter-powered status bar for yabai"
  homepage "https://github.com/SubiqT/jaybar"

  app "jaybar.app"

  postflight do
    system_command "#{appdir}/jaybar.app/Contents/MacOS/jaybar",
                   args: ["--enable-service"]
    system_command "#{appdir}/jaybar.app/Contents/MacOS/jaybar",
                   args: ["--start-service"]
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
