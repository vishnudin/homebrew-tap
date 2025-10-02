class K8sFileTransfer < Formula
  desc "GUI application for transferring files between local machine and Kubernetes pods"
  homepage "https://github.com/vishnudin/k8s-file-transfer"
  version "1.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/vishnudin/k8s-file-transfer/releases/download/v1.0.1/Kubernetes.File.Transfer-1.0.1-mac.zip"
      sha256 "5c46482ca64c6e25ae9cbbf5ac985c92db01a4c219bd633b9bc7fd9fa39db5ca"
    else
      url "https://github.com/vishnudin/k8s-file-transfer/releases/download/v1.0.1/Kubernetes.File.Transfer-1.0.1-arm64-mac.zip"
      sha256 "14342a44e95d7612995f32f03cc4b71bc6278566cc506e1e9f39c481cd3bba31"
    end
  end

  depends_on "kubectl"

  def install
    # Install all contents to prefix (Homebrew extracts into the .app directory)
    prefix.install Dir["*"]
    
    # Create a command line launcher script
    (bin/"k8s-file-transfer").write <<~EOS
      #!/bin/bash
      exec "#{prefix}/Contents/MacOS/Kubernetes File Transfer" "$@"
    EOS
  end

  def caveats
    <<~EOS
      To use k8s-file-transfer, you need:
      1. kubectl installed and configured with access to your Kubernetes clusters
      2. Proper permissions to list pods and execute kubectl cp commands

      The application has been installed to:
        #{prefix}

      You can launch it with:
        k8s-file-transfer

      Or open it directly:
        open "#{prefix}"

      For more information, visit: https://github.com/vishnudin/k8s-file-transfer
    EOS
  end

  test do
    assert_predicate prefix/"Contents", :exist?
    assert_predicate prefix/"Contents/MacOS/Kubernetes File Transfer", :exist?
    assert_predicate bin/"k8s-file-transfer", :exist?
  end
end
