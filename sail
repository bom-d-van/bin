#!/usr/bin/env bash
#
# sail is a tool for marking begin
#

set -e

START=$(date +%s)

echo "sail: ------ $(date)"
commands=${@}
sh -c "${commands}"
END=$(date +%s)
DIFF=$(( $END - $START ))
echo "sail: took ${DIFF}s"
# echo "sail: done"
