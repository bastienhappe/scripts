#!/bin/bash

find . -maxdepth 1 -type d -name 'test*'  | \
  xargs -0 ./submit-test.sh
