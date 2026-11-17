#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
mkdir -p dist
# Debian metadata is in debian-package/DEBIAN.
dpkg-deb --build --root-owner-group debian-package "dist/keygen-mail_1.0.3_all.deb"
echo "Built: dist/keygen-mail_1.0.3_all.deb"
