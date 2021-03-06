#!/usr/bin/env bash
trap 'exit' ERR     # Exit immediately if any command fails (better than 'set -e')
set -u              # Using undefined variables is an error. Exit immediately

die() { echo -e "FATAL:" "$@"; exit 1; }
type kompile >/dev/null || die 'kompile not in $PATH'

dir="$(dirname "$0")"/..

set -x
kompile --syntax-module VYPER-ABSTRACT-SYNTAX "$dir"/vyper-lll/vyper-lll-post.k
kompile --syntax-module LLL-EVM-INTERFACE     "$dir"/lll-evm/lll-evm.k
