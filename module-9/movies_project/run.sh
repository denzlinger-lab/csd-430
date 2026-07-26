#!/bin/bash
set -e

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BASE_DIR="$PROJECT_DIR/tomcat-base"

echo "=== Running movies_project validation & setup ==="

# First compile Java classes
"$PROJECT_DIR/build.sh"

echo "Preparing local tomcat-base..."
mkdir -p "$BASE_DIR/conf" "$BASE_DIR/logs" "$BASE_DIR/temp" "$BASE_DIR/webapps" "$BASE_DIR/work"

# Copy Tomcat default config files if not already copied
if [ ! -f "$BASE_DIR/conf/server.xml" ]; then
    echo "Copying default configurations from global Tomcat..."
    cp -R /opt/homebrew/opt/tomcat/libexec/conf/* "$BASE_DIR/conf/"
fi

# Clean and symlink the webapp to webapps/movies_project
rm -rf "$BASE_DIR/webapps/movies_project"
ln -s "$PROJECT_DIR/src/main/webapp" "$BASE_DIR/webapps/movies_project"

echo "Starting Tomcat..."
# Set CATALINA_BASE pointing to our local folder, and run startup
export CATALINA_BASE="$BASE_DIR"
/opt/homebrew/bin/catalina run
