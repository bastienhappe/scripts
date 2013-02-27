#!/bin/bash

# Submit a single test

cd $1
if [ -x ./run.sh ]; then
  echo "*** Starting test $1"
  ./run.sh
  echo "*** End of test $1"
else
  echo "*** Test $1 is not available, skipping."
fi
