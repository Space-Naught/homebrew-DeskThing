class Testthingmac < Formula
  desc "DeskThing for Mac - Manual SHA256 Formula"
  homepage "https://github.com/ItsRiprod/TestThing"
  version "0.10.76"
  license "Proprietary"

  if Hardware::CPU.intel?
    # For Intel Macs (x64)
    url "https://github.com/ItsRiprod/TestThing/releases/download/v0.10.76/DeskThing-0.10.76-mac.zip"
    sha256 "44e010d962a471bb4a83922c6b1c0e3ecbc741d55cea374ac9295098feae1d95"
  else
    # For ARM Macs (mac)
    url "https://github.com/ItsRiprod/TestThing/releases/download/v0.10.76/DeskThing-0.10.76-arm64-mac.zip"
    sha256 "a2390ae2229228678afa21486f0e502648a543ec103df730b93472ef88ba423e"
  end

  # Prevent Homebrew from attempting to fix linkage
  def self.bottle
    nil
  end

  def install
    if cached_download.to_s.end_with?(".dmg")
      # Handle .dmg installation
      system "hdiutil", "attach", cached_download, "-mountpoint", "/Volumes/DeskThing"
      system "cp", "-R", "/Volumes/DeskThing/DeskThing.app", prefix
      system "hdiutil", "detach", "/Volumes/DeskThing"
    else
      # Handle .zip installation
      system "unzip", cached_download, "-d", "DeskThingExtracted"
      app_path = Dir["DeskThingExtracted/*.app"].first
      raise "Application not found in extracted zip archive!" unless app_path
      prefix.install app_path
    end
  end

  def caveats
    <<~EOS
      DeskThing.app was installed to:
        #{opt_prefix}/DeskThing.app

      To use it, you may need to move it to /Applications:
        mv #{opt_prefix}/DeskThing.app /Applications
    EOS
  end

  test do
    assert_predicate prefix/"DeskThing.app", :exist?, "DeskThing.app was not installed to the prefix directory"
  end
end
