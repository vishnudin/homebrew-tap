# Homebrew Tap for vishnudin

This is a Homebrew tap containing formulas for various tools.

## Installation

```bash
brew tap vishnudin/tap
```

## Available Formulas

### k8s-file-transfer

A desktop application for easy file transfers with Kubernetes pods.

```bash
brew install k8s-file-transfer
```

**Features:**
- Bidirectional file transfer with K8s pods
- Multi-container support with automatic detection
- Real-time progress tracking and transfer history
- Clean interface built with Electron + React + Material-UI
- Custom transfer icon with professional branding

**Prerequisites:**
- kubectl installed and configured
- Access to a Kubernetes cluster

**Supported Platforms:**
- macOS (Intel and Apple Silicon)
- Windows and Linux support coming soon

## Usage

After installation, launch the application:
```bash
# The app will be installed to /Applications on macOS
open "/Applications/Kubernetes File Transfer.app"
```

Or find it in your Applications folder and double-click to launch.

## Features in Detail

- **Drag & Drop**: Simply drag files to upload or select download location
- **Multi-Container Pods**: Automatically detects and lets you choose containers
- **Progress Tracking**: Real-time progress bars and transfer history
- **Namespace Support**: Works with any Kubernetes namespace you have access to
- **Error Handling**: Clear error messages and retry capabilities

## Requirements

- macOS 10.15 or later
- kubectl installed and configured
- Valid kubeconfig with cluster access

## Issues

Please report issues at: https://github.com/vishnudin/k8s-file-transfer/issues

## Contributing

Contributions welcome! See the main repository for guidelines.

## License

MIT License - see the main repository for details.
