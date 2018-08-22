#!/bin/bash -e

CONFIG=$(cat settings.json | jsmin | jq "${SETTINGS_MODIFIER}")
echo $CONFIG > settings.json

exec "$@"
