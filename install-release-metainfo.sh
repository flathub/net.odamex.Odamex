#!/bin/bash

# Exit if any command fails
set -e

# Echo all commands for debug purposes
set -x

releasesDir=/app/share/metainfo/releases
releasesFile=net.odamex.Odamex.releases.xml

install -Dm644 "$releasesFile" "${releasesDir}/${releasesFile}"

sed -i ':a;N;$!ba;s#<releases[^>]*>.*</releases>#<releases type="external"/>#s' \
  "${releasesDir}/${releasesFile}"