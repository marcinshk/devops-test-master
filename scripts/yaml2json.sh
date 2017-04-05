#!/bin/bash

npm list yamljs > /dev/null 2>&1
if [[ $? -ne 0 ]]; then
  npm install -g yamljs
fi

YAML_FILES=$(find content-yaml -name "*.yml")
PREFIX="devops-test/content"

mkdir -p ${PREFIX}

for YAML_FILE in ${YAML_FILES}; do
  DIR_NAME=$(echo ${YAML_FILE} | cut -d '/' -f2)
  CLEAN_NAME=$(echo ${YAML_FILE} | cut -d '/' -f3 | tr -d '.yml')
  TARGET_DIR="${PREFIX}/${DIR_NAME}"
  JSON_FILE="${TARGET_DIR}/${CLEAN_NAME}.json"

  if [[ ! -d ${TARGET_DIR} ]]; then
    mkdir -p ${TARGET_DIR}
  fi

  yaml2json -p ${YAML_FILE} > ${JSON_FILE}

done
