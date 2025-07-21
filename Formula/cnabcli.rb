class Cnabcli < Formula
  desc "CLI tool for parsing CNAB files and converting them to CSV format"
  homepage "https://github.com/Kanastra-Tech/homebrew-cnabcli"
  url "https://github.com/Kanastra-Tech/homebrew-cnabcli/releases/download/v1.0.0/cnab-cli-1.0.0.tar.gz"
  sha256 "c870d18deb495e54612ef6517db0631e68c08047b09cf8d657b14bb84a42bd50"
  license "MIT"
  version "1.0.0"

  def install
    # Install the pre-built binary
    bin.install "cnab" => "cnab"
    
    # Make sure it's executable
    chmod 0755, bin/"cnab"
  end

  test do
    assert_match "A CLI tool for parsing CNAB files", shell_output("#{bin}/cnab --help")
    assert_match "parse-cnab", shell_output("#{bin}/cnab --help")
    
    # Test parse-cnab command help
    assert_match "Parse CNAB file and convert to CSV", shell_output("#{bin}/cnab parse-cnab --help")
  end
end