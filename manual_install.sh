# Install datree if it isn't installed
if ! command -v datree &> /dev/null; then
    echo "Datree is not installed on your machine, proceeding to install..."
    curl https://get.datree.io | /bin/bash
fi

curl -L -O https://github.com/datreeio/kubectl-datree/releases/latest/download/kubectl-datree.zip 2> /dev/null

PACKAGE_NAME="kubectl-datree.zip"
PLUGIN_EXEC_NAME="kubectl-datree"

mkdir tmpDatree
unzip $PACKAGE_NAME -d tmpDatree > /dev/null

sudo cp tmpDatree/$PLUGIN_EXEC_NAME /usr/local/bin/$PLUGIN_EXEC_NAME

rm -rf tmpDatree && rm -rf $PACKAGE_NAME

if [ -f /usr/local/bin/$PLUGIN_EXEC_NAME ]; then
    echo "Plugin installed successfully"
else
    echo "Error occurred, please open a ticket in the github repository for assistance: https://github.com/datreeio/kubectl-datree"
fi
