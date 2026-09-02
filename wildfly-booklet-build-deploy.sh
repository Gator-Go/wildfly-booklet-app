#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"   # ~/wildfly
APP="$ROOT/wildfly-booklet-app"
BUILDER="$ROOT/wildfly-builder"

cd "$BUILDER"
git pull

cd "$ROOT"
cp -R "$BUILDER"/* "$APP"

cd "$APP"
git pull

if [[ -f update_and_commit.sh ]]; then
  sed -i 's/\r$//' update_and_commit.sh
  ./update_and_commit.sh
fi

rm -rf booklet
groovy WildFlyBuilder

cd Extender
groovy BookletExtender

cd ../booklet
mvn clean package -e wildfly:deploy