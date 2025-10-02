class K8sFileTransfer < Formula
  desc "GUI application for transferring files between local machine and Kubernetes pods"
  homepage "https://github.com/vishnudin/k8s-file-transfer"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/vishnudin/k8s-file-transfer/releases/download/v1.0.0/Kubernetes.File.Transfer-1.0.0-mac.zip"
      sha256 "247410f2bd8144c4f041678ff160506b2be5fd14ffbd4500e885337151ebd9c5"
    else
      url "https://github.com/vishnudin/k8s-file-transfer/releases/download/v1.0.0/Kubernetes.File.Transfer-1.0.0-arm64-mac.zip"
      sha256 "82193203c9252918f1cf26af05b390f1af35e5c66bb0e34b97f21b973e0078cc"
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
