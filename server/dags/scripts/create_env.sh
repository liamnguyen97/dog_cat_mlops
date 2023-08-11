#!/bin/bash
set -e
REPO_NAME=dog_cat_mlops
LOCAL_REPO_DIRECTORY=$HOME
REPO_OWNER=liamnguyen97

cd $LOCAL_REPO_DIRECTORY
if [ ! -d "$LOCAL_REPO_DIRECTORY/$REPO_NAME"]
then 
    git clone https://github.com/$REPO_OWNER/$REPO_NAME
    conda create -n training_env
    conda activate training_env
    conda env list
    conda install pip -n training_env
    $HOME/conda/envs/training_env/bin/pip install -r $LOCAL_REPO_DIRECTORY/$REPO_NAME/requirements.txt --no-cache-dir
    echo 0
    exit 0
fi

echo "Current working dir: $PWD"
conda activate training_env
echo "Need to download db first"