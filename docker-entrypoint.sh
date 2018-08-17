#!/bin/bash -e

cat settings.json | jsmin | jq "$SETTINGS_MODIFIER" > settings.json

exec "$@"
