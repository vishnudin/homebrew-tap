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
    # For macOS apps, we use the app directive instead of manual installation
  end

  app "Kubernetes File Transfer.app"

  def caveats
    <<~EOS
      To use k8s-file-transfer, you need:
      1. kubectl installed and configured with access to your Kubernetes clusters
      2. Proper permissions to list pods and execute kubectl cp commands

      The application has been installed to your Applications folder.
      Launch it from Launchpad or Applications folder.

      For more information, visit: https://github.com/vishnudin/k8s-file-transfer
    EOS
  end

  test do
    assert_predicate "/Applications/Kubernetes File Transfer.app", :exist?
  end
end
