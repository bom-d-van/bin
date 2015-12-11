#!/usr/bin/env bash

set -e

# cd grm-tests

expect_output="----------------------------
name=grm-tests
go install
running grm-tests
b
a"

printf 'grm: '
if diff <(grm) <(echo "$expect_output"); then
	echo .
fi

expect_output="----------------------------
name=grm-tests
go build -o /Users/bom_d_van/Code/go/workspace/bin/grm-tests  a.go
running grm-tests
a"

printf 'grm a.go: '
if diff <(grm a.go) <(echo "$expect_output"); then
	echo .
fi

expect_output="----------------------------
name=grm-tests
go build -o /Users/bom_d_van/Code/go/workspace/bin/grm-tests  a.go c.go
running grm-tests
c
a"

printf 'grm a.go c.go: '
if diff <(grm a.go c.go) <(echo "$expect_output"); then
	echo .
fi

expect_output="----------------------------
name=test-run
build_options=-tags ctag
go build -o /Users/bom_d_van/Code/go/workspace/bin/test-run
running test-run
b
c
a"

printf "grm -n test-run -b '-tags ctag': "
if diff <(grm -n test-run -b '-tags ctag') <(echo "$expect_output"); then
	echo .
fi
