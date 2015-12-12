#!/usr/bin/env bash

set -e

# cd grm-tests

function fmt_output {
	cat | sed 's/ $//g' # remove trailing spaces from "running grm-tests"
}

expect_output="----------------------------
name=grm-tests
go install
running grm-tests
b
a"

printf 'grm: '
if diff <(grm | fmt_output) <(echo "$expect_output"); then
	echo .
fi

expect_output="----------------------------
name=grm-tests
files=a.go
go build -o /Users/bom_d_van/Code/go/workspace/bin/grm-tests  a.go
running grm-tests
a"

printf 'grm a.go: '
if diff <(grm a.go | fmt_output) <(echo "$expect_output"); then
	echo .
fi

expect_output="----------------------------
name=grm-tests
files=a.go c.go
arguments=-arg1 test
go build -o /Users/bom_d_van/Code/go/workspace/bin/grm-tests  a.go c.go
running grm-tests -arg1 test
c
a
args: -arg1 test"

printf 'grm a.go c.go -arg1 test: '
if diff <(grm a.go c.go -arg1 test | fmt_output) <(echo "$expect_output"); then
	echo .
fi

expect_output="----------------------------
name=grm-tests
files=a.go c.go
go build -o /Users/bom_d_van/Code/go/workspace/bin/grm-tests  a.go c.go
running grm-tests
c
a"

printf 'grm a.go c.go: '
if diff <(grm a.go c.go | fmt_output) <(echo "$expect_output"); then
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
if diff <(grm -n test-run -b '-tags ctag' | fmt_output) <(echo "$expect_output"); then
	echo .
fi
