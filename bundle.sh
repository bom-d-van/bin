#!/bin/sh
## Bundle --  put listed files into a bundle on stdout which sh will unbundle
# From "The UNIX Programming Environment," by Brian Kernighan and
#   Rob Pike, Prentice Hall, 1984.
echo "# To unbundle, sh this file"
for i
do
  echo "echo $i 1>&2"
  echo "cat >$i <<'End of $i'"
  cat $i
  echo "End of $i"
done