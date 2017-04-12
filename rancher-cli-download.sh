#!/bin/bash

source /.dockerenv

# $github_token set at docker build time via: --build-arg github_token=
URL=$(curl -H "Authorization: token $github_token" -s https://api.github.com/repos/rancher/cli/releases/latest | jq -r ".assets[] | select(.name | contains(\"linux-amd64\")) | select(.content_type | contains(\"gzip\")) | .browser_download_url")

wget $URL
