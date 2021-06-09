#!/usr/bin/env bash

set -euo pipefail

# Include here files that shfmt can't detect.
ADDITIONAL_FILES=(
	"tag-bash/bashrc"
	"tag-bash/profile"
	"tag-neofetch/config/neofetch/config.conf"
	"rcrc"
)

# Error with diff in CI, format everywhere else.
ARGS=""
if [[ ! -z "${CI:-}" ]]; then
	ARGS+="-d"
else
	ARGS+="-w"
fi

shfmt "$ARGS" "${ADDITIONAL_FILES[@]}" .
