#!/usr/bin/env bash

echo $@ >> $EDITO_INFRA_OUTPUT/f0.csv
echo $PWD >> $EDITO_INFRA_OUTPUT/f0.csv
ls -al >> $EDITO_INFRA_OUTPUT/f0.csv

git clone --depth 1 -b Run_DC_on_Edito https://github.com/ocean-data-challenges/2023a_SSH_mapping_OSE

echo $PWD >> $EDITO_INFRA_OUTPUT/f1.csv
ls -al >> $EDITO_INFRA_OUTPUT/f1.csv

cd 2023a_SSH_mapping_OSE

echo $PWD >> $EDITO_INFRA_OUTPUT/f2.csv
ls -al >> $EDITO_INFRA_OUTPUT/f2.csv
:'
papermill -k python3  ../download_and_acces_global_data.ipynb $EDITO_INFRA_OUTPUT/download_and_acces_global_data_output.ipynb -p method $1 -p url $2

echo $PWD >> $EDITO_INFRA_OUTPUT/f3.csv
ls -al >> $EDITO_INFRA_OUTPUT/f3.csv

ln -s ../data data

echo $PWD >> $EDITO_INFRA_OUTPUT/f4.csv
ls -al >> $EDITO_INFRA_OUTPUT/f4.csv

cd nb_diags_global

echo $PWD >> $EDITO_INFRA_OUTPUT/f5.csv
ls -al >> $EDITO_INFRA_OUTPUT/f5.csv

papermill -k python3 ssh_scores_template.ipynb -p method_name $1 -p method_path ../$1.nc $EDITO_INFRA_OUTPUT/ssh_scores_$1_edito.ipynb
papermill -k python3 uv_scores_template.ipynb -p method_name $1 -p method_path ../$1.nc $EDITO_INFRA_OUTPUT/uv_scores_$1_edito.ipynb
papermill -k python3 uv_traj_template.ipynb -p method_name $1 -p method_path ../$1.nc $EDITO_INFRA_OUTPUT/uv_traj_$1_edito.ipynb

echo $PWD >> $EDITO_INFRA_OUTPUT/f6.csv
ls -al >> $EDITO_INFRA_OUTPUT/f6.csv
'
