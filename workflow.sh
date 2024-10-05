#!/usr/bin/env bash

echo $PWD >> $EDITO_INFRA_OUTPUT/text.csv
cd $( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
echo $PWD >> $EDITO_INFRA_OUTPUT/text.csv
echo $ROOT_PROJECT_DIRECTORY >> $EDITO_INFRA_OUTPUT/text.csv