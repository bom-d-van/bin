#!/usr/bin/env bash

# echo `find . -type d -not -path '*/.git/*' | grep $1 | head -1`
cd `find . -type d -not -path '*/.git/*' | grep $1 | head -1`
