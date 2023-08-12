#!/bin/bash
set -e
REPO_NAME=dog_cat_mlops
LOCAL_REPO_DIRECTORY=$HOME
echo "Debug directory: $LOCAL_REPO_DIRECTORY"
REPO_OWNER=liamnguyen97

cd $LOCAL_REPO_DIRECTORY
echo "Current working dir: $PWD"
if [[ ! -d "$REPO_NAME" ]]
then 
    echo "Vo day rui ne"
    git clone https://github.com/$REPO_OWNER/$REPO_NAME
    conda create -n training_env
    conda activate training_env
    conda env list
    conda install pip -n training_env
    $HOME/conda/envs/training_env/bin/pip install -r $LOCAL_REPO_DIRECTORY/$REPO_NAME/ml/requirements.txt --no-cache-dir
else
    conda create -n training_env
    conda activate training_env
    conda env list
    conda install pip -n training_env
    $HOME/conda/envs/training_env/bin/pip install -r $LOCAL_REPO_DIRECTORY/$REPO_NAME/ml/requirements.txt --no-cache-dir

fi

echo "Current working dir: $PWD"
conda activate training_env
echo "Need to download db first"
groupadd docker
usermod -aG docker $USER
su -s ${USER}
systemctl start docker