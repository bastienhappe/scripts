#!/bin/bash

find . -type d -name 'test*' -maxdepth 0 -print 0 | \
  xargs -0 ./submit-test.sh
