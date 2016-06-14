#!/bin/sh
git clone --depth 1 --no-single-branch https://github.com/2600hz/kazoo-sounds /opt/kazoo-sounds
sup kazoo_media_maintenance import_prompts /opt/kazoo-sounds/kazoo-core/en/us en-us
