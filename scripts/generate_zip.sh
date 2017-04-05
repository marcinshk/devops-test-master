#!/bin/bash

ZIP="devops-test/test.zip"

if [[ -f ${ZIP} ]]; then
  rm -f ${ZIP}
fi

zip -r ${ZIP} devops-test -x "devops-test/test.zip" -x "devops-test/README.md"
