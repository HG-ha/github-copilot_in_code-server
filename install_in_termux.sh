echo "Updating packages..."
pkg update -y || { echo "Failed to update packages"; exit 1; }

echo "Installing tur-repo..."
pkg install tur-repo || { echo "Failed to install tur-repo"; exit 1; }

echo "Checking if code-server is already installed..."
if ! command -v code-server &> /dev/null
then
    echo "code-server not found, installing..."
    pkg install code-server || { echo "Failed to install code-server"; exit 1; }
else
    echo "code-server is already installed"
fi

echo "Downloading GitHub Copilot extension..."
curl -L -o copilot-1.271.0.vsix https://ghproxy.cn/https://github.com/HG-ha/github-copilot_in_code-server/raw/main/copilot-1.271.0.vsix || { echo "Failed to download copilot extension"; exit 1; }

echo "Installing GitHub Copilot extension..."
code-server --install-extension copilot-1.271.0.vsix || { echo "Failed to install copilot extension"; exit 1; }

echo "Setup completed successfully!"
