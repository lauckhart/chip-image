# @license
# Copyright 2024-2026 Greg Lauckhart
# SPDX-License-Identifier: Apache-2.0

set -e

export CHIP_IMAGE=ghcr.io/lauckhart/chip-image
if [ -n "$(docker images -q $CHIP_IMAGE)" ]; then
    export CHIP_ARCH=$(docker inspect --format '{{ .Architecture }}' $CHIP_IMAGE)
else
    # Adjust for ARM if we ever publish those images
    export CHIP_ARCH=amd64
fi
export CHIP_PLATFORM="linux/$CHIP_ARCH"
export CHIP_DIR=$(dirname "$(realpath "$(dirname "${BASH_SOURCE[0]}")")")
