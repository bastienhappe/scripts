#!/bin/bash

find . -type d -name 'test*' -maxdepth 1  | \
  xargs -0 ./submit-test.sh
