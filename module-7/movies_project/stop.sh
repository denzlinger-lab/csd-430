#!/bin/bash
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BASE_DIR="$PROJECT_DIR/tomcat-base"

echo "=== Stopping Tomcat server ==="
export CATALINA_BASE="$BASE_DIR"
/opt/homebrew/bin/catalina stop
