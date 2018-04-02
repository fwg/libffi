#!/bin/sh

make check

result=$?

cat `find ./ -name libffi.log`

exit $result