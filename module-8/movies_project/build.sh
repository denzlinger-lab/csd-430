#!/bin/bash
set -e

# Define directories
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC_DIR="$PROJECT_DIR/src/main/java"
WEB_INF_DIR="$PROJECT_DIR/src/main/webapp/WEB-INF"
CLASSES_DIR="$WEB_INF_DIR/classes"
LIB_DIR="$WEB_INF_DIR/lib"

echo "=== Building movies_project for Module 7 ==="

# Create classes folder if it doesn't exist
mkdir -p "$CLASSES_DIR"

# Local MySQL Connector path
MYSQL_JAR="$LIB_DIR/mysql-connector-j-8.2.0.jar"
if [ ! -f "$MYSQL_JAR" ]; then
    echo "Error: MySQL Connector JAR not found in $LIB_DIR"
    exit 1
fi

# Tomcat Servlet API path
TOMCAT_LIB="/opt/homebrew/opt/tomcat/libexec/lib/servlet-api.jar"
if [ ! -f "$TOMCAT_LIB" ]; then
    echo "Error: Tomcat servlet-api.jar not found at $TOMCAT_LIB"
    echo "Please make sure Tomcat is installed via homebrew."
    exit 1
fi

echo "Compiling Java files..."
# Find all Java source files under src/main/java and compile them
find "$SRC_DIR" -name "*.java" > sources.txt
javac -d "$CLASSES_DIR" \
      -cp "$TOMCAT_LIB:$MYSQL_JAR" \
      @sources.txt

rm sources.txt

echo "Compilation successful. Classes are stored in $CLASSES_DIR."
