#!/bin/bash

set -e

# Compile drawio files to SVG (if draw.io CLI is installed)
if command -v drawio &> /dev/null; then
    for f in src/*.drawio; do
        if [ -f "$f" ]; then
            echo "Compiling $f to SVG..."
            drawio --export --format svg --output "${f%.drawio}.svg" "$f"
        fi
    done
else
    if ls src/*.drawio 1> /dev/null 2>&1; then
        echo "Warning: draw.io CLI not found. Skipping diagram compilation."
        echo "Install with: brew install drawio (macOS) or download from https://github.com/jgraph/drawio-desktop"
    fi
fi

# Build slides with mdslides
echo "Building slides..."
mdslides --output-dir ./html --template ./template.html

# Rename output to index.html
# Note: mdslides outputs HTML with same name as the .md file (e.g., slides.md → slides.html)
# We rename to index.html for easier serving
for f in html/*.html; do
    if [ "$f" != "html/index.html" ]; then
        echo "Renaming $f to index.html"
        mv "$f" html/index.html
        break
    fi
done

# Copy SVG files to output
if ls src/*.svg 1> /dev/null 2>&1; then
    echo "Copying SVG files..."
    cp src/*.svg ./html/
fi

# Copy demo folders (add your demos here)
# Example:
# cp -R demos/my-demo html/demos/

echo "Build complete! Serve with: python -m http.server 8000 -d html/"
