#!/bin/bash

<<<<<<< HEAD
find . -maxdepth 1 -type d  -name 'test*'  | \
=======
find . -type d -name 'test*' -maxdepth 0 -print 0 | \
>>>>>>> a629f690f8119b2a3b8d9954b76e6d8f762d64ef
  xargs -0 ./submit-test.sh
