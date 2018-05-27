#!/usr/bin/env bash

cd "${0%/*}" || exit 127
cd ../priv/mmdb2

gzip -fk Geolix.mmdb
tar -cf Geolix.mmdb.tar Geolix.mmdb
tar -czf Geolix.mmdb.tar.gz Geolix.mmdb
