#!/bin/bash
set -e

echo "Scanning repository for suspicious commands..."

if grep -R -E 'curl[[:space:]].*\|[[:space:]]*sh|wget[[:space:]].*\|[[:space:]]*sh|base64[[:space:]].*\|[[:space:]]*sh|eval[[:space:]]*\(|bash[[:space:]]*<\(' \
    . \
    --exclude-dir=.git \
    --exclude-dir=.github \
    --exclude=README.md
then
    echo "Potentially dangerous command detected."
    exit 1
fi

echo "Repository is clean."
